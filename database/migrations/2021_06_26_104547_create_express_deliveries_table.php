<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExpressDeliveriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('express_deliveries', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->integer('start_address');
            $table->integer('is_free');
            $table->integer('price_method')->default(0);
            $table->integer('specify_conditions')->default(0);
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
        Schema::dropIfExists('express_deliveries');
    }
}
