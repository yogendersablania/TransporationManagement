<%-- 
    Document   : loginvalidation
    Created on : Jul 21, 2018, 6:28:14 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form Validation</title>
    </head>
    <body>
        <%
            try {
                String loginid = request.getParameter("loginid").toString().trim();
                String pass = request.getParameter("pass").toString().trim();

                Connection connection = null;
                String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
                String database = "smexpfrx_erp";
                String username = "smexpfrx_admin";
                String password = "Pass@123";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);

                Statement statement = connection.createStatement();
                String sqlString = "SELECT * FROM employees WHERE employees_name = '" + loginid + "' AND employees_password = '" + pass + "'";
                statement.executeQuery(sqlString);
                ResultSet rs = statement.getResultSet();
                while (rs.next()) {
                    String dbUsername = rs.getString("employees_name").toString();
                    String dbPassword = rs.getString("employees_password").toString();

                    out.println(loginid);
                    out.println(pass);
                    out.println(dbUsername);
                    out.println(dbPassword);

                    if (dbUsername.equals(loginid) && dbPassword.equals(pass)) {
                        RequestDispatcher view = request.getRequestDispatcher("welcome.jsp");
                        request.setAttribute("username", loginid);
                        view.forward(request, response);
                        connection.close();
                    } else {
                        //RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                        //request.setAttribute("username", loginid);
                        //requestDispatcher.forward(request, response);
                        //connection.close();
                        out.println("Disconnected! 1");
                    }
                }
            } catch (Exception e) {
                out.println(e.getMessage().toString());
            }
        %>
    </body>
</html>
