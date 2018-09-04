<%-- 
    Document   : select_cn
    Created on : 2 Sep, 2018, 11:06:49 AM
    Author     : yogen
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%
    try {

        Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
        String BID = request.getParameter("bookid");

        String sqlString3 = "SELECT id, cn_number FROM consignment_note WHERE cn_book_id ='" + BID + "' AND cn_status=0 ORDER BY cn_number";
        Statement statement3 = connection.createStatement();
        statement3.executeQuery(sqlString3);
        ResultSet rs3 = statement3.getResultSet();
%>

<select name="cnnumber" id="cnnumber" required>
    <option value="0">Select CN</option>
    <%
        while (rs3.next()) {
    %>
    <option value="<%=rs3.getString("id").toString()%>"><%=rs3.getString("cn_number").toString()%></option>
    <%
            }
        } catch (Exception e) {

        }
    %>
</select>
