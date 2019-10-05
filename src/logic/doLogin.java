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
/*
* 描述：处理登录界面*/


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
@WebServlet(name = "doLogin")
public class doLogin extends HttpServlet {

    /**
     * 执行登录验证
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

        Users user = new Users();
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        user.setUsername(username);
        user.setPassword(password);
        request.setCharacterEncoding("utf-8");

        if(user.getUsername().equals("HZAU*znzz") && user.getPassword().equals("123456")){

            response.sendRedirect(path+"/machineList.jsp");
    } else{
            response.sendRedirect(path+"/loginFailure.jsp");
    }
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
}
