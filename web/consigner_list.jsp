<%-- 
    Document   : user_list
    Created on : 5 Aug, 2018, 10:10:04 AM
    Author     : Yogender
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSIGNER LIST</title>
    </head>
    <body>        
        <%@include file="header.jsp"%>
        <%
            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            String sqlString = "select consigner_id as ID, consigner_name as NAME, CONCAT(consigner_address1,', ',consigner_address2,', ',consigner_address3,', ',consigner_landmark,', ',consigner_city,', ',consigner_state,', ',consigner_country,', ',consigner_pin) as ADDRESS, consigner_phone as PHONE, consigner_mobile as MOBILE, consigner_email as EMAIL, consigner_website as WEBSITE, consigner_gstin as GSTIN, consigner_pan as PAN from consigner order by consigner_id";
            Statement statement = connection.createStatement();
            statement.executeQuery(sqlString);
            ResultSet rs = statement.getResultSet();
        %>
        <br/>
        <table width="50%" align="right">
            <tr>
                <td><input type="submit" value="Download .xls" /></td>
                <td><input type="submit" value="Download .pdf" /></td>
                <td><input type="submit" value="Download .csv" /></td>
                <td><input type="submit" value="Download .doc" /></td>
            </tr>
        </table>
        <table width="90%" align="center">            
            <tr>
                <td colspan=9 background="E8E6E5" align="center">   
                    <label><h2>CONSIGNER LIST</h2></label>
                </td>
            </tr>
        </table>
        <table width="90%" align="center" border="0" cellpadding="3">
            <tr bgcolor="F8F5F2">                
                <td width="3%"><label><b>ID</b></label></td>
                <td width="15%"><label><b>NAME</b></label></td>
                <td width="35%"><label><b>ADDRESS</b></label></td>
                <td width="7%"><label><b>PHONE</b></label></td>
                <td width="7%"><label><b>MOBILE</b></label></td>
                <td width="10%"><label><b>EMAIL</b></label></td>
                <td width="10%"><label><b>WEBSITE</b></label></td>
                <td width="8%"><label><b>GSTIN</b></label></td>
                <td width="5%"><label><b>PAN</b></label></td>
            </tr>
            <%
                int i = 0;
                while (rs.next()) {
                    if (i % 2 == 0) {
            %>
            <tr bgcolor="D4FCEE">
                <td><%=rs.getString("ID").toString()%></td>
                <td><%=rs.getString("NAME").toString()%></td>
                <td><%=rs.getString("ADDRESS").toString()%></td>
                <td><%=rs.getString("PHONE").toString()%></td>
                <td><%=rs.getString("MOBILE").toString()%></td>
                <td><%=rs.getString("EMAIL").toString()%></td>
                <td><%=rs.getString("WEBSITE").toString()%></td>
                <td><%=rs.getString("GSTIN").toString()%></td>
                <td><%=rs.getString("PAN").toString()%></td>
            </tr>
            <%} else {%>
            <tr bgcolor="white">
                <td><%=rs.getString("ID").toString()%></td>
                <td><%=rs.getString("NAME").toString()%></td>
                <td><%=rs.getString("ADDRESS").toString()%></td>
                <td><%=rs.getString("PHONE").toString()%></td>
                <td><%=rs.getString("MOBILE").toString()%></td>
                <td><%=rs.getString("EMAIL").toString()%></td>
                <td><%=rs.getString("WEBSITE").toString()%></td>
                <td><%=rs.getString("GSTIN").toString()%></td>
                <td><%=rs.getString("PAN").toString()%></td>
            </tr>
            <%}
                    i++;
                }
            %>
        </table>
    </body>
</html>