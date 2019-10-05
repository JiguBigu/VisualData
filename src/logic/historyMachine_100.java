package logic;

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
@WebServlet(name = "historyMachine_100")
public class historyMachine_100 extends HttpServlet {
    /**
     * 查询数据库最新前100条历史数据
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
     * 查询数据库最新前100条能耗数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String machineId = request.getParameter("machineId");
        System.out.println("This is machine 100`s machineId: " + machineId);
        ArrayList<Data> result = null;
        jdbc DataBase = null;
        try {
            DataBase = new jdbc();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "select * from table"+ machineId +" limit 100";
        try {
            result = DataBase.getData(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(result);
        JSONArray data = JSONArray.fromObject(result);
        System.out.println(data.toString());

        PrintWriter out = response.getWriter();
        out.println(data);
        out.flush();
        out.close();
    }
}
