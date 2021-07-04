<?php
namespace App\Repositories;

use App\Models\Product;

class ProductRepository
{
    public function getProductsByLeaveCategory($category_id,$sort,$order){
        $products = Product::where('category_id',$category_id);
        switch($sort){
            case 'all' : $products = $products; //general sort
                        break;
            case 'sold' : $products = $products->orderBy('sold_count');//sold count sort
                        break;
            case 'price' : $products = $products->orderBy('price',$order==1?'asc':'desc');
        }
        return $products->paginate(6);
    }

    public function getProductById($id){
        $product = Product::findOrFail($id);
        return $product;
    }
}

