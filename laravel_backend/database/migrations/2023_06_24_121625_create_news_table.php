<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('news', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->string('title');
            $table->text('content');
            $table->enum('category', ['Education', 'Time Management', 'Self Improvement', 'Entertainment', 'Gaming']);
            $table->text('image');
            $table->string('author');
            $table->text('author_profile');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('news');
    }
};
