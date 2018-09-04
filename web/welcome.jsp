<%-- 
    Document   : welcome
    Created on : Jul 21, 2018, 7:16:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>Welcome</title>
    </head>
    <%@include file="header.jsp"%>
    <body>
        </br></br></br>
        <h1 align="center"><b>Welcome <%=session.getAttribute("username")%> !</b></h1>        
    </body>
</html>
