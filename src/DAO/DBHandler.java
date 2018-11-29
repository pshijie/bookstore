package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHandler {
    public Connection getConnection(){
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "NXN535348");
        }catch (Exception e ){
            e.printStackTrace();
        }
        return conn;
    }

    public void closeConnection(Connection connection){
        try {
            if (connection != null)
                connection.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

}