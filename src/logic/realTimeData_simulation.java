package logic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
@WebServlet(name = "realTimeData_simulation")
public class realTimeData_simulation extends HttpServlet {

    /**
     * 获取测试用实时数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    /**
     * 获取测试用实时数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/event-stream");

        response.setCharacterEncoding("UTF-8");
        PrintWriter pw =  response.getWriter();
        int [] data = {521,365,123,458,693,534,568,600};
        System.out.println("get Real-time");
        pw.write("data: " +  Math.rint(Math.random()*1000) + "\n\n");
        System.out.println("get Real-time over");
        pw.close();
    }
}
