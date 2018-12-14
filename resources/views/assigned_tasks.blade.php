@extends('layouts.app')

@section('content')

    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">To Do</h3>
                </div>
                <div class="panel-body">
                    @foreach (Auth::user()->tasks->where('status', 'Pending') as $key => $task)
                        <div class="panel-group accordion" id="demo-acc-info-outline">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <a data-parent="#demo-acc-info-outline" data-toggle="collapse" href="#demo-acd-info-outline-{{ $key }}" class="collapsed" aria-expanded="false">{{ $task->name }} ({{ date('d.m.Y', $task->start_date) }} - {{ date('d.m.Y', $task->start_date) }})</a>
                                            </div>
                                            <div class="col-sm-3" style="top:8px;">
                                                <a href="{{ route('tasks.doing', $task->id) }}" class="btn btn-sm btn-success"><i class="fa fa-arrow-up"></i></a>
                                            </div>
                                        </div>
                                    </h4>
                                </div>
                                <div class="panel-collapse collapse" id="demo-acd-info-outline-{{ $key }}" aria-expanded="false">
                                    <div class="panel-body">
                                        <?php echo $task->description; ?>
                                    </div>
                                    <ul class="list-group">
                                        <li class="list-group-item">Asigned To : {{ $task->user->name }}</li>
                                        <li class="list-group-item">Weight : {{ $task->weight }}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Doing</h3>
                </div>
                <div class="panel-body">
                    @foreach (Auth::user()->tasks->where('status', 'Doing') as $key => $task)
                        <div class="panel-group accordion" id="demo-acc-info-outline">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <a data-parent="#demo-acc-info-outline" data-toggle="collapse" href="#demo-acd-info-outline-{{ $key }}" class="collapsed" aria-expanded="false">{{ $task->name }} ({{ date('d.m.Y', $task->start_date) }} - {{ date('d.m.Y', $task->start_date) }})</a>
                                            </div>
                                            <div class="col-sm-4" style="top:8px;">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <a href="{{ route('tasks.undo', $task->id) }}" class="btn btn-sm btn-warning"><i class="fa fa-arrow-down"></i></a>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <a href="{{ route('tasks.done', $task->id) }}" class="btn btn-sm btn-warning"><i class="fa fa-arrow-up"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </h4>
                                </div>
                                <div class="panel-collapse collapse" id="demo-acd-info-outline-{{ $key }}" aria-expanded="false">
                                    <div class="panel-body">
                                        <?php echo $task->description; ?>
                                    </div>
                                    <ul class="list-group">
                                        <li class="list-group-item">Asigned To : {{ $task->user->name }}</li>
                                        <li class="list-group-item">Weight : {{ $task->weight }}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Done</h3>
                </div>
                <div class="panel-body">
                    @foreach (Auth::user()->tasks->where('status', 'Done') as $key => $task)
                        <div class="panel-group accordion" id="demo-acc-info-outline">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div class="row">
                                            <div class="col-sm-9">
                                                <a data-parent="#demo-acc-info-outline" data-toggle="collapse" href="#demo-acd-info-outline-{{ $key }}" class="collapsed" aria-expanded="false">{{ $task->name }} ({{ date('d.m.Y', $task->start_date) }} - {{ date('d.m.Y', $task->start_date) }})</a>
                                            </div>
                                            <div class="col-sm-3" style="top:8px;">
                                                <a href="{{ route('tasks.doing', $task->id) }}" class="btn btn-sm btn-warning"><i class="fa fa-arrow-down"></i></a>
                                            </div>
                                        </div>
                                    </h4>
                                </div>
                                <div class="panel-collapse collapse" id="demo-acd-info-outline-{{ $key }}" aria-expanded="false">
                                    <div class="panel-body">
                                        <?php echo $task->description; ?>
                                    </div>
                                    <ul class="list-group">
                                        <li class="list-group-item">Asigned To : {{ $task->user->name }}</li>
                                        <li class="list-group-item">Weight : {{ $task->weight }}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

@endsection
