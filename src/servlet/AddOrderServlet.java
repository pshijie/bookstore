package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import DAO.OrderImp;
import Model.orders;
import Model.book;
import java.util.ArrayList;
@WebServlet(name = "AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        //获得用户
        HttpSession session=request.getSession();
        String Uid= (String)session.getAttribute("uid");
        String Bid=request.getParameter("Bid");
        OrderImp orderImp=new OrderImp();
        if(orderImp.addOrder(Uid,Bid))
        {
            out.print("1");
        }
        else
        {
            out.print("0");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        //获得用户
        HttpSession session=request.getSession();
        String Uid= (String)session.getAttribute("uid");
        out.println(Uid);
        String Bid=request.getParameter("Bid");
        OrderImp orderImp=new OrderImp();
        if(orderImp.addOrder(Uid,Bid))
        {
            out.println("OK");
        }
        else
        {
            out.println("Failure");
        }
    }
}
