<%-- 
    Document   : index
    Created on : Jul 21, 2018, 6:07:26 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  language="java" %>
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.css">

<!DOCTYPE html>
<html class="myFontClass">    
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" language="javascript">
            function inputvalidation()
            {
            var Login = document.loginform.loginid.value;
            var Password = document.forms["loginform"].["pass"].value;
            var alphastr = /^[a-zA-Z]+$/;
            if (Login.length > 20)) {
            alert("Please User Name Maximum to 20 Character.");
            Login.focus();
            name.focus();
            return false;
            } else if (alphastr.match(Login) {
            alert("User Name should contain only character.");
            Login.focus();
            return false;
            }
            }

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SM EXPRESS</title>
    </head>
    <body bgcolor="#99ccff">
        <% if (request.getAttribute("Error") != null) {%>
        <script type="text/javascript">
            var dbResult = "<%=request.getAttribute("Error")%>";
            alert(dbResult);
        </script>
        <% }%>
        <br/><br/><br/><br/>
        <table width="40%" align="center" bgcolor="#ffffcc">
            <tr>
                <td background="E8E6E5" align="center">
                    <div class="container" width="50px">
                        <label><b>LOGIN</b></label>
                    </div>                    
                </td>
            </tr>
            <tr>
                <td background="E8E6E5">
                    <form name="loginform" action="loginvalidation.jsp" method="post" onSubmit="return inputvalidation();" width="40%">
                        <div class="container" width="50px">

                            <label><b>Username</b></label>
                            <input type="text" placeholder="Enter Username" name="loginid" id="loginid" required>

                            <label><b>Password</b></label>
                            <input type="password" placeholder="Enter Password" name="pass" id="pass" required autocomplete="off">

                            <input type="submit" name="Login" />
                        </div>
                        <div class="container" style="background-color:#f1f1f1">
                            <button type="reset" class="cancelbtn">Cancel</button>
                            <span class="psw"> <a href="#">Forgot Password ?</a></span>
                        </div>
                    </form>                    
                </td>
            </tr>
        </table>
    </body>
</html>
