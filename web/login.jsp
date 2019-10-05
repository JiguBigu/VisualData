<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/10/11
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  import ="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>智能化工厂</title>
    <link type="text/css" href="css/login.css" rel="stylesheet" />
    <link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/easyTooltip.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
</head>
<body>
<div id="container">
    <div class="logo">
        <a href="#"><img src="assets/logo2.jpg" alt="" /></a>
        <!-- <img src="assets/1552.jpg" alt="" /> -->
    </div>
    <div id="box">
        <form action="logic/doLogin" method="post" autocomplete="on">
        <%--<jsp:useBean id="loginUser" class="logic.doLogin" scope="session"></jsp:useBean>--%>
            <form>
            <p class="main">
                <label>用户名：</label>
                <input type="text" name="username" value=""/>
                <label>密码：</label>
                <input type="password" name="password" value="">
            </p>
            <p class="space">
                <input type="submit" value="登录" class="login" style="cursor: pointer;" />
            </p>
        </form><%--
            <form action="registered.jsp" style="float: right">
                <input  type="submit" value="注册" class="login" style="cursor: pointer;" />
            </form>--%>
    </div>
</div>
</body>
</html>