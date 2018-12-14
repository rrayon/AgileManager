@extends('layouts.app')

@section('content')

    @foreach ($backlogs as $key => $backlog)
        <li class="list-group-item">{{ $backlog->log }} on {{ $backlog->created_at }}</li>
        <br>
    @endforeach

@endsection
