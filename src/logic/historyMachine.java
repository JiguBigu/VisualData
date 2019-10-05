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
import java.nio.file.spi.FileSystemProvider;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
public class historyMachine extends HttpServlet {

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
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        startDate = getStandardtDate(startDate);
        endDate = getStandardtDate(endDate);
        System.out.println("start date: " + startDate);
        System.out.println("end date: " + endDate);
        String machineNumber = request.getParameter("machineId");
        System.out.println("machine number:  " + machineNumber);
       ArrayList<Data> result = null;
        jdbc DataBase = null;
        try {
            DataBase = new jdbc();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql = "select * from table" + machineNumber + " where DATE1 >= '" + startDate +"' AND DATE1 <= '" +endDate + "'";
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
     * 执行post
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void init()throws  ServletException{

    }

    /**
     * 获取起始时间，并规范化其实时间
     * @param data
     * @return
     */
    String getStandardtDate(String data){
        String StandardtDate= data.replace("-","");
        return StandardtDate;
    }
}
