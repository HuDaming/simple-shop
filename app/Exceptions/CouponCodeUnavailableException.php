<?php

namespace App\Exceptions;

use Illuminate\Http\Request;
use Exception;

class CouponCodeUnavailableException extends Exception
{
    public function __construct(string $message, int $code = 403)
    {
        parent::__construct($message, $code);
    }

    public function render(Request $request)
    {
        // 如果通过 Api 请求，则返回 JSON 格式的错误信息
        if ($request->expectsJson()) {
            return response()->json(['msg' => $this->message], $this->code);
        }

        return redirect()->back()->withErrors(['coupon_code' => $this->message]);
    }
}
