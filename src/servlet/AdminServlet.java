package servlet;

import Model.user;
import service.AdminService;
import service.impl.AdminServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet")
public class AdminServlet extends HttpServlet {
    //获取service对象
    AdminService as = new AdminServiceImpl();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置请求编码格式
        req.setCharacterEncoding("utf-8");
        //设置响应编码格式
        resp.setContentType("text/html;charset=utf-8");
        //获取操纵符
        String oper = req.getParameter("oper");
        if("show".equals(oper)){
            //显示所有用户
            userShow(req,resp);
        }
    }

    //显示所有用户
    private void userShow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<user> lu = as.userShowService();
        if (lu!=null){
            //存储到req做请求转发
            req.setAttribute("lu",lu);
            req.getRequestDispatcher("adminoper/showUser.jsp").forward(req,resp);
        }
    }
}
