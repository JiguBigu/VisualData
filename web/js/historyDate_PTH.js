var historyOption_P ;
var historyOption_T ;
var historyOption_H ;

//读取数据并可视化
function havechoose(){
   historyData_P();
   historyData_T();
   historyData_H();
}
function historyData_P() {
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    $.ajax({
        type : 'post',	//传输类型
        async : false,	//同步执行
        url : '/logic/historyMachine',	//web.xml中注册的Servlet的url-pattern
        data : {"startDate":startDate, "endDate":endDate, "machineNumber":"machineNumber"},
        dataType : 'json', //返回数据形式为json
        success : function(result) {
            if (result) {
                console.log(result);
                //初始化xAxis[0]的data
                historyOption_P.xAxis[0].data = [];
                for (var i=0; i<result.length; i++) {
                    historyOption_P.xAxis[0].data.push(result[i].time);
                }
                //初始化series[0]的data
                historyOption_P.series[0].data = [];
                for (var i=0; i<result.length; i++) {
                    historyOption_P.series[0].data.push( parseInt(result[i].power));
                }
            }
        },
        error : function(errorMsg) {
            alert("加载数据失败");
        }
    });//AJAX
    var myChart = echarts.init(document.getElementById('historyData_P'));
    myChart.showLoading();

    //加载数据到option
    myChart.hideLoading();
    myChart.setOption(historyOption_P);
}
function historyData_T() {
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    $.ajax({
        type : 'post',	//传输类型
        async : false,	//同步执行
        url : '/logic/historyMachine',	//web.xml中注册的Servlet的url-pattern
        data : {"startDate":startDate, "endDate":endDate, "machineNumber":"machineNumber"},
        dataType : 'json', //返回数据形式为json
        success : function(result) {
            if (result) {
                console.log(result);
                //初始化xAxis[0]的data
                historyOption_T.xAxis[0].data = [];
                for (var i=0; i<result.length; i++) {
                    historyOption_T.xAxis[0].data.push(result[i].time);
                }
                //初始化series[0]的data
                historyOption_T.series[0].data = [];
                for (var i=0; i<result.length; i++) {
                    historyOption_T.series[0].data.push( parseInt(result[i].power));
                }
            }
        },
        error : function(errorMsg) {
            alert("加载数据失败");
        }
    });//AJAX
    var myChart = echarts.init(document.getElementById('historyData_T'));
    myChart.showLoading();

    //加载数据到option
    myChart.hideLoading();
    myChart.setOption(historyOption_T);
}
function historyData_H() {
    var startDate = document.getElementById("startDate").value;
    var endDate = document.getElementById("endDate").value;
    $.ajax({
        type : 'post',	//传输类型
        async : false,	//同步执行
        url : '/logic/historyMachine',	//web.xml中注册的Servlet的url-pattern
        data : {"startDate":startDate, "endDate":endDate, "machineNumber":"machineNumber"},
        dataType : 'json', //返回数据形式为json
        success : function(result) {
            if (result) {
                console.log(result);
                //初始化xAxis[0]的data
                historyOption_H.xAxis[0].data = [];
                for (var i=0; i<result.length; i++) {
                    historyOption_H.xAxis[0].data.push(result[i].time);
                }
                //初始化series[0]的data
                historyOption_H.series[0].data = [];
                for (var i=0; i<result.length; i++) {
                    historyOption_H.series[0].data.push( parseInt(result[i].power));
                }
            }
        },
        error : function(errorMsg) {
            alert("加载数据失败");
        }
    });//AJAX
    var myChart = echarts.init(document.getElementById('historyData_H'));
    myChart.showLoading();

    //加载数据到option
    myChart.hideLoading();
    myChart.setOption(historyOption_H);
}

/*湿度图表option设置*/
historyOption_H = {
    tooltip : {
        show : false
    },
    title: {
        text: '湿度'
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
/*温度图表option设置*/
historyOption_T = {
    tooltip : {
        show : false
    },
    title: {
        text: '温度'
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

/*能耗图表option设置*/
historyOption_P = {
    tooltip : {
        show : false
    },
    title: {
        text: '能耗'
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