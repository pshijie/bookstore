package servlet;

import Model.user;
import service.AdminService;
import service.impl.AdminServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
            //管理员的登录
        }else if("admlog".equals(oper)){
            checkAdminLogin(req,resp);
        }else if("out".equals(oper)){
            //退出
            adminOut(req,resp);
        }
    }

    //管理员退出
    private void adminOut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession hs=req.getSession();
        //销毁session
        hs.invalidate();
        //重定向到登录界面
        resp.sendRedirect("homepage/home.html");
    }

    //检测管理员登录
    private void checkAdminLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String admid = req.getParameter("admid");
        String admpwd = req.getParameter("admpwd");
        boolean is_a = as.adminCheckService(admid,admpwd);
        if(is_a==true){
            //获取session对象
            HttpSession hs=req.getSession();
            //将用户数据存储到session中
            hs.setAttribute("admid", admid);
            //重定向,有管理员就登录到管理员主页面
            resp.sendRedirect("admin_main/main.jsp");
            return;
        }else {
            //标识符在应用在login.jsp
            req.setAttribute("flag",0);
            req.getRequestDispatcher("admlogin.jsp").forward(req,resp);
            return;
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
