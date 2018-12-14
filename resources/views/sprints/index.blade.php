@extends('layouts.app')

@section('content')

    <div class="row">
        <div class="col-sm-6">
            <ol class="breadcrumb">
                <li><a href="{{ route('home') }}"><i class="demo-pli-home"></i></a></li>
                <li><a href="{{ route('projects.show', $project->id) }}">{{ $project->name }}</a></li>
                <li class="active">Sprints</li>
            </ol>
        </div>
        @if (Auth::user()->contributors->where('project_id', $project->id)->first()->role == 'Scrum Master')
            <div class="col-sm-6">
                <a href="{{ route('sprints.create', $project->id)}}" class="btn btn-info pull-right">{{__('web.add_new')}}</a>
            </div>
        @endif
    </div>

    <br>

    @foreach ($project->sprints as $key => $sprint)
        <div class="col-sm-12">
            <div class="panel panel-primary">

                <!--Panel heading-->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="panel-title">Sprint {{ $key+1 }} ({{ date('d.m.Y', $sprint->start_date) }} - {{ date('d.m.Y', $sprint->end_date) }})</h3>
                        </div>
                        <div class="col-sm-6">
                            <div class="panel-control" style="margin-top:5px;">
                                <ul class="pager pager-rounded">
                                    <li><a href="{{ route('sprints.chart', $sprint->id) }}">Burndown Chart</a></li>
                                    <li><a href="{{ route('checkins.index', $sprint->id) }}">Meeting Checkins</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Panel body-->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3 class="panel-title">To Do</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    @foreach (json_decode($sprint->story_ids) as $key => $id)
                                        @php
                                            $story = \App\Story::find($id);
                                        @endphp
                                        @if ($story != null && count($story->tasks->where('status', 'Pending')) > 0)
                                            <h4>{{ $story->name }}</h4>
                                            @foreach ($story->tasks->where('status', 'Pending') as $key => $task)
                                                <li class="list-group-item">{{ $task->name }}</li>
                                            @endforeach
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3 class="panel-title">In Progress</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    @foreach (json_decode($sprint->story_ids) as $key => $id)
                                        @php
                                            $story = \App\Story::find($id);
                                        @endphp
                                        @if ($story != null && count($story->tasks->where('status', 'Doing')) > 0)
                                            <h4>{{ $story->name }}</h4>
                                            @foreach ($story->tasks->where('status', 'Doing') as $key => $task)
                                                <li class="list-group-item">{{ $task->name }}</li>
                                            @endforeach
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3 class="panel-title">Done</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    @foreach (json_decode($sprint->story_ids) as $key => $id)
                                        @php
                                            $story = \App\Story::find($id);
                                        @endphp
                                        @if ($story != null && count($story->tasks->where('status', 'Done')) > 0)
                                            <h4>{{ $story->name }}</h4>
                                            @foreach ($story->tasks->where('status', 'Done') as $key => $task)
                                                <li class="list-group-item">{{ $task->name }}</li>
                                            @endforeach
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    @endforeach

@endsection
