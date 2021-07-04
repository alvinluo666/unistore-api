<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\ProductsSkuStock;

class ProductsSku extends Model
{
    use HasFactory;

    protected $table = "products_sku";

    protected $with = "stock";

    public function stock(){
        return $this->hasOne(ProductsSkuStock::class,"sku_id","id");
    }

    protected $casts = [
        'own_spec'=>'array',
        'price'=>'float',
        'images'=>'array'
    ];
}
