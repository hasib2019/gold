<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return true;
        $creds = $request->validate([
            'user_id' => 'required|numeric',
            'product_id' => 'required|numeric',
            'order_date' => 'required',
        ]);

        // return [$creds['user_id'], $creds['product_id'], $creds['order_date']];
        // After validation, you can access the individual fields like this:
        // Create a new instance of the NewsAlart model
        $newsAlart = new Order();

        // Set the model's attributes with the validated data
        $newsAlart->user_id = $creds['user_id'];
        $newsAlart->product_id = $creds['product_id'];
        $newsAlart->order_date = \Carbon\Carbon::createFromFormat('d/m/Y', $creds['order_date'])->format('Y-m-d');
        // Save the model to the database
        $newsAlart->save();
        return response()->json(['message' => 'Order successfully', 'data' => $newsAlart], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }
}
