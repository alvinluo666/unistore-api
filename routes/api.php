<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RootCategoryController;
use App\Http\Controllers\MiddleCategoryController;
use App\Http\Controllers\LeaveCategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\ShippingController;
use App\Http\Controllers\CustomerAddressController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('rootCategories',RootCategoryController::class);
Route::apiResource('middleCategories',MiddleCategoryController::class);
Route::apiResource('leaveCategories',LeaveCategoryController::class);

Route::get('productsByCategory/{category_id}',[ProductController::class,'index']);//get product by category
Route::get('products/{product_id}',[ProductController::class,'show']);//get product by category

Route::post('/login',[UserController::class,'login']);
Route::post('/register',[UserController::class,'register']);
Route::post('/logout',[UserController::class,'logout']);

Route::middleware('auth:api')->group(function(){
    //cart start
    Route::get('/cartItem',[CartController::class,'index']);
    Route::post('/cartItem',[CartController::class,'store']);
    Route::post('/cartItem/updateQuantity',[CartController::class,'update_quantity']);
    Route::delete('/cartItem/{id}',[CartController::class,'delete_one']);
    //cart end

    //stock
    Route::get('/stock/{sku}',[ProductController::class,'getStockBySku']);
    //


    //shipping
    Route::get('/shipping/address',[ShippingController::class,'getAddress']);

    //customer address
    Route::get('/address',[CustomerAddressController::class,'index']);
    Route::put('/address/{id}',[CustomerAddressController::class,'update']);
    Route::post('/address',[CustomerAddressController::class,'store']);
    Route::get('/address/default',[CustomerAddressController::class,'getDefaultAddress']);
});