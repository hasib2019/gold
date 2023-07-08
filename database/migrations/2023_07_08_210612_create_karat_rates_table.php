<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('karat_rates', function (Blueprint $table) {
            $table->increments('id');
            $table->date('date');
            $table->date('open_time');
            $table->integer('weight');
            $table->string('currency');
            $table->string('exchange');
            $table->float('prev_close_price', 8, 2);
            $table->float('price', 8, 2);
            $table->float('today_close_price', 8, 2);
            $table->float('price_gram_24k', 8, 2);
            $table->float('price_gram_22k', 8, 2);
            $table->float('price_gram_21k', 8, 2);
            $table->float('price_gram_20k', 8, 2);
            $table->float('price_gram_18k', 8, 2);
            $table->float('price_gram_16k', 8, 2);
            $table->float('price_gram_14k', 8, 2);
            $table->float('price_gram_10k', 8, 2);
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
        Schema::dropIfExists('karat_rates');
    }
};
