<%-- 
    Document   : select_customer
    Created on : 2 Sep, 2018, 12:14:35 PM
    Author     : yogen
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<%
    try {
        Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
        String ID = request.getParameter("consigneeid");

        String sqlString3 = "SELECT * FROM consignee WHERE consignee_id ='" + ID + "'";
        Statement statement3 = connection.createStatement();
        statement3.executeQuery(sqlString3);
        ResultSet rs3 = statement3.getResultSet();
        if (rs3.next()) {


%>

<table width="100%" align="center">
    <tr>
        <td>
            <div class="container">
                <label for="name"><b>Name *</b></label>
                <input type="text" placeholder="Enter Consigner Name" name="name" value="<%=rs3.getString("consignee_name").toString()%>" disabled required>

                <label for="address3"><b>Address 1 *</b></label>
                <input type="text" placeholder="Enter Address" name="address1" value="<%=rs3.getString("consignee_address1").toString()%>" disabled  required>

                <label for="address2"><b>Address 2 *</b></label>
                <input type="text" placeholder="Enter Address" name="address2" value="<%=rs3.getString("consignee_address2").toString()%>" disabled  required>

                <label for="address3"><b>Address 3 *</b></label>
                <input type="text" placeholder="Enter Address" name="address3" value="<%=rs3.getString("consignee_address3").toString()%>" disabled  required>

                <label for="landmark"><b>Landmark</b></label>
                <input type="text" placeholder="Enter Landmark" name="landmark" value="<%=rs3.getString("consignee_landmark").toString()%>" disabled >                            
            </div>
            </form>
        </td>
        <td>
            <div class="container">
                <label for="country"><b>Country *</b></label>
                <input type="text" placeholder="Enter Country " name="country" value="<%=rs3.getString("consignee_country").toString()%>" disabled >

                <label for="state"><b>State *</b></label>
                <input type="text" placeholder="Enter State " name="state" value="<%=rs3.getString("consignee_state").toString()%>" disabled >

                <label for="city"><b>City</b></label>
                <input type="text" placeholder="Enter City " name="city" value="<%=rs3.getString("consignee_city").toString()%>" disabled >

                <label for="pin"><b>Pin</b></label>
                <input type="text" placeholder="Enter Pin Code" name="pin" value="<%=rs3.getString("consignee_pin").toString()%>" disabled >

                <label for="phone"><b>Phone</b></label>
                <input type="text" placeholder="Enter Phone" name="phone" value="<%=rs3.getString("consignee_phone").toString()%>" disabled >
            </div>
            </form>
        </td>
        <td>
            <div class="container">
                <label for="mobile"><b>Mobile</b></label>
                <input type="text" placeholder="Enter Mobile" name="mobile" value="<%=rs3.getString("consignee_mobile").toString()%>" disabled >

                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" value="<%=rs3.getString("consignee_email").toString()%>" disabled >

                <label for="website"><b>Website *</b></label>
                <input type="text" placeholder="Enter Website" name="website" value="<%=rs3.getString("consignee_website").toString()%>" disabled >

                <label for="gstin"><b>GSTIN</b></label>
                <input type="text" placeholder="Enter GSTIN" name="gstin" value="<%=rs3.getString("consignee_gstin").toString()%>" disabled >

                <label for="pan"><b>PAN</b></label>
                <input type="text" placeholder="Enter PAN" name="pan" value="<%=rs3.getString("consignee_pan").toString()%>" disabled >
            </div>
            </form>
        </td>
    </tr>
</table>

<%    }
    } catch (Exception e) {

    }
%>