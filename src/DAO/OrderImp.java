package DAO;

import Model.orders;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderImp extends DBHandler {
    public List<orders> queryAllOders() {//查询users表
        Connection conn=getConnection();
        List<orders> orders=new ArrayList<orders>();
        String sql="select * from orders";
        try {
            Statement statement = conn.createStatement();
            ResultSet rs=statement.executeQuery(sql);
            while(rs.next()){
                String Oid=rs.getString(1);
                String Bid=rs.getString(2);
                String Uid=rs.getString(3);
                String status=rs.getString(4);
                orders o=new orders(Oid,Bid,Uid,status);
                orders.add(o);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return orders;
    }
    public List<orders> queryMyOders(String Uid) {//根据用户名查询订单表
        Connection conn=getConnection();
        List<orders> orders=new ArrayList<orders>();
        String sql="select * from orders where Uid=(?)";
        ResultSet rs=null;
            PreparedStatement pstmt=null;
            try{
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1,Uid);
                pstmt.execute();
                rs=pstmt.getResultSet();
                while (rs.next())
                {
                    String Oid=rs.getString(1);
                    String Bid=rs.getString(2);
                    String status=rs.getString(4);
                    orders o=new orders(Oid,Bid,Uid,status);
                    orders.add(o);
                }
            }
        catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return orders;
    }
    //addorder订单状态已修改，改成bool
    public boolean addOrder(String Uid,String Bid)//提交购物车时加入订单
    {
        boolean state=true;
        orders Order=null;
        String sql="insert into orders(Uid,Bid,stutas)" +
                " values(?,?,?)";
        String sql2="update book set Bstock=Bstock-1 where Bid=(?)";
        Connection conn=getConnection();
        PreparedStatement pstmt=null;
        try{
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,Uid);
            pstmt.setString(2,Bid);
            pstmt.setString(3,"0");
            pstmt.execute();
            pstmt=conn.prepareStatement(sql2);
            pstmt.setString(1,Bid);
            pstmt.execute();
        }catch(SQLException e){
            state=false;
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return state;
    }
}
