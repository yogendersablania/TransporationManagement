
<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<link rel="stylesheet" type="text/css" href="css/multipageform.css">
<html class="myFontClass">    
    <head>
        <script type="text/javascript" src="js/multipageform.js"></script>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SM EXPRESS</title>
        <script type="text/javascript" language="javascript">
            function get_values()
            {
                var consignerID = document.getElementById("consigner").value.toString();
                var consigneeID = document.getElementById("consignee").value.toString();

                if (consignerID == 0) {
                    alert("Select a Consigner.");
                } else if (consigneeID == 0) {
                    alert("Select a Consignee.");
                }
                document.getElementById("consignerid").value = consignerID;
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp"%><br/>
        <form name="loginform" action="loginvalidation.jsp" method="post" onSubmit="return inputvalidation();">
            <table align="center">
                <tr>
                    <td background="E8E6E5">                    
                        <div class="form" align="center">
                            <h2 align="center"><label><b>CONSIGNMENT NOTE ENTRY</b></label></h2>                           
                            <input id="one" type="radio" name="stage" checked="checked" />
                            <input id="two" type="radio" name="stage" onchange="get_values();"/>
                            <input id="three" type="radio" name="stage" />
                            <input id="four" type="radio" name="stage" />
                            <input id="five" type="radio" name="stage" />
                            <input id="six" type="radio" name="stage" />

                            <div class="stages">
                                <label for="one">1</label>
                                <label for="two">2</label>
                                <label for="three">3</label>
                                <label for="four">4</label>
                                <label for="five">5</label>
                                <label for="six">6</label>
                            </div>

                            <span class="progress"><span></span></span>

                            <div class="panels">
                                <div data-panel="one">                                    
                                    <h3 align="center"><label><b>BASIC DETAIL</b></label></h3>
                                    <br/>
                                    <%
                                        try {

                                            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                                            String sqlString1 = "select consigner_id as ID, CONCAT(consigner_name,', ',consigner_address1,', ',consigner_address2,', ',consigner_address3,', ',consigner_landmark,', ',consigner_city,', ',consigner_state,', ',consigner_country,', ',consigner_pin) as CONSIGNER from consigner order by consigner_name";
                                            String sqlString2 = "select consignee_id as ID, CONCAT(consignee_name,', ',consignee_address1,', ',consignee_address2,', ',consignee_address3,', ',consignee_landmark,', ',consignee_city,', ',consignee_state,', ',consignee_country,', ',consignee_pin) as CONSIGNEE from consignee order by consignee_name";

                                            Statement statement1 = connection.createStatement();
                                            Statement statement2 = connection.createStatement();

                                            statement1.executeQuery(sqlString1);
                                            statement2.executeQuery(sqlString2);

                                            ResultSet rs1 = statement1.getResultSet();
                                            ResultSet rs2 = statement2.getResultSet();

                                    %>
                                    <table border="0" align="center" cellpadding="3">
                                        <tr>
                                            <td width="15%"><label><b>CN NUMBER * : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Enter CN NUMBER" name="cnnumber" id="cnnumber"></td>
                                            <td width="15%"><label><b>CONSIGNER *</b></label></td>
                                            <td width="19%">
                                                <select name="consigner" id="consigner" required onchange="get_values();">
                                                    <option value="0">Select Consigner</option>
                                                    <%                                                        while (rs1.next()) {
                                                    %>
                                                    <option value="<%=rs1.getString("ID").toString()%>"><%=rs1.getString("CONSIGNER").toString()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                            <td width="15%"><label><b>DATE *</b></label></td>
                                            <td width="19%"><input type="date" placeholder="Enter DATE" name="consigner"></td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>RISK *</b></label></td>
                                            <td width="19%">
                                                <select name="risk" required>
                                                    <option value="OWNER">OWNER</option>
                                                    <option value="CONSIGNER">CONSIGNER</option>
                                                    <option value="CONSIGNEE">CONSIGNEE</option>
                                                    <option value="TRANSPOTER">TRANSPOTER</option>
                                                </select>
                                            </td>
                                            <td width="15%"><label><b>CONSIGNEE *</b></label></td>
                                            <td width="19%">
                                                <select name="consignee" id="consignee" required>
                                                    <option value="0">Select Consignee</option>
                                                    <%
                                                        while (rs2.next()) {
                                                    %>                                                    
                                                    <option value="<%=rs2.getString("ID").toString()%>"><%=rs2.getString("CONSIGNEE").toString()%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                            <td width="15%"><label><b>PAY BASIS *</b></label></td>
                                            <td width="19%">
                                                <select name="paybasis" required>
                                                    <option value="paid">PAID</option>
                                                    <option value="topay">TOPAY</option>
                                                    <option value="tobebilled">TO BE BILLED</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>MOD *</b></label></td>
                                            <td width="19%">
                                                <select name="mod" required>
                                                    <option value="air">AIR</option>
                                                    <option value="rail">RAIL</option>
                                                    <option value="road">ROAD</option>
                                                </select>
                                            </td>                                            
                                            <td width="15%"><label><b>SERVICE TYPE *</b></label></td>
                                            <td width="19%">
                                                <select name="servicetype" required>
                                                    <option value="FULL TRUCK">FULL TRUCK</option>
                                                    <option value="PART LOAD">PART LOAD</option>
                                                    <option value="PACKAGE">PACKAGE</option>
                                                </select>
                                            </td>
                                            <td width="15%"><label><b>GST PAID BY *</b></label></td>
                                            <td width="19%">
                                                <select name="gstpaidby" required>
                                                    <option value="CONSIGNER">CONSIGNER</option>
                                                    <option value="CONSIGNEE">CONSIGNEE</option>
                                                    <option value="TRANSPOTER">TRANSPOTER</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%} catch (Exception e) {%>
                                <%=e.getMessage()%>    
                                <%}%>



                                <div data-panel="two">
                                    <table border="0" align="center" cellpadding="3">
                                        <tr>
                                            <td width="15%" colspan="3"><label><b>CUSTOMER ID  : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Enter CUSTOMER ID" name="consignerid" id="consignerid" readonly></td>
                                            <td width="19%"><input type='submit' Value="Get Data"></input></td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>NAME : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>CITY : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>MOBILE : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>ADDRESS 1 : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>STATE : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>EMAIL : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>ADDRESS 2 : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>COUNTRY : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>WEBSITE :</b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>ADDRESS 3 : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>PIN : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>GSTIN : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                        </tr>
                                        <tr>
                                            <td width="15%"><label><b>LANDMARK : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>PHONE : </b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                            <td width="15%"><label><b>PAN :</b></label></td>
                                            <td width="19%"><input type="text" placeholder="Select Consigner" readonly=""></td>
                                        </tr>
                                    </table>
                                    </form>         
                                </div>




                                <div data-panel="three">
                                    <h4>Consigner Entry</h4>
                                    <input type="text" placeholder="Address" />
                                </div>
                                <div data-panel="four">
                                    <h4>Product Entry</h4>
                                    <input type="text" placeholder="Email" />
                                </div>
                                <div data-panel="five">
                                    <h4>Insurance Entry</h4>
                                    <input type="text" placeholder="Phone Number" />
                                </div>
                                <div data-panel="six">
                                    <h4>Freight</h4>
                                    <input type="text" placeholder="Comment" />
                                </div>
                            </div>                            
                            <!--<button>Next</button>-->
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
