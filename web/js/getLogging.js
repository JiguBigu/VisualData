function setMessageInnerHTML(innerHTML) {
}
function logging(innerHTML) {
    document.getElementById("good").style.display = "none";
    document.getElementById('warn').style.display = "block";
    var param = Array();
    param = innerHTML.split(" ");
    document.getElementById("machineId").innerHTML = param[0];
    document.getElementById("warnId").innerHTML = param[1];
}
//关闭WebSocket连接
function closeWebSocket() {
    websocket.close();
}
$(document).ready(function start() {
    var websocket = null;
    console.log("!!!!!!!!!!!!!");
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://10.164.13.123:8080/log");
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
        logging(event.data);
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

