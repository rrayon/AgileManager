@extends('layouts.app')

@section('content')

    <div class="col-sm-12">
        <div class="panel panel-primary">

            <!--Panel heading-->
            <div class="panel-heading">
                <div class="row">
                    <div class="col-sm-6">
                        <h3 class="panel-title">{{ $checkin->name }}</h3>
                    </div>
                </div>
            </div>

            <!--Panel body-->
            <div class="panel-body">
                @foreach ($checkin->sprint->project->contributors as $key => $contributor)
                    <div class="panel panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <strong>{{ $contributor->user->name }} ({{ $contributor->role }})</strong>
                                <br>
                                @php
                                    $point = $contributor->points->where('checkin_id', $checkin->id)->first();
                                    $sum = $point->a + $point->b + $point->c +$point->d;
                                @endphp
                                <p>Points {{ $sum }}</p>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

    </div>

@endsection
