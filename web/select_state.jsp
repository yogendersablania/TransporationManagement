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
    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
    String CID = request.getParameter("countryid");
    String SID = request.getParameter("stateid");

    String sqlString2 = "SELECT id, name  FROM states WHERE country_id ='" + CID + "' ORDER BY name";
    Statement statement2 = connection.createStatement();
    statement2.executeQuery(sqlString2);
    ResultSet rs2 = statement2.getResultSet();

    String sqlString3 = "SELECT id, name  FROM cities WHERE state_id ='" + CID + "' ORDER BY name";
    Statement statement3 = connection.createStatement();
    statement3.executeQuery(sqlString3);
    ResultSet rs3 = statement3.getResultSet();
%>


<select name="state" id="state" required  onchange="stateselect(this.value)">
    <option value="0">Select State</option>
    <%
        while (rs2.next()) {
    %>
    <option value="<%=rs2.getString("id").toString()%>"><%=rs2.getString("name").toString()%></option>
    <%
        }
    %>
</select>