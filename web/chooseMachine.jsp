<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/12/10
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据监控</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--    <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
    <script type="text/javascript" src="js/option.js"></script>
    <script type="text/javascript" src="js/getLogging.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>p{line-height: 90%}</style>
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="login.jsp">智能制造</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
            <li><a href="list.jsp">选择页</a> </li>
            <li><a href="machineList.jsp">机器选择</a></li>
            <li><a href="#">刷新页面</a>
            </li>
        </ul>
    </div>
</div>
</nav>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-md-3"  >
            <div class="jumbotron" style="height: 30%;padding: 4%;top: 40%;">
                <img style="padding: 8%;height: 250px;top:0;bottom:0;left:0;right:0;width:100%;margin:auto;" src="assets/machine1001.png">
            </div>
            <div class="jumbotron" style="height: 30%;padding: 0%;" id="machinea">
                <div style="height: 20%;">
                    <p>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>机器参数：</strong>
                    </p>
                    <p id="n">
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>进给率： 0  &nbsp;mm/min</strong>
                    </p>
                    <p id="f">
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>主轴转速：0  &nbsp;n/min</strong>
                    </p>
                    <p id="ap">
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>切割深度：0  &nbsp;mm</strong>
                    </p>
                    <p id="ae">
                        &nbsp;&nbsp;&nbsp;&nbsp;<strong>切割宽度：0  &nbsp;mm</strong>
                    </p>
                </div>
                <div id="machine" style="height: 80%;width: 100%"></div>
                <script>
                    setInterval(function start( ) {
                        $.ajax({
                            type : 'post',	//传输类型
                            async : false,	//同步执行
                            url : '/machineParameter',	//web.xml中注册的Servlet的url-pattern
                            data : { "machineId":machine},
                            dataType : 'json', //返回数据形式为json
                            success : function(result) {
                                if (result) {
                                    var n = parseFloat(result[0].n);
                                    var f = parseFloat(result[0].f);
                                    var ap = parseFloat(result[0].ap);
                                    var ae = parseFloat(result[0].ae);
                                    document.getElementById("n").innerHTML = " &nbsp;&nbsp;&nbsp;&nbsp;<strong>    进给率：</strong> "+ n +"<strong> mm/min</strong>";
                                    document.getElementById("f").innerHTML = " &nbsp;&nbsp;&nbsp;&nbsp;<strong>    主轴转速：</strong> "+ f +"<strong> n/min</strong>";
                                    document.getElementById("ap").innerHTML =" &nbsp;&nbsp;&nbsp;&nbsp;<strong>    切割深度：</strong> "+ ap +"<strong> mm</strong>";
                                    document.getElementById("ae").innerHTML = " &nbsp;&nbsp;&nbsp;&nbsp;<strong>    切割宽度：</strong> "+ ae +" <strong>mm</strong>";

                                }
                            },
                            error : function(errorMsg) {
                               console.log("Erro");
                            }
                        });
                        $.ajax({
                            type : 'post',	//传输类型
                            async : false,	//同步执行
                            url : '/logServlet',	//web.xml中注册的Servlet的url-pattern
                            data : {},
                            dataType : 'json', //返回数据形式为json
                            success : function(result) {
                                if (result) {
                                    var str="";
                                    for (var i = 0; i < result.length; i++){
                                       str += "<p style=\"font-size:large;\">时间："+
                                            result[i].time +" 机器号："+ result[i].machineId + " 日志信息：" +
                                           result[i].log + "</p>";
                                    }
                                    document.getElementById("log").innerHTML  =str;
                                }
                            },
                            error : function(errorMsg) {
                                console.log("Erro");
                            }
                        });
                    },1000);
                </script>
            </div>
            <div class="jumbotron" style="height: 30%;padding: 10%;">
                <p><strong>全局日志</strong></p>
            <marquee direction=down scrollamount=1 scrolldelay=100 height=100% onMouseOver=this.stop(); onMouseOut=this.start();>
                <div  id="log" style="width: 100%;height: 100%;overflow: auto;">

                </div>
            </marquee>
            </div>
        </div>
        <div class="col-md-6" style="padding: 0%;">
            <div id="warn" class="alert alert-danger alert-dismissible" role="alert" style="display: none">
                <button type="button" class="close"  data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <strong>警告：</strong>机器<a id="machineId">1002</a>产生异常，错误类型：<a id="warnId">2</a>&nbsp;&nbsp;请及时检修！
            </div>
            <script>
                function hidden(){
                    document.getElementById("warn").style.display = "none";
                }
            </script>

            <div id="good" class="alert alert-success" role="alert" style="display: block ">
                <strong>&nbsp;&nbsp;监控：</strong>所有机器工作正常
            </div>
            <div id="myDiv" name="myDiv" style="height: 80%;width:100%;padding: 0%;right: 1%;display: block;"></div>
           </div>
        <div class="col-md-3" style="padding: 0%">
            <div class="jumbotron" id="realTime" name="realTimeData" style="padding:0px;height: 30%">
                <div id="realTimeData" name="realTimeData" style="height: 120%;width: 120%; padding: 0%;right:7%"></div>
                <%
                    String machineId = (String)request.getParameter("machineId");
                    session.setAttribute("machineId", machineId);
                %>
           <script>
               var machine = ${machineId};
               var myChart2 = echarts.init(document.getElementById('realTimeData'));
               var option2 = {
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
                           max:400,
                           splitNumber:5,
                           name: '机器能耗',
                           type: 'gauge',
                           detail: {formatter:'{value}w'},
                           data: [{value: 50, name: ''}]
                       }
                   ]
               };

               //将消息显示在网页上
               function setMessageInnerHTML(data) {
                   option2.series[0].data[0].value = data;
                   myChart2.setOption(option2, true);
                   //document.getElementById().innerHTML = "开启";
                   console.log("data from WebSocket::" + data);
               }

               //关闭WebSocket连接
               function closeWebSocket() {
                   websocket.close();
               }
               $(document).ready(function start() {
                   var websocket = null;
                   //判断当前浏览器是否支持WebSocket
                   if ('WebSocket' in window) {
                       websocket = new WebSocket("ws://10.164.13.123:8080/" + machine);
                   }
                   else {
                       alert('当前浏览器 Not support websocket')
                   }

                   //连接发生错误的回调方法
                   websocket.onerror = function () {
                       setMessageInnerHTML("WebSocket连接发生错误");
                   };

                   //连接成功建立的回调方法
                   websocket.onopen = function () {
                       setMessageInnerHTML("WebSocket连接成功");
                   }

                   //接收到消息的回调方法
                   websocket.onmessage = function (event) {
                       setMessageInnerHTML(event.data);
                   }

                   //连接关闭的回调方法
                   websocket.onclose = function () {
                       setMessageInnerHTML("WebSocket连接关闭");
                   }

                   //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
                   window.onbeforeunload = function () {
                       closeWebSocket();
                   }
               })

           </script>
            </div>
            <div  id="jumbotron" style="height: 30%;-webkit-align-items: center;">
                <label >查询历史数据：</label>
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon2">起始时间：</span>
                    <input type="date" class="form-control" id="startDate" name="startDate" value="" aria-describedby="sizing-addon2">
                </div><br />
                <div class="input-group">
                    <span class="input-group-addon" id="sizing-addon3">终止时间：</span>
                    <input type="date" name="endDate" id="endDate" class="form-control" value="" aria-describedby="sizing-addon2">
                </div><br />
                <button type="button" class="btn btn-primary" onclick="havechoose()" style="position: absolute;left: 80%;">查询</button>

            </div>
            <div style="height: 30%;background-color: #1b1e21">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
   window.onload = myfun(machine);
</script>

</body>
</html>
