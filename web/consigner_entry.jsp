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
        <title>CREATE CONSIGNER</title>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#country').on('change', function(){
                   $countryName = $this.val();
                   if(countryName){
                       $.ajax({
                           type:'POST'
                       })
                   }else{
                       
                   }
                });
            });
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
        <h1 align="center">CREATE CONSIGNER</h1>        
        <form name="cnentry" action="consignment_validation.jsp" method="POST">
            <table width="90%" align="center">
                <%if (request.getAttribute("Message") != null) {%>
                <tr><td colspan="3"><b><font color="blue"><%=request.getAttribute("Message")%></font></b></td></tr>
                            <%}%>                
                <tr>
                    <td>
                        <div class="container">
                            <input type="hidden" name="flag" value="consigner">

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
                    <td>
                        <div class="container">
                            <label for="country"><b>Country *</b></label>
                            <input type="text" placeholder="Enter Country " name="country">

                            <label for="state"><b>State *</b></label>                            
                            <input type="text" placeholder="Enter State " name="state">

                            <label for="city"><b>City</b></label>                            
                            <input type="text" placeholder="Enter City " name="city">

                            <label for="pin"><b>Pin</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin">

                            <label for="phone"><b>Phone</b></label>
                            <input type="text" placeholder="Enter Phone" name="phone">
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label for="mobile"><b>Mobile</b></label>
                            <input type="text" placeholder="Enter Mobile" name="mobile">

                            <label for="email"><b>Email</b></label>
                            <input type="text" placeholder="Enter Email" name="email">

                            <label for="website"><b>Website *</b></label>
                            <input type="text" placeholder="Enter Website" name="website">

                            <label for="gstin"><b>GSTIN</b></label>
                            <input type="text" placeholder="Enter GSTIN" name="gstin">

                            <label for="pan"><b>PAN</b></label>
                            <input type="text" placeholder="Enter PAN" name="pan">
                        </div>
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
