<?php

namespace App\Http\Controllers;

use App\Models\alartTable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\Exceptions\MissingAbilityException;

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
    public function store(Request $request, $insert)
    {
        dd($insert);
        $creds = $request->validate([
            'gold_weight' => 'required',
            'app_price' => 'required',
        ]);
        dd($creds);

        $newRecord = 'create';
        return response()->json(['message' => 'Record created successfully', 'data' => $newRecord], 201);
        return true;
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
