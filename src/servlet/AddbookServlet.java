package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import DAO.BookImp;
import DAO.OrderImp;
import Model.book;
import Model.orders;
@WebServlet(name = "AddbookServlet")
public class AddbookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("utf-8");
            //前提修改购物车中那一类物品的数量
            HttpSession session=request.getSession();
            //List<book> books=(List<book>)session.getAttribute("books");
            //List<orders> orders=(List<Model.orders>)session.getAttribute("orders");

            //获得提交的内容
            String Bid=request.getParameter("Bid");
            //String Uid=request.getParameter("Uid");
            List<book> blist=(List<book>)session.getAttribute("blist");
            if(blist==null){
                blist=new ArrayList<book>() ;
            }

            String isadd="1";
            try {
                    BookImp bookImp = new BookImp();
                    book b = bookImp.queryBookbyid(Bid);
                    if(b==null){
                        isadd="0";
                    }else{
                        blist.add(b);
                    }

            }catch (Exception e){
              isadd="0";
          }
            session.setAttribute("blist",blist);
            //存入购物车
        PrintWriter out=response.getWriter();
              out.print(isadd);
//            Book.setBid(Bid); OrderImp orderImp=new OrderImp();
//        List <orders> order =orderImp.queryMyOders(Uid);
//        while(order!=null){
//            if(order.getBid()==Bid)
//            {
//
//            }
//            order=order.next();
//
//        }
//        book Book=new book();
//            orders Order=new orders();
//
//


    }
}
