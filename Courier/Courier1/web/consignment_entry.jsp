<%-- 
    Document   : consignment_entry
    Created on : Jul 21, 2018, 8:22:55 PM
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
        <%@include file="header.jsp"%>
        <h1 align="center">CONSIGNMENT ENTRY</h1>
        <form name="" action="consignment_validation.jsp" mathod="post">
            <table width="90%" align="center">
                <tr>
                    <td valign="top">
                        <div class="container">
                            <label for="uname"><b>Number *</b></label>
                            <input type="text" placeholder="Enter Consignment Number" name="cn" required>

                            <label for="psw"><b>Consignee *</b></label>
                            <input type="password" placeholder="Select Consignee" name="consignee" required>

                            <label for="psw"><b>Risk *</b></label>
                            <input type="password" placeholder="Enter Risk" name="risk" required>                        </div>
                        </form>
                    </td>
                    <td valign="top">
                        <div class="container">
                            <label for="uname"><b>Date *</b></label>
                            <input type="text" placeholder="Enter Date" name="date" required>

                            <label for="psw"><b>Pay Basis</b></label>
                            <input type="password" placeholder="Enter Pay Basis" name="paybasis">

                            <label for="psw"><b>MOD *</b></label>
                            <input type="password" placeholder="Enter MOD" name="mod">
                        </div>
                        </form>
                    </td>
                    <td valign="top">
                        <div class="container">
                            <label for="uname"><b>Consigner *</b></label>
                            <input type="text" placeholder="Enter Consigner" name="consigner" required>

                            <label for="psw"><b>Service Type</b></label>
                            <input type="password" placeholder="Enter Service Type" name="servicetype">
                        </div>
                        </form>
                    </td>
                </tr>
                <tr>               
                    <td></td>
                    <td>
                        <div class="container">
                            <button type="submit">Create</button>                            
                        </div>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
