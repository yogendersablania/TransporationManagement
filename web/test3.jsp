<%-- 
    Document   : customer_entry
    Created on : Jul 21, 2018, 8:30:07 PM
    Author     : User
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>CREATE CONSIGNER</title>
        <script type="text/javascript" language="javascript">
            function SubmitForm(formId) {
                var oForm = document.getElementById(formId);
                if (oForm) {
                    oForm.submit();
                } else {
                    alert("DEBUG - could not find element " + formId);
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br/>
        <h1 align="center">CREATE CONSIGNER</h1>        
        <div data-panel="one">
            <form name="loginform" action="loginvalidation.jsp" method="post" >
            <h3 align="center"><label><b>BASIC DETAIL</b></label></h3>
            <br/>
            <%
                try {

                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString1 = "select id, name  from countries order by name";
                    Statement statement1 = connection.createStatement();
                    statement1.executeQuery(sqlString1);
                    ResultSet rs1 = statement1.getResultSet();
            %>
            <table border="0" align="center" cellpadding="3">
                <tr>
                    <td width="15%"><label><b>COUNTRY *</b></label></td>
                    <td width="19%">
                        <select name="country" id="country" required onchange="this.form.submit();">
                            <option value="0">Select Country</option>
                            <%
                                while (rs1.next()) {
                            %>
                            <option value="<%=rs1.getString("id").toString()%>"><%=rs1.getString("name").toString()%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                    <td width="15%"><label><b>STATE *</b></label></td>
                    <td width="19%">
                        <select name="state" id="state" required>
                            <option value="0">Select State</option>
                            <%
                                String sqlString2 = "select id, name  from states where country_id=? order by name";
                                PreparedStatement statement2 = connection.prepareStatement(sqlString2);
                                statement2.setString(1, request.getParameter("country"));
                                ResultSet rs2 = statement2.executeQuery();
                                while (rs2.next()) {
                            %>                                                    
                            <option value="<%=rs2.getString("id").toString()%>"><%=rs2.getString("name").toString()%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                    <td width="15%"><label><b>CITY *</b></label></td>
                    <td width="19%">
                        <select name="city" id="city" required>
                            <option value="0">Select City</option>
                            <%
                                String sqlString3 = "select id, name from cities where state_id=? order by name";
                                PreparedStatement statement3 = connection.prepareStatement(sqlString2);
                                statement3.setString(1, request.getParameter("state"));
                                ResultSet rs3 = statement3.executeQuery();
                                while (rs3.next()) {
                            %>                                                    
                            <option value="<%=rs3.getString("id").toString()%>"><%=rs3.getString("name").toString()%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>                    
                </tr>                
            </table>
        </div>
        <%} catch (Exception e) {%>
        <%=e.getMessage()%>    
        <%}%>  
    </body>
</html>
