package DAO;

import Model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserImp extends DBHandler {

    public int addUsers(user u)//插入用户
    {
        int index = -1;
        String sql="insert into users(Uid, password,address,phonenumber)" +
            " values(?,?,?,?)";
        Connection conn=getConnection();
        PreparedStatement pstmt=null;
        try{
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,u.getName());
            pstmt.setString(2,u.getPassword());
            pstmt.setString(3,u.getAddress());
            pstmt.setString(4,u.getPhonenumber());
            index = pstmt.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return index;
    }
    public boolean HaveUser(String Uid)  {//已经有该用户返回true,没有则返回false
        String sql="select * from users where Uid=(?)";
        Connection conn=getConnection();
        ResultSet set;
        PreparedStatement pstmt = null;
        boolean have=true;
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,Uid);
            pstmt.execute();
            set=pstmt.getResultSet();
            set.last();        //指针移到最后一行
            if(set.getRow()== 0)
               have= false;//
            else
            {
                System.out.println("true:"+set.getString(1));
            have= true;}
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
      return have;
    }
    public boolean checkUser(String Uid,String password)  {//验证身份成功返回true,失败返回false
        String sql="select * from users where Uid=(?) and password=(?)";
        Connection conn=getConnection();
        ResultSet set;
        PreparedStatement pstmt = null;
        boolean check=true;
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,Uid);
            pstmt.setString(2,password);
            pstmt.execute();
            set=pstmt.getResultSet();
            set.last();        //指针移到最后一行
            if(set.getRow()== 0)
                check= false;//
            else
            {
                check= true;}
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection(conn);
        }
        return check;
    }

    //根据ID修改密码
    public int userChangePwd(String newPwd, String uid) {
        int index = -1;
            Connection conn=getConnection();
            ResultSet set=null;
            PreparedStatement pstmt = null;
            String sql = "update users set pwd =? where uid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPwd);
            pstmt.setString(2, uid);
            index = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return index;
    }
}
