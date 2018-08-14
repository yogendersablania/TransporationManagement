package com.smexpress.in;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author User
 */
public class Connection_Manager {
    
    static Connection connection;
    public static Connection get_Connection() {
        try {
            String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
            String username = "smexpfrx_admin";
            String password = "Pass@123";
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            
        } catch (ClassNotFoundException | SQLException e) {
            String Error = e.getMessage();
            System.out.println(Error);
        }
        return connection;
    }
}
