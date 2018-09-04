<%-- 
    Document   : consigner_edit_list
    Created on : 1 Sep, 2018, 10:35:43 PM
    Author     : yogen
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        sqlString = "select consignee_id as ID, consignee_name as NAME, CONCAT(consignee_address1,', ',consignee_address2,', ',consignee_address3,', ',consignee_landmark,', ',consignee_city,', ',consignee_state,', ',consignee_country,', ',consignee_pin) as ADDRESS, consignee_phone as PHONE, consignee_mobile as MOBILE, consignee_email as EMAIL, consignee_website as WEBSITE, consignee_gstin as GSTIN, consignee_pan as PAN from consignee WHERE consignee_name LIKE '%" + text + "%' order by consignee_id";
                        break;
                    case "Email":
                        sqlString = "select consignee_id as ID, consignee_name as NAME, CONCAT(consignee_address1,', ',consignee_address2,', ',consignee_address3,', ',consignee_landmark,', ',consignee_city,', ',consignee_state,', ',consignee_country,', ',consignee_pin) as ADDRESS, consignee_phone as PHONE, consignee_mobile as MOBILE, consignee_email as EMAIL, consignee_website as WEBSITE, consignee_gstin as GSTIN, consignee_pan as PAN from consignee WHERE consignee_email LIKE '%" + text + "%' order by consignee_id";
                        break;
                    case "State":
                        sqlString = "select consignee_id as ID, consignee_name as NAME, CONCAT(consignee_address1,', ',consignee_address2,', ',consignee_address3,', ',consignee_landmark,', ',consignee_city,', ',consignee_state,', ',consignee_country,', ',consignee_pin) as ADDRESS, consignee_phone as PHONE, consignee_mobile as MOBILE, consignee_email as EMAIL, consignee_website as WEBSITE, consignee_gstin as GSTIN, consignee_pan as PAN from consignee WHERE consignee_state LIKE '%" + text + "%' order by consignee_id";
                        break;
                    case "City":
                        sqlString = "select consignee_id as ID, consignee_name as NAME, CONCAT(consignee_address1,', ',consignee_address2,', ',consignee_address3,', ',consignee_landmark,', ',consignee_city,', ',consignee_state,', ',consignee_country,', ',consignee_pin) as ADDRESS, consignee_phone as PHONE, consignee_mobile as MOBILE, consignee_email as EMAIL, consignee_website as WEBSITE, consignee_gstin as GSTIN, consignee_pan as PAN from consignee WHERE consignee_city LIKE '%" + text + "%' order by consignee_id";
                        break;
                    case "Zip":
                        sqlString = "select consignee_id as ID, consignee_name as NAME, CONCAT(consignee_address1,', ',consignee_address2,', ',consignee_address3,', ',consignee_landmark,', ',consignee_city,', ',consignee_state,', ',consignee_country,', ',consignee_pin) as ADDRESS, consignee_phone as PHONE, consignee_mobile as MOBILE, consignee_email as EMAIL, consignee_website as WEBSITE, consignee_gstin as GSTIN, consignee_pan as PAN from consignee WHERE consignee_pin LIKE '%" + text + "%' order by consignee_id";
                        break;
                }

                Statement statement = connection.createStatement();
                statement.executeQuery(sqlString);
                ResultSet rs = statement.getResultSet();
        %>
        <br/>
        <table width="50%" align="right">
            <tr>
                <td><input type="submit" value="Download .xls" /></td>
                <td><input type="submit" value="Download .pdf" ></td>
                <td><input type="submit" value="Download .csv" /></td>
                <td><input type="submit" value="Download .doc" /></td>
            </tr>
        </table>
        <div id="HTMLtoPDF">
            <table width="90%" align="center">
                <tr>
                    <td colspan=4 background="E8E6E5" align="center">   
                        <label><h2>CONSIGNEE LIST</h2></label>
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
                    <td width="5%"><label><b>EDIT</b></label></td>
                    <td width="5%"><label><b>DELETE</b></label></td>
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
                    <td><a href="consignee_edit_view.jsp?ID=<%=rs.getString("ID").toString()%>&PAGE=LIST"><img src="images\edit.png" height='20' width='20'/></a></td>
                    <td><a href="consignee_delete.jsp?ID=<%=rs.getString("ID").toString()%>"/><img src="images\delete.png" height='20' width='20'/></a></td>
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
                    <td><a href="consignee_edit_view.jsp?ID=<%=rs.getString("ID").toString()%>&PAGE=LIST"><img src="images\edit.png" height='20' width='20'/></a></td>
                    <td><a href="consignee_delete.jsp?ID=<%=rs.getString("ID").toString()%>"/><img src="images\delete.png" height='20' width='20'/></a></td>
                </tr>
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