<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\CartRepository;

class CartController extends Controller
{

    protected $repo;
    public function __construct(CartRepository $repo){
        $this->repo= $repo;
    }

    public function index(){
        $cart = $this->repo->getCartItems();
        return response()->json(['body'=>$cart],200);
    }

    public function store(Request $request){
        $data = $request->validate([
            'product_id' => 'required',
            'sku_index'=>'required',
            'quantity'=>'required'
        ]);

        $cart = $this->repo->setCartItem($data['product_id'],$data['sku_index'],$data['quantity']);

        return response()->json(['body'=>$cart],200); 


    }

    public function update_quantity(Request $request){
        $data = $request->validate([
            'cart_id' => 'required',
            'quantity' => 'required'
        ]);
        $cart = $this->repo->updateCartItemQuantity($data['cart_id'],$data['quantity']);
        if($cart=='unauth'){
            return response()->json(['message'=>"You are not authourized to do this"]);
        }
        return response()->json(['body'=>$cart],200);
    }
    public function delete_one($id){
        $cart = $this->repo->deleteOne($id);
        if($cart=='unauth'){
            return response()->json(['message'=>"You are not authourized to do this"]);
        }
        return response()->json(['body'=>$cart],200);
    }
}
