<%-- 
    Document   : create_user
    Created on : Jul 21, 2018, 9:31:32 PM
    Author     : User
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript">
            function checkPasswordMatch() {
                var password = $("#password").val();
                var confirmPassword = $("#confirm_password").val();

                if (password != confirmPassword) {
                    alert("Password did not matched.");                    
                }
            }

            $(document).ready(function () {
                $("#password, #confirm_password").change(checkPasswordMatch);
            });

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
        <title>CREATE USER</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br/>
        <h1 align="center">CREATE USER</h1>
        <form name="employee" action="user_validation.jsp" method="post">
            <table width="60%" align="center">
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
                            <label><b>Username *</b></label>
                            <input type="text" placeholder="Enter Username" name="name" required minlength="6" maxlength="20" pattern="^[a-zA-Z]{6,20}$" title="Character only (min=6 and max=20)">
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Email *</b></label>
                            <input type="email" placeholder="Enter User Email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,3}$" title="Enter Email Only.">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>Password *</b></label>
                            <input type="password" placeholder="Enter Password" required id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">   
                        </div>                        
                    </td>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Confirm Password *</b></label>
                            <input type="password" placeholder="Enter Confirm Password" required id="confirm_password" name="confirm_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" onchange="password_validation()">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>Address *</b></label>
                            <input type="text" placeholder="Enter Address" name="address" required minlength="6" >
                        </div>                        
                    </td>
                    <td>
                        <div class="container">
                            <label><b>LandMark</b></label>
                            <input type="text" placeholder="Enter LandMark" name="landmark">
                        </div>                        
                    </td>
                </tr>
                <tr>
                    <td>
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
                        </div>
                    </td>
                    <td>
                        <label><b>State *</b></label>
                        <div class="container" id="state1">
                            <select name="state" id="state" required>
                                <option value="0">Select State *</option> 
                            </select>
                        </div>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label><b>City *</b></label>
                        <div class="container" id="city1">
                            <select name="city" id="city" required>
                                <option value="0">Select City *</option> 
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>Pin *</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin" required pattern="[0-9]{6}" title="Enter 6 Digit PIN Code.">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div class="container">
                            <input type="submit" Value="Create" />
                        </div>
                    </td>
                </tr>
            </table>
            <%
                } catch (Exception e) {

                }
            %>
        </form>    
    </body>
</html>
