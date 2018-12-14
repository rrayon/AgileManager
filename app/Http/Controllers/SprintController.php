<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Project;
use App\Sprint;
use App\Story;
use Auth;
use App\Backlog;

class SprintController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $project = Project::find($id);
        return view('sprints.index', compact('project'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        $project = Project::find($id);
        return view('sprints.create', compact('project'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $sprint = new Sprint;
        $sprint->project_id = $request->project_id;
        $sprint->story_ids = json_encode($request->stories);
        $sprint->start_date = strtotime($request->start_date);
        $sprint->end_date = strtotime($request->end_date);
        $sprint->save();

        $backlog = new Backlog;
        $backlog->project_id = $request->project_id;
        $backlog->log = 'New Sprint created';
        $backlog->save();

        return redirect()->route('sprints.index', $request->project_id);
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

    public function chart($id)
    {
        $sprint = Sprint::find($id);
        $data = array();
        $weights = 0;
        foreach (json_decode($sprint->story_ids) as $key => $id) {
            $story = Story::find($id);
            $weights += $story->tasks->sum('weight');
        }
        array_push($data, array('elapsed' => 'Week 0', 'value' => $weights));
        $i = 1;
        for($time = $sprint->start_date; $time <= $sprint->end_date; $time = strtotime('+7 day', $time)){
            foreach (json_decode($sprint->story_ids) as $key => $id) {
                $story = Story::find($id);
                foreach ($story->tasks as $key => $task) {
                    if($task->time > $time && $task->time < strtotime('+7 day', $time) && $task->status == 'Done'){
                        $weights -= $task->weight;
                    }
                }
            }
            array_push($data, array('elapsed' => 'Week '.$i, 'value' => $weights));
            $i++;
        }
        $data = json_encode($data);
        return view('sprints.chart', compact('data'));
    }
}
