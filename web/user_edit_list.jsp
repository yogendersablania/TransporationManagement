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
        <title>USER LIST</title>
    </head>
    <body>        
        <%@include file="header.jsp"%>        
        <%
            try {
                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();

                String type = request.getParameter("search_type");
                String text = request.getParameter("search_text");
                String sqlString = "";

                switch (type) {
                    case "Name":
                        sqlString = "select employees_id as ID, employees_name as NAME, CONCAT(employees_address,', ',employees_city,', ',employees_state,', ',employees_zip_code) as ADDRESS, employees_email as EMAIL from employees where employees_name LIKE '%" + text + "%' order by employees_id";
                        break;
                    case "Email":
                        sqlString = "select employees_id as ID, employees_name as NAME, CONCAT(employees_address,', ',employees_city,', ',employees_state,', ',employees_zip_code) as ADDRESS, employees_email as EMAIL from employees where employees_email LIKE '%" + text + "%' order by employees_id";
                        break;
                    case "Address":
                        sqlString = "select employees_id as ID, employees_name as NAME, CONCAT(employees_address,', ',employees_city,', ',employees_state,', ',employees_zip_code) as ADDRESS, employees_email as EMAIL from employees where employees_address LIKE '%" + text + "%' order by employees_id";
                        break;
                    case "State":
                        sqlString = "select employees_id as ID, employees_name as NAME, CONCAT(employees_address,', ',employees_city,', ',employees_state,', ',employees_zip_code) as ADDRESS, employees_email as EMAIL from employees where employees_state LIKE '%" + text + "%' order by employees_id";
                        break;
                    case "City":
                        sqlString = "select employees_id as ID, employees_name as NAME, CONCAT(employees_address,', ',employees_city,', ',employees_state,', ',employees_zip_code) as ADDRESS, employees_email as EMAIL from employees where employees_city LIKE '%" + text + "%' order by employees_id";
                        break;
                    case "Zip":
                        sqlString = "select employees_id as ID, employees_name as NAME, CONCAT(employees_address,', ',employees_city,', ',employees_state,', ',employees_zip_code) as ADDRESS, employees_email as EMAIL from employees where employees_zip_code LIKE '%" + text + "%' order by employees_id";
                        break;
                }

                Statement statement = connection.createStatement();
                statement.executeQuery(sqlString);
                ResultSet rs = statement.getResultSet();
        %>
        <br/>
        <table width="50%" align="right">
            <>
            <tr>
                <td><input type="submit" value="Download .xls" /></td>
                <td><input type="submit" value="Download .pdf"  onclick="HTMLtoPDF()"></td>
                <td><input type="submit" value="Download .csv" /></td>
                <td><input type="submit" value="Download .doc" /></td>
            </tr>
        </table>
        <div id="HTMLtoPDF">
            <table width="90%" align="center">
                <tr>
                    <td colspan=4 background="E8E6E5" align="center">   
                        <label><h2>EMPLOYEE LIST</h2></label>
                    </td>
                </tr>
            </table>
            <table width="90%" align="center" border="0" cellpadding="3">
                <tr bgcolor="F8F5F2">                
                    <td width="5%">
                        <label><b>ID</b></label>
                    </td>
                    <td width="20%"> 
                        <label><b>NAME</b></label>                                      
                    </td>
                    <td width="45%">
                        <label><b>ADDRESS</b></label>              
                    </td>
                    <td width="20%">
                        <label><b>EMAIL</b></label>              
                    </td>
                    <td width="5%">
                        <label><b>Edit</b></label>              
                    </td>
                    <td width="5%">
                        <label><b>Delete</b></label>              
                    </td>
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
                    <td><%=rs.getString("EMAIL").toString()%></td>
                    <td><a href="user_edit_view.jsp?ID=<%=rs.getString("ID").toString()%>"/><img src="images\edit.png" height='20' width='20'/></a></td>
                    <td><a href="user_delete.jsp?ID=<%=rs.getString("ID").toString()%>"/><img src="images\delete.png" height='20' width='20'/></a></td>
                </tr>
                <%} else {%>
                <tr bgcolor="white">
                    <td><%=rs.getString("ID").toString()%></td>
                    <td><%=rs.getString("NAME").toString()%></td>
                    <td><%=rs.getString("ADDRESS").toString()%></td>
                    <td><%=rs.getString("EMAIL").toString()%></td>
                    <td><a href="user_edit_view.jsp?ID=<%=rs.getString("ID").toString()%>"/><img src="images\edit.png" height='20' width='20'/></a></td>
                    <td><a href="user_delete.jsp?ID=<%=rs.getString("ID").toString()%>"/><img src="images\delete.png" height='20' width='20'/></a></td>
                        <%}
                                i++;
                            }
                        } catch (Exception e) {
                        %><%=e.getMessage()%><%
                            }
                        %>
            </table>
        </div>
    </body>
</html>
