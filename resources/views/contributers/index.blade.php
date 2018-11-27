@extends('layouts.app')

@section('content')

    <div class="row">
        <ol class="breadcrumb">
            <li><a href="{{ route('home') }}"><i class="demo-pli-home"></i></a></li>
            <li><a href="{{ route('projects.index') }}">My Projects</a></li>
            <li><a href="{{ route('projects.show', $project->id) }}">{{ $project->name }}</a></li>
            <li class="active">Contributors</li>
        </ol>
    </div>

    <div class="col-sm-6">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Contributors</h3>
            </div>
            <div class="panel-body">
                <ul class="list-group">
                    @foreach ($project->contributors as $key => $contributor)
                        <li class="list-group-item">{{ $contributor->user->name }} - {{ $contributor->role }}</li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>

    @if (Auth::user()->id == $project->user_id)
        <div class="col-sm-6">
            <div class="panel">
                <div class="panel-heading">
                    <h3 class="panel-title">Contributor Information</h3>
                </div>

                <!--Horizontal Form-->
                <!--===================================================-->
                <form class="form-horizontal" action="{{ route('contributors.store') }}" method="POST" enctype="multipart/form-data">
                	@csrf
                    <div class="panel-body">
                        <input type="hidden" name="project_id" value="{{ $project->id }}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="name">{{__('web.name')}}</label>
                            <div class="col-sm-9">
                                <input type="text" placeholder="{{__('web.name')}}" id="name" name="name" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="email">Email</label>
                            <div class="col-sm-9">
                                <input type="email" placeholder="Weight" id="email" name="email" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="end_date">Role</label>
                            <div class="col-sm-9">
                                <select required class="form-control demo-select2-placeholder" name="role">
                                    <option value=""></option>
                                    <option value="Team Member">Team Member</option>
                                    <option value="Project Manager">Project Manager</option>
                                    <option value="Product Manager">Product Manager</option>
                                    <option value="Scrum Master">Scrum Master</option>
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
    @endif

@endsection
