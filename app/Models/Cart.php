<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductsSku;
use App\Models\Product;
use App\Models\ProductsDetail;

class Cart extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'sku_index',
        'quantity',
        'product_id'
    ];

    protected $with = ['sku_detail','product_detail'];

    public function sku_detail(){
        return $this->belongsTo(ProductsSku::class,'sku_index','indexes');
    }

    public function product_detail(){
        return $this->belongsTo(Product::class,'product_id','id');
    }
}
