<%-- 
    Document   : customer_validation
    Created on : Jul 21, 2018, 10:34:16 PM
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
        <title>User Validation</title>
    </head>
    <body>
        <%
            try {
                String name = request.getParameter("name").toString().trim();
                String address = request.getParameter("address").toString().trim();
                String state = request.getParameter("state").toString().trim();
                String pass = request.getParameter("pass").toString().trim();
                String city = request.getParameter("city").toString().trim();
                String pin = request.getParameter("pin").toString().trim();

                Connection connection = null;
                String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
                String username = "smexpfrx_admin";
                String password = "Pass@123";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);

                Statement statement1 = connection.createStatement();
                Statement statement2 = connection.createStatement();
                String sqlString1 = "SELECT COUNT(*) FROM employees WHERE employees_name = '" + name + "'";
                String sqlString2 = "SELECT COUNT(*) FROM employees";
                statement1.executeQuery(sqlString1);
                statement2.executeQuery(sqlString2);
                ResultSet rs1 = statement1.getResultSet();
                ResultSet rs2 = statement2.getResultSet();
                rs1.next();
                rs2.next();
                int rowscount = rs1.getInt(1);
                int id = rs2.getInt(1) + 1;

                if (rowscount == 0) {
                    rowscount++;
                    String sqlString3 = "INSERT INTO employees(employees_id, employees_name, employees_password, employees_address, employees_city, employees_state, employees_zip_code) VALUES ( '" + id + "','" + name + "','" + pass + "','" + address + "','" + city + "','" + state + "','" + pin + "')";
                    Statement statement3 = connection.createStatement();
                    statement3.executeUpdate(sqlString3);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_entry.jsp");
                    request.setAttribute("flag", true);
                    requestDispatcher.forward(request, response);
                    connection.close();
                } else {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_entry.jsp");
                    request.setAttribute("flag", false);
                    requestDispatcher.forward(request, response);
                    connection.close();
                }
            } catch (Exception e) {
                out.println(e.getMessage().toString());
            }
        %>
    </body>
</html>