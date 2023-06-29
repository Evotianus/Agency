<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\News;

class NewsController extends Controller
{
    public function index() {
        $news = News::all();

        return $news;
    }

    public function show(string $id) {
        $news = News::find($id);

        return response()->json($news, 200);
    }
}
