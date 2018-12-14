@extends('layouts.app')

@section('content')

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}"><i class="demo-pli-home"></i></a></li>
            <li><a href="{{ route('projects.index') }}">My Projects</a></li>
            <li class="active">My Projects</li>
        </ol>
    </div>

    <div class="col-sm-12">
        <div class="panel panel-primary">

            <!--Panel heading-->
            <div class="panel-heading">
                <div class="row">
                    <div class="col-sm-6">
                        <h3 class="panel-title">{{ $project->name }}</h3>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel-control" style="margin-top:5px;">
                            <ul class="pager pager-rounded">
                                <li><a href="{{ route('sprints.index', $project->id) }}">Sprints</a></li>
                                <li><a href="{{ route('contributors.index', $project->id) }}">Contributers</a></li>
                                <li><a href="{{ route('stories.index', $project->id) }}">Story</a></li>
                                <li><a href="{{ route('backlogs.index', $project->id) }}">Backlog</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!--Panel body-->
            <div class="panel-body">
                <?php echo $project->description; ?>
            </div>

            <div class="panel-footer">
                <div class="row">
                    <div class="col-sm-6">
                        Start Date: {{ date('d-m-Y', $project->start_date) }}
                    </div>
                    <div class="col-sm-6">
                        End Date: {{ date('d-m-Y', $project->end_date) }}
                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection
