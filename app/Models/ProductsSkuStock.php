<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductsSkuStock extends Model
{
    use HasFactory;

    protected $table = "products_sku_stock";

    protected $fillable = ['sku_id','stock'];
}
