<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Order;
use Carbon\Carbon;
use Endroid\QrCode\QrCode;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function payByAlipay(Order $order, Request $request)
    {
        // 检查订单是否属于当前用户
        $this->authorize('own', $order);
        // 订单已支付或者已关闭
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
        }

        // 调用支付宝的网页支付
        return app('alipay')->web([
            'out_trade_no' => $order->no,
            'total_amount' => $order->total_amount,
            'subject' => '支付 Simple Shop 的订单：' . $order->no,
        ]);
    }

    /**
     * 前端回调
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function alipayReturn()
    {
        try {
            // 校验参数
            app('alipay')->verify();
        } catch (\Exception $exception) {
            return view('pages.error', ['msg' => '数据不正确']);
        }

        return view('pages.success', ['msg' => '付款成功']);
    }

    public function alipayNotify()
    {
        // 校验参数
        $data = app('alipay')->verify();
        // 订单状态不是成功或者结束，则终止程序
        if (!in_array($data->trade_status, ['TRADE_SUCCESS', 'TRADE_FINISHED'])) {
            return app('alipay')->success();
        }
        // 查询订单
        $order = Order::where('no', $data->out_trade_no)->first();
        // 检查订单是否存在
        if (!$order) return 'fail';
        // 如果订单状态为已支付
        if ($order->paid_at) {
            return app('alipay')->success();
        }

        $order->update([
            'paid_at' => Carbon::now(),
            'payment_method' => 'alipay',
            'payment_no' => $data->trade_no,
        ]);

        // \Log::debug('Alipay notify', $data->all());
        return app('alipay')->success();
    }

    public function payByWechat(Order $order, Request $request)
    {
        // 校验权限
        $this->authorize('own', $order);
        // 校验订单状态
        if ($order->paid_at || $order->closed) {
            throw new InvalidRequestException('订单状态不正确');
        }
        // 调起微信支付
        $wechatOrder = app('wechat_pay')->scan([
            'out_trade_no' => $order->no,
            'total_fee' => $order->total_amount * 100, // 微信支付金额单位为 分
            'body' => '支付 Simple Shop 的订单：' . $order->no,
        ]);

        // 构造 QrCode 函数的参数
        $qrCode = new QrCode($wechatOrder->code_url);

        // 生成二维码图片以字符串形式输出
        return response($qrCode->writeString(), 200, ['Content-Type' => $qrCode->getContentType()]);
    }

    public function wechatNotify()
    {
        // 校验回调参数
        $data = app('wechat_pay')->verify();
        // 获取订单
        $order = Order::where('no', $data->out_trade_no)->first();
        // 订单不存在
        if (!$order) return 'fail';
        // 订单已支付
        if ($order->paid_at) {
            return app('wechat_pay')->success();
        }

        // 更新订单
        $order->update([
            'paid_at' => Carbon::now(),
            'payment_method' => 'wechat',
            'payment_no' => $data->transaction_id,
        ]);

        return app('wechat_pay')->success();
    }
}
