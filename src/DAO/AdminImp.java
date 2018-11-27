package DAO;

import Model.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminImp extends DBHandler {

    public List<user> queryAllUsers() {//查询users表
        Connection conn=getConnection();
        List<user> users=new ArrayList<user>();
        String sql="select * from users";
        try {
            Statement statement = conn.createStatement();
            ResultSet rs=statement.executeQuery(sql);
            while(rs.next()){
                String Uid=rs.getString(1);
                String password=rs.getString(2);
                String address=rs.getString(3);
                String phonenumber=rs.getString(4);
                user u=new user(Uid,password,address,phonenumber);
                users.add(u);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return users;
    }

    public boolean checkAdm(String admId,String admPw)//判断是否是管理员登录
    {
    String sql="select * from administrate where Aid=? and Apassword=?";
    Connection conn=getConnection();
    ResultSet set;
    PreparedStatement pstmt = null;
    boolean check=true;
        try {
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,admId);
        pstmt.setString(2,admPw);
        pstmt.execute();
        set=pstmt.getResultSet();
        set.last();        //指针移到最后一行
        if(set.getRow()== 0)
            check= false;//
        else
        {
            check= true;}
    } catch (
    SQLException e) {
        e.printStackTrace();
    }finally {
        closeConnection(conn);
    }
        return check;
}
}
