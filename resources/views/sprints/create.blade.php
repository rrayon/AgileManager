@extends('layouts.app')

@section('content')

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}"><i class="demo-pli-home"></i></a></li>
            <li><a href="{{ route('projects.show', $project->id) }}">{{ $project->name }}</a></li>
            <li class="active">Sprints</li>
        </ol>
    </div>

    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Sprint Information</h3>
            </div>

            <!--Horizontal Form-->
            <!--===================================================-->
            <form class="form-horizontal" action="{{ route('sprints.store') }}" method="POST" enctype="multipart/form-data">
            	@csrf
                <div class="panel-body">
                    <input type="hidden" name="project_id" value="{{ $project->id }}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="stories">Stories</label>
                        <div class="col-sm-9">
                            <select class="demo-select2" multiple name="stories[]" required>
                                @foreach ($project->stories as $key => $story)
                                    <option value="{{ $story->id }}">{{ $story->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="start_date">Start Date</label>
                        <div class="col-sm-9">
                            <input type="date" placeholder="Start Date" id="start_date" name="start_date" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="end_date">End Date</label>
                        <div class="col-sm-9">
                            <input type="date" placeholder="End Date" id="end_date" name="end_date" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="panel-footer text-right">
                    <button class="btn btn-purple" type="submit">{{__('web.save')}}</button>
                </div>
            </form>
            <!--===================================================-->
            <!--End Horizontal Form-->

        </div>
    </div>

@endsection
