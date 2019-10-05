package logic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 * @author Jigubigu
 * @version 1.0
 * @date 2019/3/7 14:22
 */
@WebServlet(name = "chooseMachine")
public class chooseMachine extends HttpServlet {

    /**
     * ??????????????????
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getContextPath();
        String machineId = request.getParameter("machineId");
        HttpSession session=request.getSession();
        session.setAttribute("machineId",machineId);

        PrintWriter out = response.getWriter();
        out.println(machineId);
        response.sendRedirect(path+"/chooseMachine.jsp");

        out.flush();
        out.close();
    }


    /**
     * ??post??
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
