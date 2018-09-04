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
        <br/>
        <h1 align="center">CREATE CUSTOMER</h1>        
        <form name="cnentry" action="customer_validation.jsp" method="POST">
            <table width="90%" align="center">
                <%if (request.getAttribute("Message") != null) {%>
                <tr><td colspan="3"><b><font color="blue"><%=request.getAttribute("Message")%></font></b></td></tr>
                            <%}%>

                <tr valign="top">
                    <td width="33%">
                        <div class="container">
                            <input type="hidden" name="flag" value="customer">

                            <label for="name"><b>Name *</b></label>
                            <input type="text" placeholder="Enter Consigner Name" name="name" required>

                            <label for="address3"><b>Address 1 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address1" required>

                            <label for="address2"><b>Address 2 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address2" required>

                            <label for="address3"><b>Address 3 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address3" required>

                            <label for="landmark"><b>Landmark</b></label>
                            <input type="text" placeholder="Enter Landmark" name="landmark">                            
                        </div>
                    </td>
                    <td width="33%">
                        <div class="container">                            
                            <%
                                try {

                                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                                    String sqlString1 = "select id, name  from countries order by name";
                                    Statement statement1 = connection.createStatement();
                                    statement1.executeQuery(sqlString1);
                                    ResultSet rs1 = statement1.getResultSet();

                            %>                           
                            <label><b>Country *</b></label>
                            <select name="country" id="country" required onchange="countryselect(this.value)">
                                <option value="0">Select Country</option>
                                <%                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("id").toString()%>"><%=rs1.getString("name").toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                            <%
                            } catch (Exception e) {
                            %>
                            <label><b><%=e.getMessage()%></b></label>
                            <%
                                }
                            %>
                            <label><b>State *</b></label>
                            <div class="container" id="state1">
                                <select name="state" id="state" required>
                                    <option value="0">Select State *</option> 
                                </select>
                            </div> 

                            <label><b>City *</b></label>
                            <div class="container" id="city1">
                                <select name="city" id="city" required>
                                    <option value="0">Select City *</option> 
                                </select>
                            </div>

                            <label for="pin"><b>Pin *</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin" required>

                            <label for="phone"><b>Phone</b></label>
                            <input type="text" placeholder="Enter Phone" name="phone">
                        </div>
                    </td>
                    <td width="33%">
                        <div class="container">
                            <label for="mobile"><b>Mobile *</b></label>
                            <input type="text" placeholder="Enter Mobile" name="mobile" required>

                            <label for="email"><b>Email *</b></label>
                            <input type="text" placeholder="Enter Email" name="email" required>

                            <label for="website"><b>Website</b></label>
                            <input type="text" placeholder="Enter Website" name="website">

                            <label for="gstin"><b>GSTIN</b></label>
                            <input type="text" placeholder="Enter GSTIN" name="gstin">

                            <label for="pan"><b>PAN</b></label>
                            <input type="text" placeholder="Enter PAN" name="pan">
                        </div>
                    </td>
                </tr>
            </table>

        </form>    
    </body>
</html>
