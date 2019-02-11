<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\OrderItem;
use App\Services\CategoryService;
use Illuminate\Http\Request;
use App\Exceptions\InvalidRequestException;
use Illuminate\Pagination\LengthAwarePaginator;

class ProductsController extends Controller
{
    public function index(Request $request, CategoryService $categoryService)
    {
        $page = $request->input('page', 1);
        $perPage = 16;

        // 构造查询
        $params = [
            'index' => 'products',
            'type' => '_doc',
            'body' => [
                'from' => ($page - 1) * $perPage, // 计算偏移值
                'size' => $perPage,
                'query' => [
                    'bool' => [
                        'filter' => [
                            ['term' => ['on_sale' => true]],
                        ],
                    ],
                ],
            ],
        ];

        // 是否提交了 order 参数，如果有就使用 order 参数作为商品的排序字段
        if ($order = $request->input('order', '')) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串是以 price、sold_count、rating 3个字符串开始，是合法排序值
                if (in_array($m[1], ['price', 'sold_count', 'rating'])) {
                    // 根据传入的值排序
                    $params['body']['sort'] = [[$m[1] => $m[2]]];
                }
            }
        }

        if ($request->input('category_id') && $category = Category::find($request->input('category_id'))) {
            // 如果是一个父类目，筛选类目下的所有子类目
            if ($category->is_directory) {
                $params['body']['query']['bool']['filter'][] = [
                    'prefix' => ['category_path' => $category->path . $category->id . '-'],
                ];
            } else {
                // 否则直接通过 category_id 筛选
                $params['body']['query']['bool']['filter'][] = [
                    'term' => ['category_id' => $category->id],
                ];
            }
        }

        // 关键词搜索
        if ($search = $request->input('search', '')) {
            // 将关键词根据空格拆分成数组，并过滤掉空项
            $keywords = array_filter(explode(' ', $search));

            $params['body']['query']['bool']['must'] = [];
            // 遍历关键词数组，分别添加到 must 查询中
            foreach ($keywords as $keyword) {
                $params['body']['query']['bool']['must'][] = [
                    'multi_match' => [
                        'query' => $keyword,
                        'fields' => [
                            'title^2',
                            'long_title^2',
                            'category^2',
                            'description',
                            'skus_title',
                            'skus_description',
                            'properties_value',
                        ],
                    ],
                ];
            }
        }

        // 当用户输入了搜索词或者使用了类目筛选的时候才会做聚合
        if ($search || isset($category)) {
            $params['body']['aggs'] = [
                'properties' => [
                    'nested' => [
                        'path' => 'properties',
                    ],
                    'aggs' => [
                        'properties' => [
                            'terms' => [
                                'field' => 'properties.name',
                            ],
                            'aggs' => [
                                'value' => [
                                    'terms' => [
                                        'field' => 'properties.value',
                                    ],
                                ],
                            ],
                        ],
                    ],
                ],
            ];
        }

        // 从请求参数中获取 filters
        // 定义一个属性过滤数组
        $propertyFilters = [];
        if ($filtersString = $request->input('filters')) {
            // 将获取到的字符串用符号 | 拆分成数组
            $filterArray = explode('|', $filtersString);
            foreach ($filterArray as $filter) {
                // 将字符串用 : 拆分成两部分，分别赋值给 $name 和 $value
                list($name, $value) = explode(':', $filter);
                // 将筛选的属性添加到数组中
                $propertyFilters[$name] = $value;

                // 添加到 filter 类型中
                $params['body']['query']['bool']['filter'][] = [
                    // 由于筛选的是 nested 类型下的属性，因此需要用 nested 查询
                    'nested' => [
                        // 字段名
                        'path' => 'properties',
                        'query' => [
                            ['term' => ['properties.name' => $name]],
                            ['term' => ['properties.value' => $value]],
                        ],
                    ],
                ];
            }
        }

        $result = app('es')->search($params);

        $productIds = collect($result['hits']['hits'])->pluck('_id')->all();
        // 通过 whereIn 方法从数据库中获取商品数据
        $products = Product::query()
            ->whereIn('id', $productIds)
            // orderByRaw 可以使用原生的 SQL 来给结果排序
            ->orderByRaw(sprintf("FIND_IN_SET(id, '%s')", join(',', $productIds)))
            ->get();
        // 返回一个 LengthAwarePaginator 对象
        $pager = new LengthAwarePaginator($products, $result['hits']['total'], $perPage, $page, [
            'path' => route('products.index', false), // 构建分页 url
        ]);

        $properties = [];
        // 如果结果中有 aggregations 字段，说明做了分面搜索
        if (isset($result['aggregations'])) {
            // 返回值转为集合
            $properties = collect($result['aggregations']['properties']['properties']['buckets'])
                ->map(function ($buckets) {
                    // 通过 map 取出需要的字段
                    return [
                        'key' => $buckets['key'],
                        'values' => collect($buckets['value']['buckets'])->pluck('key')->all(),
                    ];
                })
                ->filter(function ($property) use ($propertyFilters) {
                    // 过滤掉只剩下一个值 或者 已经在筛选条件里的属性
                    return count($property['values']) > 1 && !isset($propertyFilters[$property['key']]);
                });
        }

        return view('products.index', [
            'products' => $pager,
            'filters' => [
                'search' => $search,
                'order' => $order,
            ],
            'category' => $category ?? null,
            'properties' => $properties,
            'propertyFilters' => $propertyFilters,
        ]);
    }

    public function show(Product $product, Request $request)
    {
        // 判断商品是否已上架，如果没有上架则抛出异常。
        if (!$product->on_sale) {
            throw new InvalidRequestException('商品未上架');
        }

        $favored = false;
        if ($user = $request->user()) {
            $favored = boolval($user->favoriteProducts()->find($product->id));
        }

        $reviews = OrderItem::query()
            ->with(['order.user', 'productSku'])
            ->where('product_id', $product->id)
            ->whereNotNull('reviewed_at')
            ->orderBy('reviewed_at', 'desc')
            ->limit(10)
            ->get();

        return view('products.show', [
            'product' => $product,
            'favored' => $favored,
            'reviews' => $reviews
        ]);
    }

    public function favor(Product $product, Request $request)
    {
        $user = $request->user();
        if ($user->favoriteProducts()->find($product->id)) {
            return [];
        }

        $user->favoriteProducts()->attach($product);

        return [];
    }

    public function disfavor(Product $product, Request $request)
    {
        $user = $request->user();
        $user->favoriteProducts()->detach($product);

        return [];
    }

    public function favorites(Request $request)
    {
        $products = $request->user()->favoriteProducts()->paginate(16);

        return view('products.favorites', ['products' => $products]);
    }
}
