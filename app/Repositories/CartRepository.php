<?php
namespace App\Repositories;
use Illuminate\Support\Facades\Cache;
use App\Classes\CartItem;
use App\Models\Cart;

class CartRepository
{
    public function getCartItems(){
        //get items from redis cache
        $cart = Cart::where('user_id',auth()->id())->get();
        return $cart;
    }
    public function setCartItem($productId,$skuIndex,$quantity){
        
        $cart = Cart::where('user_id',auth()->id())->where('product_id',$productId)->where('sku_index',$skuIndex)->first();

        if($cart){
            $cart->update(['quantity'=>$cart->quantity+$quantity]);
        }else{
            Cart::create([
                'user_id'=>auth()->id(),
                'product_id'=>$productId,
                'sku_index'=>$skuIndex,
                'quantity'=>$quantity
            ]);
        }
           
        return Cart::where('user_id',auth()->id())->get();
    }
    public function updateCartItemQuantity($cartId,$quantity){
        $cart = Cart::findOrFail($cartId);
        if($cart->user_id==auth()->id()){
            $cart->quantity = $quantity;
            $cart->save();
            return $cart;
        }else{
            return 'unauth';
        }
    }

    public function deleteOne($id){
        $cart = Cart::findOrFail($id);
        if($cart->user_id==auth()->id()){
            $cart->delete();
            return $cart;
        }else{
            return 'unauth';
        }
    }
}

