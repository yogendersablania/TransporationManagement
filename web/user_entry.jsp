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
        <script>
            function formValidation() {
                var pass = document.getElementById('password');
                var cpass = document.getElementById('confirm_password');
                if (pass.value != cpass.value) {
                    alert("Password and confirm passform not matching.");
                    pass.focus();
                    pass.style.color = "yellow";
                }
            }
        </script>
        <title>CREATE USER</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br/>
        <h1 align="center">CREATE USER</h1>
        <form name="employee" action="user_validation.jsp" method="post" onsubmit="validateMyForm();">
            <table width="60%" align="center">
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
                            <input type="text" placeholder="Enter Username" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Character only (min=6 and max=20)">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>Password *</b></label>
                            <input type="password" placeholder="Enter Password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">   
                        </div>                        
                    </td>
                    <td>
                        <div class="container">
                            <label for="uname"><b>Confirm Password *</b></label>
                            <input type="password" placeholder="Enter Confirm Password" name="confirm_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>Address *</b></label>
                            <input type="text" placeholder="Enter Address" name="address" minlength="6" >
                        </div>                        
                    </td>
                    <td>
                        <div class="container">
                            <label for="psw"><b>City *</b></label>
                            <input type="text" placeholder="Enter City" name="city"  required pattern="[0-9]{6}" title="Enter City Name in Character Only.">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>State *</b></label>
                            <select name="state" pattern="^[a-zA-Z]$" title="Character only (min=6 and max=20)">
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
                            <label><b>Pin *</b></label>
                            <input type="text" placeholder="Enter Pin Code" name="pin" required pattern="[0-9]{6}" title="Enter 6 Digit PIN Code.">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <div class="container">
                            <input type="submit" name="Create" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>    
    </body>
</html>
