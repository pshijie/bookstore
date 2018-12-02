package servlet;

import Model.user;
import service.AdminService;
import service.UserService;
import service.impl.AdminServiceImpl;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    //获取service对象
    UserService us = new UserServiceImpl();
    AdminService as = new AdminServiceImpl();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //设置请求编码格式
        req.setCharacterEncoding("utf-8");
        //设置响应编码格式
        resp.setContentType("text/html;charset=utf-8");
        //获取操纵符
        String oper =req.getParameter("oper");
        if("login".equals(oper)){
            //登录处理
            checkUserLogin(req,resp);
        }else if("out".equals(oper)){
            //退出
            userOut(req,resp);
        }else if ("pwd".equals(oper)){
            //密码修改
            userChangePwd(req,resp);
        }else if ("reg".equals(oper)){
            //用户注册
            userReg(req,resp);
        }

    }
        //用户注册
    private void userReg(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String uid = req.getParameter("uid");
        String pwd = req.getParameter("pwd");
//
////        在session里面注册用户名和密码
//        HttpSession session = req.getSession();
//        session.setAttribute("uid", uid);
//        session.setAttribute("pwd", pwd);
//        System.out.println("---------------------------------------------");
//        System.out.println("uid"+uid);
//        System.out.println("pwd"+pwd);
//        System.out.println("---------------------------------------------");

        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        user u = new user(uid,pwd,address,phone);
        int index = us.userRegService(u);
        if (index>0){
            HttpSession hs = req.getSession();
            //标识符在应用在login.jsp
            hs.setAttribute("reg", "true");
            resp.sendRedirect("login.jsp");
        }
    }



    //用户修改密码
    private void userChangePwd(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取新密码
        String newPwd = req.getParameter("newPwd");
        String uid = req.getParameter("uid");
        //处理数据
        int index= us.userChangePwdService(newPwd,uid);
        if(index>0){
            HttpSession hs = req.getSession();
            //标识符在应用在login.jsp
            hs.setAttribute("pwd","true");
            //重定向到登录界面
            resp.sendRedirect("login.jsp");
        }

    }

    //用户退出
    private void userOut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession hs=req.getSession();
        //销毁session
        hs.invalidate();
        //重定向到登录界面
        resp.sendRedirect("homepage/home.html");
    }

    //检测是否有该用户并登陆
    private void checkUserLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        //获取请求信息
        String uid = req.getParameter("uid");
        String pwd = req.getParameter("pwd");
        //校验
        boolean is_u =us.checkUserLoginService(uid,pwd);
        if(is_u==true){
            //获取session对象
            HttpSession hs=req.getSession();
            //将用户数据存储到session中
            hs.setAttribute("uid", uid);
            //重定向,有该用户就登录到用户主页面
            resp.sendRedirect("usermain/main.jsp");
            return;
        } else {
            //标识符在应用在login.jsp
            req.setAttribute("flag",0);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
            return;
        }

    }
}
