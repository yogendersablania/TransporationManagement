<%-- 
    Document   : user_delete_search
    Created on : 25 Aug, 2018, 7:07:27 PM
    Author     : yogen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <h1 align="center">DELETE USER</h1>
        <form name="employee" action="user_delete_list.jsp" method="post" onsubmit="formValidation()">
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
                            <label><b>Search Type *</b></label>
                            <select name="search_type">
                                <option value="Name">Name</option>
                                <option value="Email">Email</option>
                                <option value="Address">Address</option>
                                <option value="City">City</option>
                                <option value="State">State</option>
                                <option value="City">State</option>
                                <option value="Zip">Zip</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>Search Text *</b></label>
                            <input type="text" name="search_text" placeholder="Enter Search Value" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div class="container">
                            <input type="submit" value="Delete" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
