<%-- 
    Document   : delet_user
    Created on : 5 Aug, 2018, 1:45:45 PM
    Author     : Yogender
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE USER</title>
    </head>
    <body>
        <h1>DELETE USER</h1>
        <%
            String ID = request.getParameter("ID");
            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            String sqlString = "DELETE FROM employees Where employees_id = '" + ID + "'";
            Statement statement = connection.createStatement();
            statement.executeUpdate(sqlString);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user_list.jsp");
            request.setAttribute("Message", "Record Deleted");
            requestDispatcher.forward(request, response);
            connection.close();

        %>
    </body>
</html>
