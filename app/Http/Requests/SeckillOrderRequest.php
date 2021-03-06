<?php

namespace App\Http\Requests;

use App\Models\Order;
use App\Models\Product;
use App\Models\ProductSku;
use Illuminate\Auth\AuthenticationException;
use App\Exceptions\InvalidRequestException;

class SeckillOrderRequest extends Request
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            // 将原版的 address_id 校验删除，替换为检查单项，减少数据库查询
            'address.province' => 'required',
            'address.city' => 'required',
            'address.district' => 'required',
            'address.address' => 'required',
            'address.zip' => 'required',
            'address.contact_name' => 'required',
            'address.contact_phone' => 'required',
            'sku_id' => [
                'required',
                function ($attribute, $value, $fail) {
                    // 从缓存中读取数据
                    $stock = \Redis::get('seckill_sku_' . $value);
                    if (is_null($stock)) {
                        return $fail('该商品不存在');
                    }
                    if ($stock < 1) {
                        return $fail('该商品已售完');
                    }

                    // 上面两个条件已经拒绝了大量用户
                    $sku = ProductSku::find($value);
                    if ($sku->product->type !== Product::TYPE_SECKILL) {
                        return $fail('该商品不支持秒杀');
                    }
                    if ($sku->product->seckill->is_before_start) {
                        return $fail('秒杀尚未开始');
                    }
                    if ($sku->product->seckill->is_after_end) {
                        return $fail('秒杀已经结束');
                    }
                    if (!$sku->product->on_sale) {
                        return $fail('该商品未上架');
                    }

                    // 延迟检查用户登录
                    if (!$user = \Auth::user()) {
                        throw new AuthenticationException('请先登录');
                    }
                    if (!$user->email_verified) {
                        throw new InvalidRequestException('请先验证邮箱');
                    }

                    if ($order = Order::query()
                        // 筛选出当前用户的订单
                        ->where('user_id', $this->user()->id)
                        ->whereHas('items', function ($query) use ($value) {
                            // 筛选出包含当前 SKU 的订单
                            $query->where('product_sku_id', $value);
                        })->where(function ($query) {
                            // 已支付或者未关闭的订单
                            $query->whereNotNull('paid_at')
                                ->orWhere('closed', false);
                        })
                        ->first()) {
                        if ($order->paid_at) {
                            return $fail('您已经抢购了该商品');
                        }

                        return $fail('您已经下单了该商品，请到订单页面支付');
                    }
                }
            ],
        ];
    }
}
