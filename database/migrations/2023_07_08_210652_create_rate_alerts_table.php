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
        Schema::create('rate_alerts', function (Blueprint $table) {
            $table->increments(`id`);
            $table->integer(`gold`);
            $table->integer(`weight`);
            $table->float(`purity`);
            $table->float(`price`);
            $table->string(`contact_no`);
            $table->string(`user_name`);
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
        Schema::dropIfExists('rate_alerts');
    }
};
