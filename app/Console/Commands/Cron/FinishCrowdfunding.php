<?php

namespace App\Console\Commands\Cron;

use App\Jobs\RefundCrowdfundingOrders;
use App\Models\CrowdfundingProduct;
use App\Models\Order;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Console\Command;

class FinishCrowdfunding extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:finish-crowdfunding';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '结束众筹';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        CrowdfundingProduct::query()
            ->with(['product'])// 预加载商品数据
            ->where('end_at', '<=', Carbon::now())// 众筹结束时间早于当前时间
            ->where('status', CrowdfundingProduct::STATUS_FUNDING)// 众筹状态为众筹中
            ->get()
            ->each(function (CrowdfundingProduct $crowdfunding) {
                // 如果众筹目标金额大于实际众筹金额，调用众筹失败逻辑
                if ($crowdfunding->target_amount > $crowdfunding->total_amount) {

                } else { // 否则调用众筹成功金额

                }
            });
    }

    protected function crowdfundingSucceed(CrowdfundingProduct $crowdfunding)
    {
        // 修改众筹状态即可
        $crowdfunding->update([
            'status' => CrowdfundingProduct::STATUS_SUCCESS,
        ]);
    }

    protected function crowdfundingFailed(CrowdfundingProduct $crowdfunding)
    {
        // 将众筹状态改为失败
        $crowdfunding->update([
            'status' => CrowdfundingProduct::STATUS_FAIL,
        ]);
        dispatch(new RefundCrowdfundingOrders($crowdfunding));
    }
}
