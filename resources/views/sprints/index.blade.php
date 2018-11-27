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

    @foreach ($project->sprints as $key => $sprint)
        <div class="col-sm-12">
            <div class="panel panel-primary">

                <!--Panel heading-->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="panel-title">{{ $project->name }}</h3>
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
    @endforeach

@endsection
