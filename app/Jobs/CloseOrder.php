<?php

namespace App\Jobs;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class CloseOrder implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $order;

    /**
     * CloseOrder constructor.
     *
     * @param Order $order
     * @param $delay
     * @return void
     */
    public function __construct(Order $order, $delay)
    {
        $this->order = $order;
        // 设置延迟的时间，delay() 方法的参数代表多少秒后执行
        $this->delay($delay);
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // 如果已经支付则不需要关闭订单
        if ($this->order->paid_at) {
            return;
        }
        // 通过事务执行 sql
        \DB::transaction(function () {
            // 订单关闭状态更新为 true
            $this->order->update(['closed' => true]);
            // 循环遍历订单中的单品记录，将订单中的数量加回到 shu 的库存中
            foreach ($this->order->items as $item) {
                $item->productSku->addStock($item->amount);
                // 当前订单类型是秒杀订单，并且对应商品是上架，秒杀时间未结束
                if ($item->order->type === Order::TYPE_SECKILL
                    && $item->product->on_sale
                    && !$item->product->seckill->is_after_end) {
                    // 更新 Redis 中的库存 +1
                    \Redis::incr('seckill_sku_' . $item->productSku->id);
                }
            }

            if ($this->order->couponCode) {
                $this->order->couponCode->changeUsed(false);
            }
        });
    }
}
