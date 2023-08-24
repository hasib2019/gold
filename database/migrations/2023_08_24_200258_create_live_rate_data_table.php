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
        Schema::create('live_rate_data', function (Blueprint $table) {
            $table->id();
            $table->string('type', 20);
            $table->decimal('bid_sell', 10, 2);
            $table->decimal('ask_buy', 10, 2);
            $table->decimal('low', 10, 2);
            $table->decimal('high', 10, 2);
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
        Schema::dropIfExists('live_rate_data');
    }
};
