<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\Event_purchase;

class EventController extends Controller
{
    public function index() {
        $event = Event::all();

        return $event;
    }

    public function purchase(Request $request) {
        return $request;
    }
}
