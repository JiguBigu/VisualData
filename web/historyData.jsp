<%--
  Created by IntelliJ IDEA.
  User: Jigubigu
  Date: 2018/10/27
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选择查询区间</title>
    <!--开始css样式和库的导入-->
    <link rel="stylesheet" href="css/buttons.css">
    <%--使用带下拉菜单的按钮时--%>
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <%--使用字体图标--%>
    <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/echarts.js"></script>
    <link type="text/css" href="css/login.css" rel="stylesheet" />
    <script type="text/javascript" src="js/easyTooltip.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/moment.min.js"></script>
    <script type="text/javascript" src="js/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="css/daterangepicker.css" />
    <script type="text/javascript" src="js/option.js"></script>
    <script type="text/javascript" src="js/npm.js"></script>
    <!--导入结束-->
</head>
<body>

<div id="container">
    <div class="logo">
        <a href="#"><img src="assets/logo2.jpg" alt="" /></a>
    </div>
    <div id="box">
        <form>
            <form>
                <p class="main">
                    <label style="color:#A8A8A8;font-size: large;"><strong>起始时间：</strong></label><br />
                    <input type="text" name="startDate" id="startDate" style="float: left;" value="" />
                    <script type="text/javascript">
                        $('input[name="startDate"]').daterangepicker({
                            timePicker: false, //显示时间
                            showDropdowns: true, //年月份下拉框
                            singleDatePicker: true,
                            startDate: moment().hours(0).minutes(0).seconds(0), //设置开始日期
                            endDate: moment(new Date()), //设置结束器日期
                            maxDate: moment(new Date()), //设置最大日期
                            "opens": "center",
                            ranges: {
                                // '今天': [moment(), moment()],
                                '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                                '上周': [moment().subtract(6, 'days'), moment()],
                                '前30天': [moment().subtract(29, 'days'), moment()],
                                '本月': [moment().startOf('month'), moment().endOf('month')],
                                '上月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                            },
                            showWeekNumbers: true,
                            locale: {
                                format: "YYYY-MM-DD", //设置显示格式
                                applyLabel: '确定', //确定按钮文本
                                cancelLabel: '取消', //取消按钮文本
                                customRangeLabel: '自定义',
                                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                                    '七月', '八月', '九月', '十月', '十一月', '十二月'
                                ],
                                firstDay: 1
                            },
                        }, function(start, end, label) {
                            timeRangeChange = [start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD')];
                            console.log(timeRangeChange);
                        });
                    </script><br /><br/><br/>
                    <label style="color:#A8A8A8;font-size: large;"><strong>终止时间：</strong></label><br />
                    <input type="tetx" name="endDate" id="endDate" value="" />
                    <script type="text/javascript">
                        $('input[name="endDate"]').daterangepicker({
                            "autoApply": true, //选择日期后自动提交;只有在不显示时间的时候起作用timePicker:false
                            singleDatePicker: true, //单日历
                            showDropdowns: true, //年月份下拉框
                            /*timePicker: true, //显示时间
                            timePicker24Hour: true, //时间制*/
                            startDate: moment(), //设置开始日期
                            maxDate: moment(new Date()), //设置最大日期
                            "opens": "center",
                            showWeekNumbers: true,
                            locale: {
                                format: "YYYY-MM-DD", //设置显示格式
                                applyLabel: '确定', //确定按钮文本
                                cancelLabel: '取消', //取消按钮文本
                                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                                    '七月', '八月', '九月', '十月', '十一月', '十二月'
                                ],
                                firstDay: 1
                            },
                        }, function(start) {
                            console.log(start.format('YYYY-MM-DD'));
                        });
                    </script>
                    <select class="button-dropdown" data-buttons="dropdown" name="machineNumber"  id="machineNumber" style="float: right;width:80px;">
                        <option  value="machine1" selected = "machine1">机器01</option>
                        <option value="mechine2" >机器02</option>
                        <option value="machine3">机器03</option>
                        <option value="machine4">机器04</option>
                    </select>
                    <br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a onclick="havechoose()" style="font-size: 12px;" class="button button-rounded button-tiny"><span>查询</span></a>
            </form>
    </div>

</div><div id="myDiv" name="myDiv" style="height: 500px;"></div>
<div style=""></div>
</body>
</html>
