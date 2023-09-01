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

    public function create(Request $request) {
        $id = News::count() + 1;
        $newsId = sprintf("NWS-%03d", $id);

        News::create([
            'id' => "$newsId",
            'title' => "$request->title",
            'content' => "$request->content",
            'category' => "$request->category",
            'image' => "$request->image",
            'author' => "$request->author",
            'author_profile' => "$request->author_profile",
        ]);

        return response()->json(['message' => 'Added Successfully'], 200);
    }
}
