<%-- 
    Document   : user_Edit_validation
    Created on : 25 Aug, 2018, 8:09:41 PM
    Author     : yogen
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT USER</title>
    </head>
    <body>
        <%
            try {
                String id = request.getParameter("id").toString().trim();
                String email = request.getParameter("email").toString().trim().toLowerCase();
                String address = request.getParameter("address").toString().trim();
                String state = request.getParameter("state").toString().trim();
                String city = request.getParameter("city").toString().trim();
                String pin = request.getParameter("pin").toString().trim();

                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                String sqlString = "UPDATE employees SET employees_email=?, employees_address=?, employees_state=?, employees_city=?, employees_zip_code=? WHERE employees_id = " + id;
                PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, address);
                preparedStatement.setString(3, state);
                preparedStatement.setString(4, city);
                preparedStatement.setString(5, pin);
                
                if (preparedStatement.executeUpdate() > 0) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_list.jsp");
                    request.setAttribute("Message", "User successfully edited in system.");
                    requestDispatcher.forward(request, response);
                    connection.close();
                } else {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_list.jsp");
                    request.setAttribute("Message", "There is some error in updation.");
                    requestDispatcher.forward(request, response);
                    connection.close();
                }

            } catch (Exception e) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_list.jsp");
                request.setAttribute("Message", "");
                requestDispatcher.forward(request, response);
            }
        %>
    </body>
</html>
