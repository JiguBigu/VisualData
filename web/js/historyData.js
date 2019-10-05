//echarts部分设置
var option = {
    tooltip : {
        show : false
    },
    title: {
        text: '机器1历史功率'
    },
    tooltip: {
        trigger: 'axis'
    },
    toolbox: {
        left: 'center',
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            restore: {},
            saveAsImage: {}
        }
    },
    dataZoom: [{
        startValue: '2018-08-07 09:43:33.0'
    }, {
        type: 'inside'
    }],
    /*-----------------------*/
    visualMap: {
        top: 10,
        right: 10,
        pieces: [{
            gt: 0,
            lte: 100,
            color: '#096'
        }, {
            gt: 100,
            lte: 200,
            color: '#ffde33'
        }, {
            gt: 200,
            lte: 300,
            color: '#ff9933'
        }, {
            gt: 300,
            lte: 400,
            color: '#cc0033'
        }, {
            gt: 400,
            lte: 500,
            color: '#660099'
        }, {
            gt: 500,
            color: '#7e0023'
        }],
        outOfRange: {
            color: '#999'
        }
    },
    legend : {
        data : [ '消耗功率' ]
    },
    xAxis : [ {
        type : 'category'
    } ],
    yAxis : [ {
        type : 'value'
    } ],
    series : [ {
        name : '功率',
        type : 'line'
    } ]
};
//读取数据并可视化
function havechoose(){
    /*document.write("<div id=\"myDiv\" style=\"height: 400px;weight: 200px;\"></div>");*/
    /*document.write("<div id='myDiv'style='height: 4000px;weight: 2000px;'></div>");*/
    //var startDate = document.getElementById("startDate").value;
   // var endDate = document.getElementById("endDate").value;
   // var machineNumber = document.getElementById("machineNumber").value;
    $.ajax({
        type : 'post',	//传输类型
        async : false,	//同步执行
        url : '/logic/historyMachine',	//web.xml中注册的Servlet的url-pattern
        data : {"startDate":"startDate", "endDate":"endDate", "machineNumber":"machineNumber"},
        dataType : 'json', //返回数据形式为json
        success : function(result) {
            if (result) {
                console.log(result);
                //初始化xAxis[0]的data
                option.xAxis[0].data = [];
                for (var i=0; i<result.length; i++) {
                    option.xAxis[0].data.push(result[i].time);
                }
                //初始化series[0]的data
                option.series[0].data = [];
                for (var i=0; i<result.length; i++) {
                    option.series[0].data.push( parseInt(result[i].power));
                }
            }
        },
        error : function(errorMsg) {
            alert("加载数据失败");
        }
    });//AJAX
    var myChart = echarts.init(document.getElementById('historyData'));
    myChart.showLoading();

    //加载数据到option
    //loadData(option);
    //设置option
    myChart.hideLoading();
    myChart.setOption(option);
}