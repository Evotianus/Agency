<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Product_purchase;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::all();

        return response()->json($products, 200);
        // return response()->json([
        //     'Halo' => 'Hai',
        // ], 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = Product::find($id);

        return response()->json($product, 200);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function purchase(Request $request)
    {
        $invoice_count = Product_purchase::count() + 1;
        $invoice_id = sprintf("INV%07d", $invoice_count);

        $product_stock = Product::where('id', $request->product_id)->get('quantity')[0]['quantity'];

        // return $product_stock;

        Product_purchase::create([
            'id' => $invoice_id,
            'quantity' => $request->quantity,
            'product_id'=> $request->product_id,
            'user_id'=> $request->user_id
        ]);

        Product::where('id', $request->product_id)->update(['quantity' => $product_stock - $request->quantity]);

        return $request;
    }
}
