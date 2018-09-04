<%-- 
    Document   : city_selection
    Created on : 1 Sep, 2018, 5:08:14 PM
    Author     : yogen
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%
    try {
        Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
        String SID = request.getParameter("stateid");

        String sqlString3 = "SELECT id, name  FROM cities WHERE state_id ='" + SID + "' ORDER BY name";
        Statement statement3 = connection.createStatement();
        statement3.executeQuery(sqlString3);
        ResultSet rs3 = statement3.getResultSet();
%>



<select name="city" id="city" required>
    <option value="0">Select City</option>
    <%
        while (rs3.next()) {
    %>
    <option value="<%=rs3.getString("id").toString()%>"><%=rs3.getString("name").toString()%></option>
    <%
            }
        } catch (Exception e) {

        }
    %>
</select>
