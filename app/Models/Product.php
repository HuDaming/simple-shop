<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Product extends Model
{
    protected $fillable = [
        'title', 'description', 'cover', 'on_sale', 'rating',
        'sold_count', 'review_count', 'price'
    ];

    protected $casts = [
        'on_sale' => 'boolean',
    ];

    public function skus()
    {
        return $this->hasMany(ProductSku::class);
    }

    public function getCoverUrlAttribute()
    {
        if (Str::startsWith($this->attributes['cover'], ['https://', 'http://'])) {
            return $this->attributes['cover'];
        }
        return \Storage::disk('admin')->url($this->attributes['cover']);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
