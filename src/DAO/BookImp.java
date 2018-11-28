package DAO;

import Model.book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookImp extends DBHandler {
    public List<book> queryAllBooks() {//查询Book表
        Connection conn=getConnection();
        List<book> books=new ArrayList<book>();
        String sql="select * from book";
        try {
            Statement statement = conn.createStatement();
            ResultSet rs=statement.executeQuery(sql);
            while(rs.next()){
                String Bid=rs.getString(1);
                String Bname=rs.getString(2);
                float Bprice=rs.getFloat(3);
                String Babstract= rs.getString(5);
                int Bstock=rs.getInt(4);
                String Bpic= rs.getString(6);

                book b=new book(Bid,Bname,Bprice,Bstock,Babstract,Bpic);
                books.add(b);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return books;
    }
    public List<book> queryABook(String Bname) {//根据书名查看书籍
        Connection conn=getConnection();
        List<book> books=new ArrayList<book>();
        String sql="select * from book where Bname=(?)";
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        try{
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,Bname);
            pstmt.execute();
            rs=pstmt.getResultSet();
            while(rs.next()){
                String Bid=rs.getString(1);
                float Bprice=rs.getFloat(3);
                int Bstock=rs.getInt(4);
                String Bpic= rs.getString(6);
                String Babstract= rs.getString(5);
                book b=new book(Bid,Bname,Bprice,Bstock,Babstract,Bpic);
                books.add(b);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return books;
    }
    public book  queryBookbyid(String bid){
        book b=null;
        Connection conn=getConnection();
        List<book> books=new ArrayList<book>();
        String sql="select * from book where Bid=(?)";
        ResultSet rs=null;
        PreparedStatement pstmt=null;
        try{
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,bid);
            pstmt.execute();
            rs=pstmt.getResultSet();
            while(rs.next()){
                //String Bid=rs.getString(1);
                String Bname=rs.getString(2);
                float Bprice=rs.getFloat(3);
                int Bstock=rs.getInt(4);
                String Bpic= rs.getString(6);
                String Babstract= rs.getString(5);
               b=new book(bid,Bname,Bprice,Bstock,Babstract,Bpic);

            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return b;





    }






}
