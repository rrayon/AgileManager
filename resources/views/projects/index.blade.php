@extends('layouts.app')

@section('content')

    @foreach (Auth::user()->projects as $key => $project)
        <div class="col-sm-6">
            <div class="panel panel-primary">

                <!--Panel heading-->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-8">
                            <a href="{{ route('projects.show', $project->id) }}"><h3 class="panel-title">{{ $project->name }} ({{ date('d.m.Y', $project->start_date) }} - {{ date('d.m.Y', $project->start_date) }})</h3></a>
                        </div>
                        <div class="col-sm-4 text-right" style="margin-top:5px;">
                            <a href="{{route('projects.edit', $project->id)}}" class="btn btn-mint btn-icon"><i class="demo-psi-pen-5 icon-lg"></i></a>
                            <a onclick="confirm_modal('{{route('projects.destroy', $project->id)}}');" class="btn btn-danger btn-icon" style="margin-right:5px;
                                "><i class="demo-psi-recycling icon-lg"></i></a>
                        </div>
                    </div>
                </div>

                <!--Panel body-->
                <div class="panel-body">
                    <div class="nano has-scrollbar" style="height: 150px">
                        <div class="nano-content" tabindex="0" style="right: -17px;">
                            <?php echo $project->description; ?>
                        </div>
                    <div class="nano-pane"><div class="nano-slider" style="height: 20px; transform: translate(0px, 1.32453px);"></div></div></div>
                </div>
            </div>

        </div>
    @endforeach

@endsection
