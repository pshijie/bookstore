package servlet;


import DAO.BookImp;
import Model.book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class BookServlet extends HttpServlet {

    public void init(HttpServletRequest request, HttpServletResponse response)
{
    System.out.println("初始化servlet");
}
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        System.out.println("进入revlet");
        String ID=request.getParameter("id");
        BookImp bookImp=new BookImp();
        List<book> list=bookImp.queryABook(ID);
        request.setAttribute("book",list.get(0));//根据url传来的idj进入数据库查询书籍
        try {
            request.getRequestDispatcher("books/bookdetail.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }


}
