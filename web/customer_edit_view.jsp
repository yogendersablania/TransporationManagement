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
        <title>EDIT CUSTOMER</title>
        <script type="text/javascript">
            function countryselect(countryval) {
                $.ajax({
                    url: 'select_state.jsp',
                    type: 'POST',
                    data: {countryid: countryval},
                    success: function (result) {
                        $('#state1').html(result);
                    }
                });
            }

            function stateselect(stateval) {
                $.ajax({
                    url: 'select_city.jsp',
                    type: 'POST',
                    data: {stateid: stateval},
                    success: function (result) {
                        $('#city1').html(result);
                    }
                });
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <% if (request.getAttribute("Message") != null) {%>
        <script type="text/javascript">
            var dbResult = "<%=request.getAttribute("Message")%>";
            alert(dbResult);
        </script>
        <% } %>
        <h1 align="center">EDIT CUSTOMER</h1>
        <form name="employee" action="customer_edit_validation.jsp" method="post" onsubmit="formValidation()">
            <table width="90%" align="center">
                <%
                    String ID = request.getParameter("ID");                    
                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString = "Select * FROM customer Where customer_id = '" + ID + "'";
                    Statement statement = connection.createStatement();
                    statement.executeQuery(sqlString);
                    ResultSet rs = statement.getResultSet();
                    rs.next();
                %>
                <tr>
                    <td width="33%">
                        <div class="container">

                            <input type="hidden" name="flag" value="customer">
                            <input type="hidden" name="id" value="<%=request.getParameter("ID")%>">
                            <input type="hidden" name="page" value="<%=request.getParameter("PAGE")%>">

                            <label for="name"><b>Name *</b></label>
                            <input type="text" placeholder="Enter Customer Name" name="name" required value="<%=rs.getString("customer_name").toString()%>">

                            <label for="mobile"><b>Mobile *</b></label>
                            <input type="text" placeholder="Enter Mobile" name="mobile" required value="<%=rs.getString("customer_mobile").toString()%>">

                        </div>
                    </td>
                    <td width="33%">  
                        <div class="container">
                            <label for="email"><b>Email *</b></label>
                            <input type="text" placeholder="Enter Email" name="email" required value="<%=rs.getString("customer_email").toString()%>">

                            <label for="website"><b>Website</b></label>
                            <input type="text" placeholder="Enter Website" name="website" value="<%=rs.getString("customer_website").toString()%>">
                        </div>
                    </td>
                    <td width="33%">
                        <div class="container">
                            <label for="gstin"><b>GSTIN</b></label>
                            <input type="text" placeholder="Enter GSTIN" name="gstin" value="<%=rs.getString("customer_gstin").toString()%>">

                            <label for="pan"><b>PAN</b></label>
                            <input type="text" placeholder="Enter PAN" name="pan" value="<%=rs.getString("customer_pan").toString()%>">
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
