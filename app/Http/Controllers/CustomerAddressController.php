<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\CustomerAddressRepository;

class CustomerAddressController extends Controller
{

    protected $repo;

    public function __construct(CustomerAddressRepository $repo){
        $this->repo = $repo;
    }

    public function index(){
        $address = $this->repo->getCustomerAddress();
        return response()->json(['body'=>$address],200);
    }

    public function update(Request $request,$id){
        $data = $request->validate([
            'customer_name'=>'required',
            'phone'=>'required',
            'city_index'=>'required',
            'city_text'=>'required',
            'detail'=>'required'
        ]);
        $request['user_id']=auth()->id();
        $request['default']=(int)$request['default'];
        $address = $this->repo->updateCustomerAddress($request->all(),$id);

        if($address=='unauth'){
            return response()->json(['message'=>'not authorized'],422);
        }
        return response()->json(['body'=>$address],200);
    }
    
    public function store(Request $request){
        $data = $request->validate([
            'customer_name'=>'required',
            'phone'=>'required',
            'city_index'=>'required',
            'city_text'=>'required',
            'detail'=>'required'
        ]);
        $request['user_id']=auth()->id();
        $request['default']=(int)$request['default'];
        $address = $this->repo->storeCustomerAddress($request->all());
        if($address=='unauth'){
            return response()->json(['message'=>'not authorized'],422);
        }
        return response()->json(['body'=>$address],200);
    }

    public function getDefaultAddress(){
        $address = $this->repo->getDefaultAddress();
        return response()->json(['body'=>$address],200);
    }
}
