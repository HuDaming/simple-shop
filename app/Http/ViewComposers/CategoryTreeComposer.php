<?php

namespace App\Http\ViewComposers;

use App\Services\CategoryService;
use Illuminate\View\View;

class CategoryTreeComposer
{
    protected $categoryService;

    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    // 渲染指定模版，调用 compose 方法
    public function compose(View $view)
    {
        // 用 with 方法注入变量
        $view->with('categoryTree', $this->categoryService->getCategoryTree());
    }
}