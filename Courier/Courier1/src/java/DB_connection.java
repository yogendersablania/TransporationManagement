
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.DispatcherType;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author User
 */
public class DB_connection {
    Connection connection = null;
    public Connection DB_connection() {
        try {            
            String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
            String username = "smexpfrx_admin";
            String password = "Pass@123";
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            String Error = e.getMessage();
            return connection;
        }
    }
}
