<%-- 
    Document   : CN_Entry_Control
    Created on : Jul 21, 2018, 1:01:56 PM
    Author     : User
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <%
            String Name1 = request.getParameter("name1");
            int Name2 = Integer.parseInt(request.getParameter("name2"));
            String Name3 = request.getParameter("name3");
            out.print(Name1);
            out.print(Name2);
            out.print(Name3);
                
            try {
                Connection connection = null;
                String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
                String database = "smexpfrx_erp";
                String username = "smexpfrx_admin";
                String password = "Pass@123";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);
                
                Statement statement = connection.createStatement();
                String query = "insert into test(name ,age , email) values ('" + Name1 + "','" + Name2 + "','" + Name3 + "')";
                
                int i = statement.executeUpdate("query");    
                
                out.print("Data inserted successfully.");
                out.print(Name1);
                out.print(Name2);
                out.print(Name3);
            
            } catch (Exception e) {
                out.print("Error : " + e.getMessage().toString());        
            }
        %>

    </body>
</html>
