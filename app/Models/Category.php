<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['name', 'is_directory', 'level', 'path'];
    protected $casts = [
        'is_directory' => 'boolean',
    ];

    protected static function boot()
    {
        parent::boot();
        // 监听 Category 的创建事件，用于初始化 path 和 level 字段值
        static::creating(function (Category $category) {
            // 如果创建的是一个根目录
            if (is_null($category->parent_id)) {
                // 将层级设置为 0
                $category->level = 0;
                // 将 path 设置为 -
                $category->path = '-';
            } else {
                // 将层级设置为父级分类的层级 +1
                $category->level = $category->parent->level + 1;
                // 将 path 设置为父级分类的 path 追加父级分类 ID 用 '-' 分割
                $category->path = $category->parent->path . $category->parent_id . '-';
            }
        });
    }

    public function parent()
    {
        return $this->belongsTo(Category::class);
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    // 设置访问器，获取所有祖先类目的 ID 值
    public function getPathIdsAttribute()
    {
        return array_filter(explode('-', trim($this->path, '-')));
    }

    // 设置访问器，获取祖先类目并按照层级排列
    public function getAncestorsAttribute()
    {
        return Category::query()
            ->whereIn('id', $this->path_ids)
            ->orderBy('level')// 按层级排序
            ->get();
    }

    // 设置访问器，获取以 - 为分隔的所有祖先类目名称以及当前类目的名称
    public function getFullNameAttribute()
    {
        return $this->ancestors->pluck('name')->push($this->name)->implode(' - ');
    }
}
