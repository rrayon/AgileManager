@extends('layouts.app')

@section('content')

    <div class="row">
        <div class="col-sm-6">
            <ol class="breadcrumb">
                <li><a href="{{ route('home') }}"><i class="demo-pli-home"></i></a></li>
                <li><a href="{{ route('projects.index') }}">My Projects</a></li>
                <li><a href="{{ route('projects.show', $project->id) }}">{{ $project->name }}</a></li>
                <li class="active">Stories</li>
            </ol>
        </div>
        @if (Auth::user()->id == $project->user_id)
            <div class="col-sm-6">
                <a href="{{ route('stories.create', $project->id)}}" class="btn btn-info pull-right">{{__('web.add_new')}}</a>
            </div>
        @endif
    </div>

    <br>

    @foreach ($project->stories as $key => $story)
        <div class="col-sm-6">
            <div class="panel panel-primary">

                <!--Panel heading-->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="panel-title">{{ $story->name }} ({{ date('d.m.Y', $story->start_date) }} - {{ date('d.m.Y', $story->start_date) }})</h3>
                        </div>
                    </div>
                </div>

                <!--Panel body-->
                <div class="panel-body">
                    <div class="panel-group accordion" id="demo-acc-info-outline">
                        @foreach ($story->tasks as $key2 => $task)
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
        		                        <a data-parent="#demo-acc-info-outline" data-toggle="collapse" href="#demo-acd-info-outline-{{ $key }}-{{ $key2 }}" class="collapsed" aria-expanded="false">{{ $task->name }}</a>
        		                    </h4>
                                </div>
                                <div class="panel-collapse collapse" id="demo-acd-info-outline-{{ $key }}-{{ $key2 }}" aria-expanded="false">
                                    <div class="panel-body">
                                        <?php echo $task->description; ?>
                                    </div>
                                    <ul class="list-group">
                                        <li class="list-group-item">Asigned To : {{ $task->user->name }}</li>
                                        <li class="list-group-item">Weight : {{ $task->weight }}</li>
                                    </ul>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    @if (Auth::user()->id == $project->user_id)
                        <a href="{{ route('tasks.create', $story->id) }}" class="btn btn-block btn-info">Add New Task</a>
                    @endif
                </div>
                <ul class="list-group">
	                <li class="list-group-item">Priority : {{ $story->priority }}</li>
                    <li class="list-group-item">Weight: {{ $story->tasks->sum('weight') }}</li>
                </ul>
            </div>
        </div>
    @endforeach

@endsection
