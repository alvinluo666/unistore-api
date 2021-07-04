<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\ShippingRepository;

class ShippingController extends Controller
{

    protected $repo;
    public function __construct(ShippingRepository $repo){
        $this->repo = $repo;
    }

    public function getAddress(){
        $address = $this->repo->getAllAddress();
        return response()->json(['body'=>$address],200);
    }
}
