package logic;

import com.jdbc.Data;
import com.jdbc.jdbc;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
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
public class historyMachine2 extends HttpServlet {
    public historyMachine2(){}

    /**
     * 获取历史数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        request.setCharacterEncoding("utf-8");
       ArrayList<Data> result = null;
        jdbc DataBase = null;
        try {
            DataBase = new jdbc();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "select * from testtable2t";
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

    /**
     * 执行post方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    /**
     * 初始化
     * @throws ServletException
     */
    @Override
    public void init()throws  ServletException{

    }
}
