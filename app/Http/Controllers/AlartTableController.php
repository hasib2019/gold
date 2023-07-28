<?php

namespace App\Http\Controllers;

use App\Models\AlartTable;
use App\Models\NewsAlart;
use Illuminate\Http\Request;

class AlartTableController extends Controller
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
        $creds = $request->validate([
            'gold_weight' => 'required',
            'app_price' => 'required|numeric',
            'offer_price' => 'required|numeric',
            'Name' => 'required|string',
            'Mobile_no' => 'required|string',
            'buy_date' => 'required|date_format:d/m/Y',
            'status' => 'required|boolean',
        ]);

        // After validation, you can access the individual fields like this:
        // Create a new instance of the NewsAlart model
        $newsAlart = new AlartTable();

        // Set the model's attributes with the validated data
        $newsAlart->gold_weight = $creds['gold_weight'];
        $newsAlart->app_price = $creds['app_price'];
        $newsAlart->offer_price = $creds['offer_price'];
        $newsAlart->Name = $creds['Name'];
        $newsAlart->Mobile_no = $creds['Mobile_no'];
        $newsAlart->buy_date = \Carbon\Carbon::createFromFormat('d/m/Y', $creds['buy_date'])->format('Y-m-d');
        $newsAlart->status = $creds['status'];

        // Save the model to the database
        $newsAlart->save();
        return response()->json(['message' => 'Record created successfully', 'data' => $newsAlart], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\alartTable  $alartTable
     * @return \Illuminate\Http\Response
     */
    public function show(alartTable $alartTable)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\alartTable  $alartTable
     * @return \Illuminate\Http\Response
     */
    public function edit(alartTable $alartTable)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\alartTable  $alartTable
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, alartTable $alartTable)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\alartTable  $alartTable
     * @return \Illuminate\Http\Response
     */
    public function destroy(alartTable $alartTable)
    {
        //
    }
}
