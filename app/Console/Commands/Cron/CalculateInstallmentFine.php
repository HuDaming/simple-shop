<?php

namespace App\Console\Commands\Cron;

use App\Models\Installment;
use App\Models\InstallmentItem;
use Carbon\Carbon;
use Illuminate\Console\Command;

class CalculateInstallmentFine extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cron:calculate-installment-fine';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '计算分期付款逾期费';

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        InstallmentItem::query()
            ->with(['installment'])
            ->whereHas('installment', function ($query) {
                // 对应的分期状态为还款中
                $query->where('status', Installment::STATUS_REPAYING);
            })
            ->where('due_date', '<=', Carbon::now()) // 还款截止日期在当前时间之前
            ->whereNull('paid_at') // 尚未还款
            ->chunkById(1000, function ($items) { // 使用 chunkById 避免一次性处理太多数据
                // 遍历还款计划记录
                foreach ($items as $item) {
                    // 计算逾期天数
                    $overdueDays = Carbon::now()->diffInDays($item->due_date);
                    // 本金与手续费之和作为逾期费计算的本金
                    $base = big_number($item->base)->add($item->fee)->getValue();
                    // 计算逾期费
                    $fine = big_number($base)
                        ->multiply($overdueDays)
                        ->multiply($item->installment->fine_rate)
                        ->divide(100)
                        ->getValue();
                    // 国家规定逾期费不得超过当期本金 + 手续费，使用 compareTo 判断逾期费是否超过本金于手续费之和
                    $fine = big_number($fine)->compareTo($base) === 1 ? $base : $fine;
                    $item->update(['fine' => $fine]);
                }
            });
    }
}
