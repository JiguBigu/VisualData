<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/10/19
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="js/jquery.js"></script>
    <script src="js/echarts.js"></script>
    <title>Insert title here</title>

</head>
<body>


<br  /><br>

<div id="myDiv" style="height: 400px"></div>
<script>
    var myChart = echarts.init(document.getElementById('myDiv'));
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
                data: [{value: 50, name: '机器功率'}]
            }
        ]
    };

    $(document).ready(function start() {
        var eventSource = new EventSource("realTimeData_simulation");
        var num = 0 ;
        eventSource.onmessage = function(event) {

            option.series[0].data[0].value = event.data;
            myChart.setOption(option, true);
            num++;
        }})
</script>
</body>
</html>