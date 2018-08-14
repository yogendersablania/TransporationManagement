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
        <title>CONSIGNMENT LIST</title>
    </head>
    <body>        
        <%@include file="header.jsp"%>
        <%
            try {
                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                String sqlString = "select consignment_no as CN_NO, consignment_date as DATE, consignment_consignee as CONSIGNEE, consignment_consigner as CONSIGNER, consignment_risk as RISK, consignment_pay_basis as PAY_BASIS, consignment_mod as MODE, consignment_service_type as SERVICE_TYPE from consignment order by consignment_no";
                Statement statement = connection.createStatement();
                statement.executeQuery(sqlString);
                ResultSet rs = statement.getResultSet();
                rs.next();
                
                //For Consigner Name.
                String sqlString1 = "select consigner_name as NAME from consigner WHERE consigner_id = " + rs.getString("CONSIGNER").toString();
                Statement statement1 = connection.createStatement();
                statement1.executeQuery(sqlString1);
                ResultSet rs1 = statement.getResultSet();

                //For Consignee Name.
                String sqlString2 = "select consigner_name as NAME from consigner WHERE consigner_id = " + rs.getString("CONSIGNER").toString();
                Statement statement2 = connection.createStatement();
                statement2.executeQuery(sqlString2);
                ResultSet rs2 = statement.getResultSet();

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
        <table width="95%" align="center">            
            <tr>
                <td colspan=8 background="E8E6E5" align="center">   
                    <label><h2>CONSIGNER LIST</h2></label>
                </td>
            </tr>
        </table>
        <table width="90%" align="center" border="0" cellpadding="3">
            <tr bgcolor="F8F5F2">                
                <td width="5%"><label><b>CN NO</b></label></td>
                <td width="5%"><label><b>DATE</b></label></td>
                <td width="25%"><label><b>CONSIGNER</b></label></td>
                <td width="25%"><label><b>CONSIGNEE</b></label></td>
                <td width="10%"><label><b>RISK</b></label></td>
                <td width="10%"><label><b>PAY BASIS</b></label></td>
                <td width="10%"><label><b>MODE</b></label></td>
                <td width="10%"><label><b>SERVICE TYPE</b></label></td>
            </tr>
            <%                
                int i = 0;
                rs.previous();
                while (rs.next()) {
                    if (i % 2 == 0) {
                        rs1.next();
                        rs2.next();
            %>
            <tr bgcolor="D4FCEE">
                <td><%=rs.getString("CN_NO").toString()%></td>
                <td><%=rs.getString("DATE").toString()%></td>                
                <td><%=rs1.getString("NAME").toString()%></td>
                <td><%=rs2.getString("NAME").toString()%></td>
                <td><%=rs.getString("RISK").toString()%></td>
                <td><%=rs.getString("PAY_BASIS").toString()%></td>
                <td><%=rs.getString("MODE").toString()%></td>
                <td><%=rs.getString("SERVICE_TYPE").toString()%></td>
            </tr>
            <%} else {%>
            <tr bgcolor="white">
                <td><%=rs.getString("CN_NO").toString()%></td>
                <td><%=rs.getString("DATE").toString()%></td>
                <td><%=rs1.getString("NAME").toString()%></td>
                <td><%=rs2.getString("NAME").toString()%></td>
                <td><%=rs.getString("RISK").toString()%></td>
                <td><%=rs.getString("PAY_BASIS").toString()%></td>
                <td><%=rs.getString("MODE").toString()%></td>
                <td><%=rs.getString("SERVICE_TYPE").toString()%></td>
            </tr>
            <%}
                    i++;
                }
            %>

            <%        } catch (Exception e) {
            %>
            <tr bgcolor="white">
                <td colspan=8><%=e.getMessage()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
