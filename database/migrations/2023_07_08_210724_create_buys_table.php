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
        Schema::create('buys', function (Blueprint $table) {
            $table->increments(`id`);
            $table->date(`buy_date`);
            $table->string(`gold_karat`);
            $table->float(`weight`);
            $table->float(`price`);
            $table->float(`total_price`);
            $table->string(`voucher_no`);
            $table->string(`company_name`);
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
        Schema::dropIfExists('buys');
    }
};
