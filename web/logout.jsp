<%-- 
    Document   : logout
    Created on : Aug 1, 2018, 3:29:46 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Logout</title>
    </head>
    <body>
        <h1>
        <%
            session.invalidate();
            response.sendRedirect("index.jsp"); 
        %>
        </h1>
    </body>
</html>
