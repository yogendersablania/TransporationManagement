<%-- 
    Document   : test2
    Created on : 12 Aug, 2018, 3:46:00 PM
    Author     : Yogender
--%>

<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Parameter :
        <%
            try {
                if (StringUtils.isNullOrEmpty(request.getParameter("consignerid"))) {
        %>
        NULL
        <%} else {%>
        <td width="19%"><input type="text" placeholder="Enter CUSTOMER ID" name="consignerid" id="consignerid" readonly value="0"></td>
        NOT NULL
        <%}
            } catch (Exception e) {
                out.println(e.getMessage());
            }%>
    </body>
</html>
