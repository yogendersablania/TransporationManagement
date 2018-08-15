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
        <title>Welcome</title>
    </head>
    <body align="center">
        <%@include file="header.jsp"%>
        </br></br></br>
        <h1><b>Welcome <%out.println(request.getAttribute("username"));%> !</b></h1>        
    </body>
</html>
