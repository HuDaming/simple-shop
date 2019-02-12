<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Product extends Model
{
    const TYPE_NORMAL = 'normal';
    const TYPE_CROWDFUNDING = 'crowdfunding';

    public static $typeMap = [
        self::TYPE_NORMAL => '普通商品',
        self::TYPE_CROWDFUNDING => '众筹商品',
    ];

    protected $fillable = [
        'type', 'title', 'long_title', 'description', 'cover', 'on_sale',
        'rating', 'sold_count', 'review_count', 'price'
    ];

    protected $casts = [
        'on_sale' => 'boolean',
    ];

    public function toESArray()
    {
        // 只获取需要的字段
        $arr = array_only($this->toArray(), [
            'id', 'type', 'title', 'category_id', 'long_title',
            'on_sale', 'rating', 'sold_count', 'review_count', 'price',
        ]);

        // 如果商品有类目，则 category 字段为类目名数组，否则为空
        $arr['category'] = $this->category ? explode(' - ', $this->category->full_name) : '';
        // 类目的 path 字段
        $arr['category_path'] = $this->category ? $this->category->path : '';
        // 去掉描述中的 html 标签
        $arr['description'] = strip_tags($this->description);
        // 只取出需要的 SKU 字段
        $arr['skus'] = $this->skus->map(function (ProductSku $sku) {
            return array_only($sku->toArray(), ['title', 'description', 'price']);
        });
        // 只取出需要的 property 字段
        $arr['properties'] = $this->properties->map(function (ProductProperty $property) {
            // 增加一个 search_value 字段，用符号 : 将属性名和属性值拼接起来
            return array_merge(array_only($property->toArray(), ['name', 'value']), [
                'search_value' => $property->name . ':' . $property->value,
            ]);
        });

        return $arr;
    }

    public function skus()
    {
        return $this->hasMany(ProductSku::class);
    }

    public function getCoverUrlAttribute()
    {
        if (Str::startsWith($this->attributes['cover'], ['https://', 'http://'])) {
            return $this->attributes['cover'];
        }
        return \Storage::disk('admin')->url($this->attributes['cover']);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function crowdfunding()
    {
        return $this->hasOne(CrowdfundingProduct::class);
    }

    public function properties()
    {
        return $this->hasMany(ProductProperty::class);
    }

    public function getGroupedPropertiesAttribute()
    {
        return $this->properties
            // 按照属性名聚合
            ->groupBy('name')
            ->map(function ($properties) {
                return $properties->pluck('value')->all();
            });
    }

    public function scopeByIds($query, $ids)
    {
        return $query->whereIn('id', $ids)
            ->orderByRaw(sprintf("FIND_IN_SET(id, '%s')", join(',', $ids)));
    }
}
