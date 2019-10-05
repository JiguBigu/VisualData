<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/10/11
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请选择您需要的服务</title>
    <!-- Libraries -->
    <link type="text/css" href="css/login.css" rel="stylesheet" />
    <link type="text/css" href="css/smoothness/jquery-ui-1.7.2.custom.html" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/easyTooltip.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.7.2.custom.min.js"></script>
    <!-- End of Libraries -->
</head>
<body>
<div id="container">
    <div class="logo">
        <a href="#"><img src="assets/logo2.jpg" alt="" /></a>
    </div>
    <div id="box">
        <%
            String loginUser = "";
            if(session.getAttribute("loginUser")!=null)
            {
                loginUser = session.getAttribute("loginUser").toString();
            }
        %>
        <font color="#A8A8A8">
            欢迎您<strong><%=loginUser%></strong>,登录成功！<br />
            您可以使用以下服务：
        </font>
    </div>
    <div id="button1" src=>
        <a href="historyData.jsp"><img src="assets/button1.jpg" alt="" /></a>
    </div>
    <div id="button2">
        <a href="RealTimeData.jsp"><img src="assets/button2.jpg" alt="" /></a>
    </div>
</div>
</body>
</html>