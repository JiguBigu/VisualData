package logic;

import com.jdbc.jdbc;
import com.jdbc.loggingData;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
@WebServlet(name = "logServlet")
public class logServlet extends HttpServlet {

    /**
     * 查询系统日志
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.setContentType("text/event-stream");
        response.setCharacterEncoding("UTF-8");
        String time = request.getParameter("time");
        String machineId = request.getParameter("machineId");
        String log = request.getParameter("log");
        if(log == null){

            ArrayList<loggingData> result = null;
            try {
                jdbc dataBase = new jdbc();
                //String sql = "select * from log order by time desc limit 5";
                String sql = "select * from log order by time desc";
                result = dataBase.getDataLog(sql);
            } catch ( SQLException e ) {
                e.printStackTrace();
            }
            JSONArray data = JSONArray.fromObject(result);
            System.out.println(data.toString());
            PrintWriter out = response.getWriter();
            out.println(data);
            out.flush();
            out.close();
        }
        else{
            try {
                jdbc mysql = new jdbc();
                mysql.Insertlog(machineId, log);
            } catch ( SQLException e ) {
                e.printStackTrace();
            }

        }
    }

    /**
     * 获取系统日志
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
