<%-- 
    Document   : customer_entry
    Created on : Jul 21, 2018, 8:30:07 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consignee Entry</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <h1 align="center">CREATE NEW CONSIGNEE</h1>
        <form name="" action="customer_validation.jsp" mathod="post">
            <table width="90%" align="center">
                <input type="text"  name = "flag"  style="display: none" value="1"/>
                <tr>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Name *</b></label>
                            <input type="text" placeholder="Enter Consignee Name" name="name" required>

                            <label for="psw"><b>Address 3</b></label>
                            <input type="password" placeholder="Enter Address" name="address" required>

                            <label for="psw"><b>State *</b></label>
                            <input type="password" placeholder="Enter State" name="state" required>
                            
                            <label for="psw"><b>Phone</b></label>
                            <input type="password" placeholder="Enter Phone" name="phone">
                            
                            <label for="psw"><b>Website *</b></label>
                            <input type="password" placeholder="Enter Website" name="website">
                        </div>
                        </form>
                    </td>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Address 2 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address2" required>

                            <label for="psw"><b>Landmark</b></label>
                            <input type="password" placeholder="Enter Landmark" name="landmark">

                            <label for="psw"><b>Country *</b></label>
                            <input type="password" placeholder="Enter Country" name="country">
                            
                            <label for="psw"><b>Mobile</b></label>
                            <input type="password" placeholder="Enter Mobile" name="mobile">
                            
                            <label for="psw"><b>GSTIN</b></label>
                            <input type="password" placeholder="Enter GSTIN" name="gstin">
                        </div>
                        </form>
                    </td>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Address 3 *</b></label>
                            <input type="text" placeholder="Enter Address" name="address3" required>

                            <label for="psw"><b>City</b></label>
                            <input type="password" placeholder="Enter City" name="city">

                            <label for="psw"><b>Pin</b></label>
                            <input type="password" placeholder="Enter Pin Code" name="pin">
                            
                            <label for="psw"><b>Email</b></label>
                            <input type="password" placeholder="Enter Email" name="email">
                            
                            <label for="psw"><b>PAN</b></label>
                            <input type="password" placeholder="Enter PAN" name="pan">
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
