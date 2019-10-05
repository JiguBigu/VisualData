package scoket;

import com.jdbc.Data;
import com.jdbc.jdbc;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Array;
import java.sql.SQLException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint("/log")
public class WebSocket_log {
    /**
     * 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的
     */
    private static int onlineCount = 0;

    /**
     * concurrent包的线程安全Set，
     * 用来存放每个客户端对应的MyWebSocket对象。
     * 若要实现服务端与单一客户端通信的话，
     * 可以使用Map来存放，
     * 其中Key可以为用户标识
     */
    private static CopyOnWriteArraySet<WebSocket_log> webSocketSet = new CopyOnWriteArraySet<WebSocket_log>();

    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;


    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session){
        this.session = session;
        /**
         * 加入set中
         */
        webSocketSet.add(this);
        /**
         * 在线数加1
         */
        addOnlineCount();
        System.out.println("当前在线人数：" + getOnlineCount());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(){
        webSocketSet.remove(this);  //从set中删除
        subOnlineCount();           //在线数减1
        System.out.println("当前在线人数：" + getOnlineCount());
    }


    /**
     * 收到客户端消息后调用的方法
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) throws UnsupportedEncodingException {
        System.out.println("来自客户端的消息：" + message);
        String a[] = new String[2];
        a = message.split(" ");
        a[1].getBytes("utf-8");
       try {
            jdbc dataBase = new jdbc();
            dataBase.Insertlog(a[0],a[1]);
        } catch ( SQLException e ) {
            e.printStackTrace();
        }

        /**
         * 群发消息
         */
        for(WebSocket_log item: webSocketSet){
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }
    }

    /**
     * 发生错误时调用
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException{
        this.session.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }

    /**
     * 获取在线人数
     * @return 在线人数
     */
    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    /**
     * 在线人数+1
     */
    public static synchronized void addOnlineCount() {
        WebSocket_log.onlineCount++;
    }

    /**
     * 在线人数-1
     */
    public static synchronized void subOnlineCount() {
        WebSocket_log.onlineCount--;
    }
}
