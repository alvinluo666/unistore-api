<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsSkuTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products_sku', function (Blueprint $table) {
            $table->id();
            $table->integer('spu_id');
            $table->string('title');
            $table->json('images');
            $table->float('price');
            $table->string('indexes');
            $table->string('own_spec');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products_sku');
    }
}
