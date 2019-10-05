<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/12/30
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据监控</title>
    <%--导入库和样式--%>
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
    <script type="text/javascript" src="js/historyDate_PTH.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/realTime_PTH.js"></script>
    <%--导入库和样式结束--%>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="login.jsp">智能制造</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="login.jsp">首页</a></li>
                <li><a href="chooseMachine.jsp">机器选择</a></li>
                <li><a href="#">刷新页面</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div style="height:35%;">
    <div id="realTime_P" name="realTime_P" style="width: 33%;height:90%;float: left;">
        <script>
            var realTimeChart_P = echarts.init(document.getElementById('realTime_P'));
            var realTimeOptin_P = {
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

                    realTimeOptin_P.series[0].data[0].value = event.data;
                    realTimeChart_P.setOption(realTimeOptin_P, true);
                    num++;
                }})
        </script>
    </div>
    <div id="realTime_T" name="realTime_T" style="width: 33%;height:90%;float: left">
        温度：
        <script>
            var realTimeChart_T = echarts.init(document.getElementById('realTime_T'));
            var realTimeOptin_T = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}℃"
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
                        max:100,
                        splitNumber:5,
                        name: '机器温度',
                        type: 'gauge',
                        detail: {formatter:'{value}℃'},
                        data: [{value: 05, name: ''}]
                    }
                ]
            };

            $(document).ready(function start() {
                var eventSource = new EventSource("time");
                var num = 0 ;
                eventSource.onmessage = function(event) {

                    realTimeOptin_T.series[0].data[0].value = event.data / 10;
                    realTimeChart_T.setOption(realTimeOptin_T, true);
                    num++;
                }})
        </script>
    </div>
    <div id="realTime_H" name="realTime_H" style="width: 33%;height:90%;float: left">
        湿度：
        <script>
            var realTimeChart_H = echarts.init(document.getElementById('realTime_H'));
            var realTimeOptin_H = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}%"
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
                        max:100,
                        splitNumber:5,
                        name: '湿度',
                        type: 'gauge',
                        detail: {formatter:'{value}%'},
                        data: [{value: 1, name: ''}]
                    }
                ]
            };

            $(document).ready(function start() {
                var eventSource = new EventSource("time");
                var num = 0 ;
                eventSource.onmessage = function(event) {

                    realTimeOptin_H.series[0].data[0].value = event.data / 10;
                    realTimeChart_H.setOption(realTimeOptin_H, true);
                    num++;
                }})
        </script>
    </div>
</div><hr>
<div style="height:175%">
    <div style="float: left">
        <p style="font-size:150%;"><strong>查询历史数据</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
    </div>
    <div style="float:left">
        <p style="font-size:140%;"><strong>起始时间:</strong></p>
</div>
    <div class="col-xs-2" style="float: left">
        <input type="date" name="startDate" id="startDate" class="form-control" placeholder=".col-xs-2">
    </div>
    <div style="float:left">
        <p style="font-size:140%;"><strong>起始时间:</strong></p>
    </div>
    <div class="col-xs-2" style="float:left">
        <input type="date" name="endDate" id="endDate" class="form-control" placeholder=".col-xs-2">
    </div>
    <div style="float:left">
       <button type="button" class="btn btn-primary" onclick="havechoose()">查询</button>
    </div>
    <div id="historyData_P" name="historyData_P" style="height: 20%;"></div><br />
    <div id="historyData_T" name="historyData_T" style="height: 20%;"></div>
    <div id="historyData_H" name="historyData_H" style="height: 20%;"></div>
</div>
<hr>
</body>
</html>
