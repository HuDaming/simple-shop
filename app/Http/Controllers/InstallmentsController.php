<?php

namespace App\Http\Controllers;

use App\Models\Installment;
use Illuminate\Http\Request;
use App\Exceptions\InvalidRequestException;

use App\Events\OrderPaid;
use Carbon\Carbon;

class InstallmentsController extends Controller
{
    public function index(Request $request)
    {
        $installments = Installment::query()
            ->where('user_id', $request->user()->id)
            ->paginate(10);

        return view('installments.index', ['installments' => $installments]);
    }

    public function show(Installment $installment)
    {
        $this->authorize('own', $installment);
        $items = $installment->items()->orderBy('sequence')->get();

        return view('installments.show', [
            'installment' => $installment,
            'items' => $items,
            'nextItem' => $items->where('paid_at', null)->first(),
        ]);
    }

    public function payByAlipay(Installment $installment)
    {
        if ($installment->order->closed) {
            throw new InvalidRequestException('对应商品订单已被关闭');
        }

        if ($installment->status === Installment::STATUS_FINISHED) {
            throw new InvalidRequestException('该分期订单已结清');
        }

        // 获取当前分期付款最近一个未支付的还款计划
        if (!$nextItem = $installment->items()->whereNull('paid_at')->orderBy('sequence')->first()) {
            // 如果没有未支付的还款
            throw new InvalidRequestException('该分期订单已结清');
        }

        // 调用支付宝的网页支付
        return app('alipay')->web([
            // 支付订单号使用分期流水号 + 还款计划号
            'out_trade_no' => $installment->no . '_' . $nextItem->sequence,
            'total_amount' => $nextItem->total,
            'subject' => '支付 Simple Shop 的分期订单：' . $installment->no,
            // 这里的 notify_url 和 return_url，可以覆盖掉在 AppServiceProvider 设置的回调地址
            'notify_url' => ngrok_url('installments.alipay.notify'),
            'return_url' => ngrok_url('installments.alipay.return'),
        ]);
    }

    // 支付宝前端回调
    public function alipayReturn()
    {
        try {
            app('alipay')->verify();
        } catch (\Exception $exception) {
            return view('pages.error', ['msg' => '数据不正确']);
        }

        return view('pages.success', ['msg' => '支付成功']);
    }

    // 支付宝异步通知
    public function alipayNotify()
    {
        // 校验支付宝回调参数
        $data = app('alipay')->verify();
        // 如果订单状态不是成功获取结束，终止程序
        if (!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
            return app('alipay')->success();
        }
        // 解析支付订单号获取分期流水号和还款计划编号
        list($no, $sequence) = explode('_', $data->out_trade_no);
        // 检查分期流水号对应的分期计划
        if (!$installment = Installment::where('no', $no)->first()) {
            return 'fail';
        }
        if (!$item = $installment->items()->where('sequence', $sequence)->first()) {
            return 'fail';
        }

        // 如果改还款计划的支付状态是已支付，则告知支付宝改订单已完成，不再执行后续逻辑
        if ($item->paid_at) {
            return app('alipay')->success();
        }

        // 启用事务处理，保证数据一致性
        \DB::transaction(function () use ($data, $no, $installment, $item) {
            // 更新还款计划
            $item->update([
                'paid_at' => Carbon::now(), // 支付时间
                'payment_method' => 'alipay',
                'payment_no' => $data->trade_no,
            ]);

            // 如果这是第一笔还款
            if ($item->sequence === 0) {
                // 更新分期付款的状态位置还款中
                $installment->update(['status' => Installment::STATUS_REPAYING]);
                // 更新分期付款对应的订单状态为已支付
                $installment->order->update([
                    'paid_at' => Carbon::now(),
                    'payment_method' => 'installment', // 支付方式为分期付款
                    'payment_no' => $no,
                ]);
                // 触发商品订单已支付的事件
                event(new OrderPaid($installment->order));
            }

            // 如果这是最后一笔还款
            if ($item->sequence === $installment->count - 1) {
                // 更新分期付款状态为已结清
                $installment->update(['status' => Installment::STATUS_FINISHED]);
            }
        });

        return app('alipay')->success();
    }
}
