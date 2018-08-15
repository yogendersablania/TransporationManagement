<%-- 
    Document   : index
    Created on : Jul 21, 2018, 6:07:26 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br/><br/><br/><br/>

        <table width="40%" align="center">
            <tr>
                <td>
                    <form name="tracking" action="loginvalidation.jsp" mathod="post" width="40%">
                        <!--
                        <div class="imgcontainer">
                            <img src="img_avatar2.png" alt="Avatar" class="avatar">
                        </div>
                        -->    
                        <div class="container" width="50px">
                            <label for="uname"><b>Username</b></label>
                            <input type="text" placeholder="Enter Username" name="loginid" required>

                            <label for="psw"><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" name="pass" required>

                            <button type="submit">Login</button>
                            <label>
                                <input type="checkbox" checked="checked" name="remember"> Remember me
                            </label>
                        </div>

                        <div class="container" style="background-color:#f1f1f1">
                            <button type="button" class="cancelbtn">Cancel</button>
                            <span class="psw">Forgot <a href="#">password?</a></span>
                        </div>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
