@extends('layouts.app')

@section('content')

    <div class="col-sm-12">
        <div class="panel panel-primary">

            <!--Panel heading-->
            <div class="panel-heading">
                <div class="row">
                    <div class="col-sm-6">
                        <h3 class="panel-title">Sprint {{ $sprint->id }} ({{ date('d.m.Y', $sprint->start_date) }} - {{ date('d.m.Y', $sprint->start_date) }})</h3>
                    </div>
                </div>
            </div>

            <!--Panel body-->
            <div class="panel-body">
                <form class="form-horizontal" action="{{ route('points.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="sprint_id" value="{{ $sprint->id }}">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" placeholder="Meeting Title" name="name" class="form-control" value="" required>
                        </div>
                    </div>
                    @foreach ($sprint->project->contributors as $key => $contributor)
                        <div class="panel panel-body">
                            <div class="row">
                                <div class="col-sm-4">
                                    <p class="form-control">{{ $contributor->user->name }} ({{ $contributor->role }})</p>
                                </div>
                                <div class="col-sm-8">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="a">A</label>
                                        <div class="col-sm-9">
                                            <input type="radio" name="a_{{ $contributor->id }}" value="0">
                                            <input type="radio" name="a_{{ $contributor->id }}" value="1">
                                            <input type="radio" name="a_{{ $contributor->id }}" value="2">
                                            <input type="radio" name="a_{{ $contributor->id }}" value="3">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="b">B</label>
                                        <div class="col-sm-9">
                                            <input type="radio" name="b_{{ $contributor->id }}" value="0">
                                            <input type="radio" name="b_{{ $contributor->id }}" value="1">
                                            <input type="radio" name="b_{{ $contributor->id }}" value="2">
                                            <input type="radio" name="b_{{ $contributor->id }}" value="3">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="c">C</label>
                                        <div class="col-sm-9">
                                            <input type="radio" name="c_{{ $contributor->id }}" value="0">
                                            <input type="radio" name="c_{{ $contributor->id }}" value="1">
                                            <input type="radio" name="c_{{ $contributor->id }}" value="2">
                                            <input type="radio" name="c_{{ $contributor->id }}" value="3">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="d">D</label>
                                        <div class="col-sm-9">
                                            <input type="radio" name="d_{{ $contributor->id }}" value="0">
                                            <input type="radio" name="d_{{ $contributor->id }}" value="1">
                                            <input type="radio" name="d_{{ $contributor->id }}" value="2">
                                            <input type="radio" name="d_{{ $contributor->id }}" value="3">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                    <div class="form-group">
                        <button class="btn btn-purple pull-right" type="submit">{{__('web.save')}}</button>
                    </div>
                </form>
            </div>
        </div>

    </div>

@endsection
