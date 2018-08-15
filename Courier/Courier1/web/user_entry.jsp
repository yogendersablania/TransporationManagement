<%-- 
    Document   : create_user
    Created on : Jul 21, 2018, 9:31:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CREATE USER</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br/>
        <h1 align="center">CREATE USER</h1>
        <form name="tracking" action="user_validation.jsp" mathod="post">
            <table width="60%" align="center">
                <tr>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Username *</b></label>
                            <input type="text" placeholder="Enter Username" name="name" required>

                            <label for="psw"><b>Address</b></label>
                            <input type="text" placeholder="Enter Address" name="address">

                            <label for="psw"><b>State</b></label>
                            <input type="text" placeholder="Enter State" name="state">
                        </div>
                        </form>
                    </td>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Password *</b></label>
                            <input type="password" placeholder="Enter Password" name="pass" required>

                            <label for="psw"><b>City</b></label>
                            <input type="text" placeholder="Enter City" name="city">

                            <label for="psw"><b>Pin</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin">
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="container">
                            <button type="submit">Create</button>
                        </div>
                    </td>
                </tr>
            </table>
        </form>    
    </body>
</html>
