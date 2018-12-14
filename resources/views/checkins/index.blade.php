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
                @foreach ($sprint->checkins as $key => $checkin)
                    <a href="{{ route('points.index', $checkin->id) }}"><li class="list-group-item">{{ $checkin->name }}</li></a>
                @endforeach
                <br>
                @if (Auth::user()->id == $sprint->project->user->id)
                    <a href="{{ route('checkins.create', $sprint->id) }}" class="btn btn-block btn-info">Add New Checkin</a>
                @endif
            </div>
        </div>

    </div>

@endsection
