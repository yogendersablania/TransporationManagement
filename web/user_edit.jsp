<%-- 
    Document   : user_edit
    Created on : 25 Aug, 2018, 6:11:18 PM
    Author     : yogen
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
        <h1 align="center">CREATE USER</h1>
        <form name="employee" action="user_list.jsp" method="post">
            <table width="60%" align="center">
                <tr>                
                    <td>
                        <div class="container">
                            <label><b>Type *</b></label>
                            <select name="search_type">
                                <option value="name">Name</option>
                                <option value="email">Email</option>
                                <option value="address">Address</option>
                                <option value="city">City</option>
                                <option value="state">State</option>
                                <option value="zip">Zip Code</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>Search Value *</b></label>
                            <input type="text" placeholder="Enter Search Value" name="search_value" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div class="container">
                            <input type="submit" name="Search" />
                        </div>
                    </td>
                </tr>
            </table>            
        </form>
    </body>
</html>
