var myChart = echarts.init(document.getElementById('realTimeData'));
var option = {
    tooltip : {
        formatter: "{a} <br/>{b} : {c}w"
    },
    toolbox: {
        feature: {
            restore: {},
            saveAsImage: {}
        }
    },
    series: [
        {
            min:0,
            max:1000,
            splitNumber:5,
            name: '机器能耗',
            type: 'gauge',
            detail: {formatter:'{value}w'},
            data: [{value: 50, name: ''}]
        }
    ]
};

$(document).ready(function start() {
    var eventSource = new EventSource("time");
    var num = 0 ;
    eventSource.onmessage = function(event) {

        option.series[0].data[0].value = event.data;
        myChart.setOption(option, true);
        num++;
    }})