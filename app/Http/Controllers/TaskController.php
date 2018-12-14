<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Task;
use App\Story;
use App\Backlog;

class TaskController extends Controller
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
    public function create($id)
    {
        $story = Story::find($id);
        return view('tasks.create', compact('story'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $task = new Task;
        $task->story_id = $request->story_id;
        $task->name = $request->name;
        $task->description = $request->description;
        $task->weight = $request->weight;
        $task->start_date = strtotime($request->start_date);
        $task->end_date = strtotime($request->end_date);
        $task->user_id = $request->user_id;
        $task->time = strtotime(date('d-m-Y'));
        $task->save();

        $backlog = new Backlog;
        $backlog->project_id = Story::find($request->story_id)->project_id;
        $backlog->log = $task->name.' (Task) created';
        $backlog->save();

        return redirect()->route('stories.index', Story::find($request->story_id)->project->id);
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

    public function done($id)
    {
        $task = Task::find($id);
        $task->status = 'Done';
        $task->time = strtotime(date('d-m-Y'));
        $task->save();

        $backlog = new Backlog;
        $backlog->project_id = $task->story->project_id;
        $backlog->log = $task->name.' (Task) status changed to Done';
        $backlog->save();

        return back();
    }

    public function undo($id)
    {
        $task = Task::find($id);
        $task->status = 'Pending';
        $task->time = strtotime(date('d-m-Y'));
        $task->save();

        $backlog = new Backlog;
        $backlog->project_id = $task->story->project_id;
        $backlog->log = $task->name.' (Task) status changed to Pending';
        $backlog->save();

        return back();
    }

    public function doing($id)
    {
        $task = Task::find($id);
        $task->status = 'Doing';
        $task->time = strtotime(date('d-m-Y'));
        $task->save();

        $backlog = new Backlog;
        $backlog->project_id = $task->story->project_id;
        $backlog->log = $task->name.' (Task) status changed to Doing';
        $backlog->save();

        return back();
    }
}
