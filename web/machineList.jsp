<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/12/14
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机器清单</title>
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

    <script type="text/javascript" src="js/echarts.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/task.js"></script>
    <style type="text/css">
        .allParameter{
            font-size: large;
        }
    </style>
</head>
<body background="assets/stripes-light.png">

<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="login.jsp">智能制造</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="login.jsp">首页</a></li>
                <li><a href="list.jsp">选择页</a> </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div id="warn" class="alert alert-danger" role="alert" style="display: none">
        <strong>警告：</strong>机器<a id="machineId">1002</a>产生异常，错误类型：<a id="warnId">2</a>&nbsp;&nbsp;请停止机器工作，并及时检修！
    </div>
    <div id="good" class="alert alert-success" role="alert" style="display: block ">
        <strong>&nbsp;&nbsp;监控：</strong>所有机器工作正常
    </div>

    <div class="allParameter">
        <p>机器总数：4 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            总任务：4
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已完成任务：2</p>
    </div>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-3">
            <div style="height: 10%"></div>

            <label style="font-size: large">机器1001</label><br/>
            <a href="chooseMachine.jsp?machineId='1'" ><img style="max-width: 90%;max-height: 90%;" src="assets/machine1001.png"></a>
            <br />任务1<div id="task1" name="task1" style="width: 100%;height: 3%;"></div>
            任务2<div id="task2" name="task2" style="width: 100%;height: 3%;"></div>

            <%--<div style="height: 6%"></div>
            <form action="/chooseMachine" method="post">
                <label style="font-size: large" name="machineId">机器1003</label><br />
                <a href="chooseMachine.jsp?machineId='3'" ><img style="max-width: 90%;max-height: 90%;" src="assets/machine1001.png"></a>
            </form>--%>
        </div>
        <div class="col-md-3">
<%--            <div style="height: 10%"></div>
            <label name="machineId" style="font-size: large">机器1002</label><br />
            <a href="chooseMachine.jsp?machineId='2'" ><img style="max-width: 90%;max-height: 90%;" src="assets/machine1001.png"></a>
            <br />
            <br />
            <div style="height: 6%"></div>
            <label style="font-size: large">机器1004</label><br/>
            <a href="chooseMachine.jsp?machineId='1'" ><img style="max-width: 90%;max-height: 90%;" src="assets/machine1001.png"></a>--%>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
</body>
</html>
