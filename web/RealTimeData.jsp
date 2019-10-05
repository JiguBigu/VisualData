<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/10/11
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.awt.*,java.sql.*,javax.swing.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选择查询区间</title>
    <link type="text/css" href="css/login.css" rel="stylesheet" />
    <link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/easyTooltip.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="css/daterangepicker.css" />
</head>
<body>

<div id="container">
    <div class="logo">
        <a href="#"><img src="assets/logo2.jpg" alt="" /></a>
    </div>
    <div id="box">
        <form action="RealTimeDataResult.jsp" method="post" >
            <label><font color="#A8A8A8"><strong>请选择您要查询的机器：</strong></font></label>
            <select>
                <p class = "main">
                    <option value="machine1" selected = "machine1">机器01</option>
                    <option value="mechine2" >机器02</option>
                    <option value="machine3">机器03</option>
                    <option value="machine4">机器04</option>
                </p>
                <p>
                    <input value="选择" type="submit" class="login" style="cursor: pointer;"/>
                </p>
            </select>
        </form>
    </div>
</div>

</body>
</html>
