@extends('layouts.app')

@section('content')

    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Project Information</h3>
            </div>

            <!--Horizontal Form-->
            <!--===================================================-->
            <form class="form-horizontal" action="{{ route('projects.store') }}" method="POST" enctype="multipart/form-data">
            	@csrf
                <div class="panel-body">
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
