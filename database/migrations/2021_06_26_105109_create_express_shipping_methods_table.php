<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExpressShippingMethodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('express_shipping_methods', function (Blueprint $table) {
            $table->id();
            $table->integer('template_id');
            $table->integer('end_address');
            $table->integer('default_piece');
            $table->float('default_price');
            $table->integer('add_piece');
            $table->float('add_price');
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
        Schema::dropIfExists('express_shipping_methods');
    }
}
