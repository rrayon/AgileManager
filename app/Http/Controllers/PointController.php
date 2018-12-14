<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Point;
use App\Checkin;
use App\Sprint;

class PointController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $checkin = Checkin::find($id);
        return view('points.index', compact('checkin'));
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
        $checkin = new Checkin;
        $checkin->sprint_id = $request->sprint_id;
        $checkin->name = $request->name;
        $checkin->save();

        foreach (Sprint::find($request->sprint_id)->project->contributors as $key => $contributor) {
            $point = new Point;
            $point->checkin_id = $checkin->id;
            $point->contributor_id = $contributor->id;
            $point->a = $request['a_'.$contributor->id];
            $point->b = $request['b_'.$contributor->id];
            $point->c = $request['c_'.$contributor->id];
            $point->d = $request['d_'.$contributor->id];
            $point->save();
        }

        return redirect()->route('checkins.index', $request->sprint_id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
