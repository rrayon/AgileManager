@extends('layouts.app')

@section('content')

    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-12">
                    <h3 class="panel-title">Burndown Chart</h3>
                </div>
            </div>
        </div>
        <div class="panel-body">
            <div id="demo-morris-line-legend" class="text-center">
            </div>
            <div id="demo-morris-line" style="height:268px">
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script type="text/javascript">
        $(document).ready(function(){
            var day_data = {{ substr(print_r($data), 0, -1) }};
            Morris.Line({
                element: 'demo-morris-line',
                data: day_data,
                xkey: 'elapsed',
                ykeys: ['value'],
                labels: ['value'],
                gridEnabled: true,
                gridLineColor: 'rgba(0,0,0,.1)',
                gridTextColor: '#8f9ea6',
                gridTextSize: '11px',
                lineColors: ['#177bbb'],
                lineWidth: 2,
                parseTime: false,
                resize:true,
                hideHover: 'auto'
            });

        });
    </script>

@endsection
