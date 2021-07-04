<?php
namespace App\Classes;

class CartItem {

    public $productId;//it must be productDetailID
    public $skuIndex; 
    public $quantity;

    function __construct($productId,$skuIndex,$quantity){
        $this->productId = $productId;
        $this->skuIndex = $skuIndex;
        $this->quantity = $quantity;
    }


}