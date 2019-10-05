package logic;

import com.jdbc.Canshu;
import com.jdbc.Data;
import com.jdbc.jdbc;
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
@WebServlet(name = "machineParameter")
public class machineParameter extends HttpServlet {

    /**
     * 获取机器参数
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    /**
     * 获取机器参数
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/event-stream");

        String machineId =(String) request.getParameter("machineId");
        response.setCharacterEncoding("UTF-8");
        String n = (String) request.getParameter("n");
        String f = (String) request.getParameter("f");
        String ap =(String) request.getParameter("ap");
        String ae =(String) request.getParameter("ae");

        if(n == null){
            ArrayList<Canshu> result = null;
            try {

                jdbc mysql = new jdbc();
                String sql = "select  * from canshu"+ machineId + " order by time desc limit 1";
                System.out.println("!!!!!!!!!!!!!   sql:" + sql +" !!!!!!!!!!!!");
                result = mysql.getData_canshu(sql);
                System.out.println("!!!!!!!!!!!!!   sql:" + sql +" !!!!!!!!!!!!");
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JSONArray data = JSONArray.fromObject(result);
            System.out.println(data.toString());
            PrintWriter out = response.getWriter();
            out.println(data);
            out.flush();
            out.close();
        }

       else {


            try {
                jdbc mysql = new jdbc();
                mysql.InsertMachineParameter(n, f, ap, ae, machineId);
            } catch ( SQLException e ) {
                e.printStackTrace();
            }
        }
    }
}
