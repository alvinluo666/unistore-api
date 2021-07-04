<?php
namespace App\Repositories;

use App\Models\ExpressCity;

class ShippingRepository
{
    public function getAllAddress(){
        $address = ExpressCity::with('children')->where('pid',0)->get();
        return $address;
    }
}

