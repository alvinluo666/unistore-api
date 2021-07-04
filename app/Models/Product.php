<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\LeaveCategory;
use App\Models\ProductsDetail;

class Product extends Model
{
    use HasFactory;

    
    protected $fillable = ['name','description','images','price','category_id','service','sold_count','view_count'];

    protected $with = ['category','product_detail'];

    protected $casts = [
        'images'=>'array'
    ];

    public function category(){
        return $this->belongsTo(LeaveCategory::class,'category_id','id');
    }

    public function product_detail(){
        return $this->hasOne(ProductsDetail::class,'product_id','id');
    }
}
