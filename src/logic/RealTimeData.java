package logic;

import com.jdbc.jdbc;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
@WebServlet(name = "RealTimeData")
public class RealTimeData extends HttpServlet {
    /**
     * 输出字符串
     */
    static String str = null;

    /**
     * 获取实时数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }


    /**
     * 获取实时数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/event-stream");

        response.setCharacterEncoding("UTF-8");
        String power = (String) request.getParameter("power");
        String hum = (String) request.getParameter("humidity");
        String temp =(String) request.getParameter("temperature");
        if(power == null && str != null){
            PrintWriter pw =  response.getWriter();
            pw.write("data:" + str + "\n\n");
            pw.close();
            return;
        }
        try {
            jdbc mysql = new jdbc();
            mysql.Insert(power,temp,hum);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        str = power + " " + hum + " " + temp;
    }
}