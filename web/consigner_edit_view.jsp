<%-- 
    Document   : user_delete_search
    Created on : 25 Aug, 2018, 7:07:27 PM
    Author     : yogen
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EDIT USER</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <% if (request.getAttribute("Message") != null) {%>
        <script type="text/javascript">
            var dbResult = "<%=request.getAttribute("Message")%>";
            alert(dbResult);
        </script>
        <% } %>
        <h1 align="center">EDIT CONSIGNER</h1>
        <form name="employee" action="customer_edit_validation.jsp" method="post" onsubmit="formValidation()">
            <table width="90%" align="center">
                <%
                    String ID = request.getParameter("ID");
                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString = "Select * FROM consigner Where consigner_id = '" + ID + "'";
                    Statement statement = connection.createStatement();
                    statement.executeQuery(sqlString);
                    ResultSet rs = statement.getResultSet();
                    rs.next();
                %>
                <tr>
                    <td>
                        <div class="container">
                            <input type="hidden" name="flag" value="<%=request.getParameter("ID")%>">

                            <label for="name"><b>Name *</b></label>
                            <input type="text" placeholder="Enter Consigner Name" name="name" required value="<%=rs.getString("consigner_name").toString()%>">

                            <label for="address3"><b>Address 1 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address1" required value="<%=rs.getString("consigner_address1").toString()%>">

                            <label for="address2"><b>Address 2 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address2" required value="<%=rs.getString("consigner_address2").toString()%>">

                            <label for="address3"><b>Address 3 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address3" required value="<%=rs.getString("consigner_address3").toString()%>">

                            <label for="landmark"><b>Landmark</b></label>
                            <input type="text" placeholder="Enter Landmark" name="landmark" value="<%=rs.getString("consigner_landmark").toString()%>">                            
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label for="country"><b>Country *</b></label>
                            <input type="text" placeholder="Enter Country " name="country" value="<%=rs.getString("consigner_country").toString()%>">

                            <label for="state"><b>State *</b></label>                            
                            <input type="text" placeholder="Enter State " name="state" value="<%=rs.getString("consigner_state").toString()%>">

                            <label for="city"><b>City</b></label>                            
                            <input type="text" placeholder="Enter City " name="city" value="<%=rs.getString("consigner_city").toString()%>">

                            <label for="pin"><b>Pin</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin" value="<%=rs.getString("consigner_pin").toString()%>">

                            <label for="phone"><b>Phone</b></label>
                            <input type="text" placeholder="Enter Phone" name="phone" value="<%=rs.getString("consigner_phone").toString()%>">
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label for="mobile"><b>Mobile</b></label>
                            <input type="text" placeholder="Enter Mobile" name="mobile" value="<%=rs.getString("consigner_mobile").toString()%>">

                            <label for="email"><b>Email</b></label>
                            <input type="text" placeholder="Enter Email" name="email" value="<%=rs.getString("consigner_email").toString()%>">

                            <label for="website"><b>Website *</b></label>
                            <input type="text" placeholder="Enter Website" name="website" value="<%=rs.getString("consigner_website").toString()%>">

                            <label for="gstin"><b>GSTIN</b></label>
                            <input type="text" placeholder="Enter GSTIN" name="gstin" value="<%=rs.getString("consigner_gstin").toString()%>">

                            <label for="pan"><b>PAN</b></label>
                            <input type="text" placeholder="Enter PAN" name="pan" value="<%=rs.getString("consigner_pan").toString()%>">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">
                        <div class="container">
                            <input type="submit" value="Edit" />
                        </div>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
