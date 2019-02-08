<?php

namespace App\Jobs;

use App\Exceptions\InternalException;
use App\Models\Installment;
use App\Models\InstallmentItem;
use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

// ShouldQueue 表示这是一个异步任务
class RefundInstallmentOrder implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $order;

    /**
     * Create a new job instance.
     *
     * @param Order $order
     * @return void
     */
    public function __construct(Order $order)
    {
        $this->order = $order;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // 如果订单不是分期付款、订单未支付、订单退款状态不是退款中，则直接终止程序
        if ($this->order->payment_method !== 'installment'
            || !$this->order->paid_at
            || !$this->order->refund_status !== Order::REFUND_STATUS_PROCESSING) {
            return;
        }
        // 分期付款存在判断，保证嗲吗健壮性
        if (!$installment = Installment::query()->where('order_id', $this->order->id)->first()) {
            return;
        }
        // 遍历对应分期付款的所有还款计划
        foreach ($installment->items as $item) {
            // 如果未支付，或者退款状态是退款成功、退款中，则跳过
            if (!$item->paid_at || in_array($item->refund_status, [
                    InstallmentItem::REFUND_STATUS_SUCCESS,
                    InstallmentItem::REFUND_STATUS_PROCESSING,
                ])) {
                continue;
            }
            // 调用退款逻辑
            try {
                $this->refundInstallmentItem($item);
            } catch (\Exception $exception) {
                \Log::warning('分期付款退款失败：' . $exception->getMessage(), [
                    'installment_item_id' => $item->id,
                ]);
                // 如果报错，先跳过
                continue;
            }
        }
        $installment->refreshRefundStatus();
    }

    protected function refundInstallmentItem(InstallmentItem $item)
    {
        // 退款单号使用商品订单的退款号与当前还款计划的编号拼接
        $refundNo = $this->order->refund_no . '_' . $item->sequence;
        // 根据还款计划的支付方式执行对应的退款逻辑
        switch ($item->payment_method) {
            case 'wechat':
                app('wechat_pay')->refund([
                    'transaction_id' => $item->payment_no, // 这里我们使用微信订单号来退款
                    'total_fee'      => $item->total * 100, //原订单金额，单位分
                    'refund_fee'     => $item->base * 100, // 要退款的订单金额，单位分，分期付款的退款只退本金
                    'out_refund_no'  => $refundNo, // 退款订单号
                    // 微信支付的退款结果并不是实时返回的，而是通过退款回调来通知，因此这里需要配上退款回调接口地址
                    'notify_url'     => ngrok_url('installments.wechat.refund_notify'),
                ]);
                // 更新还款计划的退款状态为退款中
                $item->update([
                    'refund_status' => InstallmentItem::REFUND_STATUS_PROCESSING,
                ]);
                break;
            case 'alipay':
                $res = app('alipay')->refund([
                    'trade_no' => $item->payment_no, // 使用支付宝交易号来退款
                    'refund_amount' => $item->base, // 退款金额，单位元，只退还本金
                    'out_request_no' => $refundNo, // 退款订单号
                ]);
                // 根据支付宝的文档，如果返回值里有 sub_code 字段，则退款失败
                if ($res->sub_code) {
                    $item->update([
                        'refund_status' => InstallmentItem::REFUND_STATUS_FAILED,
                    ]);
                } else {
                    $item->update([
                        'refund_status' => InstallmentItem::REFUND_STATUS_SUCCESS,
                    ]);
                }
                break;
            default:
                throw new InternalException('未知订单支付方式：' . $item->payment_method);
                break;
        }
    }
}
