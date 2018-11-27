@extends('layouts.app')

@section('content')

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}"><i class="demo-pli-home"></i></a></li>
            <li><a href="{{ route('projects.index') }}">My Projects</a></li>
            <li><a href="{{ route('projects.show', $story->project->id) }}">{{ $story->project->name }}</a></li>
            <li><a href="{{ route('stories.index', $story->project->id) }}">{{ $story->name }}</a></li>
            <li class="active">Tasks</li>
        </ol>
    </div>

    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Task Information</h3>
            </div>

            <!--Horizontal Form-->
            <!--===================================================-->
            <form class="form-horizontal" action="{{ route('tasks.store') }}" method="POST" enctype="multipart/form-data">
            	@csrf
                <div class="panel-body">
                    <input type="hidden" name="story_id" value="{{ $story->id }}">
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="name">{{__('web.name')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{__('web.name')}}" id="name" name="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="banner">Description</label>
                        <div class="col-sm-9">
                            <textarea class="demo-summernote" name="description" required></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="weight">Weight</label>
                        <div class="col-sm-9">
                            <input type="number" min="1" max="10" placeholder="Weight" id="weight" name="weight" class="form-control" required>
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
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="end_date">Asigned Employee</label>
                        <div class="col-sm-9">
                            <select required class="form-control demo-select2-placeholder" name="user_id">
                                @foreach ($story->project->contributors as $key => $contributor)
                                    <option value="{{ $contributor->user_id }}">{{ $contributor->user->name }} - {{ $contributor->role }}</option>
                                @endforeach
                            </select>
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
