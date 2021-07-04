<?php
namespace App\Repositories;

use App\Models\CustomerAddress;

class CustomerAddressRepository
{
    public function getCustomerAddress(){
        $address = CustomerAddress::where('user_id',auth()->id())->orderBy('created_at','desc')->get();
        return $address;
    }
    public function updateCustomerAddress($data,$id){
       $address = CustomerAddress::findOrFail($id);
       if($address->user_id==auth()->id()){
            
            $address->update($data);
            //update default selected address
            if($data['default']==1){
                CustomerAddress::where('user_id',auth()->id())->where('id','<>',$id)->update(['default'=>0]);
            }else{
                // if default is 0 , we check is there an address with 1
                $defaultAddress = CustomerAddress::where('user_id',auth()->id())->where('default',1)->get();     
         
                if(count($defaultAddress)==0){
                    //default no exist ,update latest insert to be default
                    $temp = CustomerAddress::where('user_id',auth()->id())->orderBy('created_at','desc')->first();
                    $temp->default = 1;
                    $temp->save();
                }
            }
            return CustomerAddress::findOrFail($id);
       }
       return 'unauth';
    }

    public function storeCustomerAddress($data){
        $address = CustomerAddress::create($data);
        if($data['default']==1){
            CustomerAddress::where('user_id',auth()->id())->where('id','<>',$address->id)->update(['default'=>0]);
        }else{
            // if default is 0 , we check is there an address with 1
            $defaultAddress = CustomerAddress::where('user_id',auth()->id())->where('default',1)->get();       
            if(count($defaultAddress)==0){
                //default no exist ,update latest insert to be default
                $temp = CustomerAddress::where('user_id',auth()->id())->orderBy('created_at','desc')->first();
                $temp->default = 1;
                $temp->save();
            }
        }

        return $address;
    }

    public function getDefaultAddress(){
        $address = CustomerAddress::where('user_id',auth()->id())->where('default',1)->first();
        return $address;
    }
}

