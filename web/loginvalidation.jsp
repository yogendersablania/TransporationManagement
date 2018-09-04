<%-- 
    Document   : loginvalidation
    Created on : Jul 21, 2018, 6:28:14 PM
    Author     : User
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Login Form Validation</title>
    </head>
    <body>
        <%
            try {
                String loginid = request.getParameter("loginid").toString().trim();
                String pass = request.getParameter("pass").toString().trim();

                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
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
                        session.setAttribute("username", loginid);
                        session.setAttribute("logintime", (new SimpleDateFormat("EE, dd-MMM-yyyy HH:mm:ss")).format(new Date()));
                        view.forward(request, response);
                        connection.close();
                        break;
                    }
                }
                
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                request.setAttribute("Error", "The username or password you have entered is invalid.");
                requestDispatcher.forward(request, response);
                connection.close();

            } catch (Exception e) {
                //session.invalidate();                
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                request.setAttribute("Error", "There is some error in server connection.");
                requestDispatcher.forward(request, response);
            }
        %>
    </body>
</html>
