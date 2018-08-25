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
        <h1 align="center">CREATE USER</h1>
        <form name="employee" action="user_edit_validation.jsp" method="post" onsubmit="formValidation()">
            <table width="60%" align="center">
                <%
                    String ID = request.getParameter("ID");
                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString = "Select * FROM employees Where employees_id = '" + ID + "'";
                    Statement statement = connection.createStatement();
                    statement.executeQuery(sqlString);
                    ResultSet rs = statement.getResultSet();
                    rs.next();
                %>
                <tr>
                    <td colspan="2">
                        <%
                            if (request.getAttribute("Message") != null) {
                        %>
                        <%=request.getAttribute("Message")%>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>Email *</b></label>
                            <input type="hidden" name="id" value="<%=request.getParameter("ID")%>">
                            <input type="email" placeholder="Enter User Email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$" title="Enter Email Only." value="<%=rs.getString("employees_email").toString()%>">
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>Address *</b></label>
                            <input type="text" placeholder="Enter Address" name="address" required minlength="6" value="<%=rs.getString("employees_address").toString()%>" >
                        </div>                        
                    </td>
                </tr>               
                <tr>                    
                    <td>
                        <div class="container">
                            <label><b>State *</b></label>
                            <select name="state" pattern="^[a-zA-Z]$" title="Character only (min=6 and max=20)">
                                <option value="<%=rs.getString("employees_state").toString()%>"><%=rs.getString("employees_state").toString()%></option>
                                <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                <option value="Andhra Pradesh">Andhra Pradesh</option>
                                <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                <option value="Assam">Assam</option>
                                <option value="Bihar">Bihar</option>
                                <option value="Chandigarh">Chandigarh</option>
                                <option value="Chhattisgarh">Chhattisgarh</option>
                                <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                                <option value="Daman and Diu">Daman and Diu</option>
                                <option value="NCT of Delhi">NCT of Delhi</option>
                                <option value="Goa">Goa</option>
                                <option value="Gujarat">Gujarat</option>
                                <option value="Haryana">Haryana</option>
                                <option value="Himachal Pradesh">Himachal Pradesh</option>
                                <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                <option value="Jharkhand">Jharkhand</option>
                                <option value="Karnataka">Karnataka</option>
                                <option value="Kerala">Kerala</option>
                                <option value="Lakshadweep">Lakshadweep</option>
                                <option value="Madhya Pradesh">Madhya Pradesh</option>
                                <option value="Maharashtra">Maharashtra</option>
                                <option value="Manipur">Manipur</option>
                                <option value="Meghalaya">Meghalaya</option>
                                <option value="Mizoram">Mizoram</option>
                                <option value="Nagaland">Nagaland</option>
                                <option value="Odisha">Odisha</option>
                                <option value="Puducherry">Puducherry</option>
                                <option value="Punjab">Punjab</option>
                                <option value="Rajasthan">Rajasthan</option>
                                <option value="Sikkim">Sikkim</option>
                                <option value="Tamil Nadu">Tamil Nadu</option>
                                <option value="Telangana">Telangana</option>
                                <option value="Tripura">Tripura</option>
                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                <option value="Uttarakhand">Uttarakhand</option>
                                <option value="West Bengal">West Bengal</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>City *</b></label>
                            <input type="text" placeholder="Enter City" name="city"  required pattern="^[a-zA-Z ]{3,40}$" title="Enter City Name in Character Only." value="<%=rs.getString("employees_city").toString()%>">
                        </div>
                    </td>
                </tr>
                <tr>                    
                    <td>
                        <div class="container">
                            <label><b>Pin *</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin" required pattern="[0-9]{6}" title="Enter 6 Digit PIN Code." value="<%=rs.getString("employees_zip_code").toString()%>">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div class="container">
                            <input type="submit" value="Edit" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
