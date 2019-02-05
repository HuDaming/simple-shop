<?php

namespace App\Jobs;

use App\Models\CrowdfundingProduct;
use App\Models\Order;
use App\Services\OrderService;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class RefundCrowdfundingOrders implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $crowdfunding;

    /**
     * Create a new job instance.
     *
     * @param CrowdfundingProduct $crowdfunding
     * @return void
     */
    public function __construct(CrowdfundingProduct $crowdfunding)
    {
        $this->crowdfunding = $crowdfunding;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // 如果众筹状态不是失败则不执行退款
        if ($this->crowdfunding->status !== CrowdfundingProduct::STATUS_FAIL) {
            return;
        }
        // 众筹失败退款逻辑
        $orderService = app(OrderService::class);
        // 查询所有参与次众筹的订单
        Order::query()
            ->where('type', Order::TYPE_CROWDFUNDING) // 订单类型是众筹商品订单
            ->whereNotNull('paid_at') // 已支付订单
            ->whereHas('items', function ($query) {
                // 包含了当前商品
                $query->where('product_id', $this->crowdfunding->product_id);
            })
            ->get()
            ->each(function (Order $order) use ($orderService) {
                $orderService->refundOrder($order);
            });
    }
}
