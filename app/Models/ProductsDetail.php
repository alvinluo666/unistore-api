<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductsSku;

class ProductsDetail extends Model
{
    use HasFactory;

    protected $fillable = ['product_id','description','specifications','spec_template'];

    protected $table = 'products_detail';

    protected $with = ['productSkus'];

    protected $casts = [
        'specifications'=>'array',
        'spec_template'=>'array'
    ];

    public function productSkus(){
        return $this->hasMany(ProductsSku::class,'spu_id','id');
    }
    
}
