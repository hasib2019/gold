<?php

namespace App\Http\Controllers;

use App\Models\NewsAlart;
use Illuminate\Http\Request;

class NewsAlartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $response = NewsAlart::where('status', 1)->get();
        // dd($response);
        return response()->json($response);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\NewsAlart  $newsAlart
     * @return \Illuminate\Http\Response
     */
    public function show(NewsAlart $newsAlart)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\NewsAlart  $newsAlart
     * @return \Illuminate\Http\Response
     */
    public function edit(NewsAlart $newsAlart)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NewsAlart  $newsAlart
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NewsAlart $newsAlart)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NewsAlart  $newsAlart
     * @return \Illuminate\Http\Response
     */
    public function destroy(NewsAlart $newsAlart)
    {
        //
    }
}
