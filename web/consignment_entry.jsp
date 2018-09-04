<%-- 
    Document   : customer_entry
    Created on : Jul 21, 2018, 8:30:07 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <title>CONSIGNMENT NOTE ENTRY</title>
        <script language="javascript">
            function addRow(tableID) {

                var table = document.getElementById(tableID);
                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);
                var colCount = table.rows[0].cells.length;
                for (var i = 0; i < colCount; i++) {

                    var newcell = row.insertCell(i);
                    newcell.innerHTML = table.rows[0].cells[i].innerHTML;
                    //alert(newcell.childNodes);
                    switch (newcell.childNodes[0].type) {
                        case "text":
                            newcell.childNodes[0].value = "";
                            break;
                        case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                        case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                    }
                }
            }

            function deleteRow(tableID) {
                try {
                    var table = document.getElementById(tableID);
                    var rowCount = table.rows.length;
                    for (var i = 0; i < rowCount; i++) {
                        var row = table.rows[i];
                        var chkbox = row.cells[0].childNodes[0];
                        if (null != chkbox && true == chkbox.checked) {
                            if (rowCount <= 1) {
                                alert("Cannot delete all the rows.");
                                break;
                            }
                            table.deleteRow(i);
                            rowCount--;
                            i--;
                        }
                    }
                } catch (e) {
                    alert(e);
                }
            }

            function cnselect(bookval) {
                $.ajax({
                    url: 'select_cn.jsp',
                    type: 'POST',
                    data: {bookid: bookval},
                    success: function (result) {
                        $('#cnnumber1').html(result);
                    }
                });
            }

            function customerselect(customerval) {
                $.ajax({
                    url: 'select_customer.jsp',
                    type: 'POST',
                    data: {custid: customerval},
                    success: function (result) {
                        $('#customer1').html(result);
                    }
                });
            }

            function consignerselect(consignerval) {
                $.ajax({
                    url: 'select_consigner.jsp',
                    type: 'POST',
                    data: {consignerid: consignerval},
                    success: function (result) {
                        $('#consigner1').html(result);
                    }
                });
            }

            function consigneeselect(consigneeval) {
                $.ajax({
                    url: 'select_consignee.jsp',
                    type: 'POST',
                    data: {consigneeid: consigneeval},
                    success: function (result) {
                        $('#consignee1').html(result);
                    }
                });
            }
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
        <h1 align="center">CONSIGNMENT ENTRY</h1>
        <%
            try {

                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                String sqlString1 = "select consigner_id, consigner_name, consigner_state from consigner order by consigner_name";
                String sqlString2 = "select consignee_id, consignee_name, consignee_state from consignee order by consignee_name";
                String sqlString3 = "select customer_id, customer_name, customer_state from customer order by customer_name";
                String sqlString4 = "select * from cn_book order by id";
                Statement statement1 = connection.createStatement();
                Statement statement2 = connection.createStatement();
                Statement statement3 = connection.createStatement();
                Statement statement4 = connection.createStatement();
                statement1.executeQuery(sqlString1);
                statement2.executeQuery(sqlString2);
                statement3.executeQuery(sqlString3);
                statement4.executeQuery(sqlString4);
                ResultSet rs1 = statement1.getResultSet();
                ResultSet rs2 = statement2.getResultSet();
                ResultSet rs3 = statement3.getResultSet();
                ResultSet rs4 = statement4.getResultSet();
        %>
        <form name="cnentry" action="consignment_validation.jsp" method="post" onsubmit="validateMyForm();">
            <table width="90%" align="center">
                <%if (request.getAttribute("Message") != null) {%>
                <tr><td colspan="3"><b><font color="blue"><%=request.getAttribute("Message")%></font></b></td></tr>
                            <%}%>
                <tr>
                    <td colspan="2">
                        <TABLE id="dataTable">
                            <TR>
                                <TD width="33%">
                                    <label><b>CN BOOK NUMBER *</b></label>
                                    <select name="book" id="book" required onchange="cnselect(this.value)">
                                        <option value="0">Select a Book</option>
                                        <%
                                            while (rs4.next()) {
                                        %>
                                        <option value="<%=rs4.getString("id").toString()%>"><%=rs4.getString("cn_book_no").toString()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </TD>
                                <TD width="33%">
                                    <label><b>CN NUMBER *</b></label>
                                    <div class="container" id="cnnumber1">
                                        <select name="cnnumber" id="cnnumber" required>
                                            <option value="0">Select CN Number *</option> 
                                        </select>
                                    </div> 
                                </TD>
                                <td>
                                    <div class="container">
                                        <label><b>DATE *</b></label>
                                        <input type="date" placeholder="Enter DATE" name="date">
                                    </div>
                                </td>
                            </TR>
                        </TABLE>

                    </td>
                </tr>
                <tr>
                    <td width='33%'>
                        <div class="container">
                            <label><b>SELECT CUSTOMER *</b></label>
                            <select name="customer" id="customer" required onchange="customerselect(this.value)">
                                <option value="0">Select Customer</option>
                                <%
                                    while (rs3.next()) {
                                %>
                                <option value="<%=rs3.getString("customer_id").toString()%>"><%=rs3.getString("customer_name").toString()%> - <%=rs3.getString("customer_state").toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>                    
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="container" id="customer1"></div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="container">
                            <label><b>SELECT CONSIGNER *</b></label>
                            <select name="consigner" id="consigner" required onchange="consignerselect(this.value)">
                                <option value="0">Select Consigner</option>
                                <%
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("consigner_id").toString()%>"><%=rs1.getString("consigner_name").toString()%> - <%=rs1.getString("consigner_state").toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>                    
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="container" id="consigner1"></div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="container">
                            <label><b>SELECT CONSIGNEE *</b></label>
                            <select name="consignee" id="consignee" required onchange="consigneeselect(this.value)">
                                <option value="0">Select Customer</option>
                                <%
                                    while (rs2.next()) {
                                %>
                                <option value="<%=rs2.getString("consignee_id").toString()%>"><%=rs2.getString("consignee_name").toString()%> - <%=rs2.getString("consignee_state").toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>                    
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="container" id="consignee1"></div>
                    </td>
                </tr>

                <tr>
                    <td width='33%'>
                        <div class="container">
                            <label><b>RISK *</b></label>
                            <select name="risk" required>
                                <option value="OWNER">OWNER</option>
                                <option value="CONSIGNER">CONSIGNER</option>
                                <option value="CONSIGNEE">CONSIGNEE</option>
                                <option value="TRANSPOTER">TRANSPOTER</option>
                            </select>
                        </div>                        
                    </td>
                    <td width='33%'>
                        <div class="container">
                            <label><b>PAY BASIS *</b></label>
                            <select name="paybasis" required>
                                <option value="tobebilled">TO BE BILLED</option>
                                <option value="paid">PAID</option>
                                <option value="topay">TOPAY</option>                                
                            </select>
                        </div>
                    </td>
                    <td width='33%'>
                        <div class="container">
                            <label><b>MOD *</b></label>
                            <select name="mod" required>
                                <option value="road">ROAD</option>
                                <option value="air">AIR</option>
                                <option value="rail">RAIL</option>                                
                            </select>
                        </div>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>SERVICE TYPE *</b></label>
                            <select name="servicetype" required>
                                <option value="FTL">FTL</option>
                                <option value="PART LOAD">PART LOAD</option>
                                <option value="PACKAGE">PACKAGE</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>GST PAID BY *</b></label>
                            <select name="gstpaidby" required>
                                <option value="CONSIGNER">CONSIGNER</option>
                                <option value="CONSIGNEE">CONSIGNEE</option>
                                <option value="TRANSPOTER">TRANSPOTER</option>
                            </select>
                        </div>
                    </td>
                </tr>

                <!--    For Insurance Detail     -->

                <tr>
                    <td>
                        </br></br>
                        <b>INSURANCE DETAIL</b>                        
                    </td>
                    <td colspan="2" align='right'>
                        </br></br>
                        <INPUT type="button" value="Add Row" onclick="addRow('dataTable1')" />
                        <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable1')" />
                    </td>
                </tr>
                <tr>                  
                    <td colspan="3">                        
                        <TABLE width='100%'>                            
                            <TR bgcolor='#8bb3f4'>
                                <TD width='2%'></TD>
                                <TD width='28%'><label><b>COMPANY NAME *</b></label></TD>
                                <TD width='15%'><label><b>POLICY NUMBER *</b></label></TD>
                                <TD width='20%'><label><b>SUM INSURRED *</b></label></TD>
                                <TD width='10%'><label><b>START DATE *</b></label></TD>
                                <TD width='10%'><label><b>ENDS DATE *</b></label></TD>
                                <TD width='15%'><label><b>REMARKS *</b></label></TD>
                            </TR>
                        </TABLE>
                    </td>
                </tr>
                <tr>                  
                    <td colspan="3">                        
                        <TABLE id="dataTable1" width='100%'>                            
                            <TR>
                                <TD width='2%'><INPUT type="checkbox" name="chk"/></TD>
                                <TD width='28%'><INPUT placeholder="COMPANY NAME" type="text" name="insconame[]"/></TD>
                                <TD width='15%'><INPUT placeholder="POLICY NUMBER" type="text" name="insconumber[]"/></TD>
                                <TD width='20%'><INPUT placeholder="SUM INSURRED" type="text" name="inscoamount[]"/></TD>
                                <TD width='10%'><INPUT placeholder="START DATE" type="date" name="inscostartdate[]"/></TD>
                                <TD width='10%'><INPUT placeholder="ENDS DATE" type="date" name="inscoenddate[]"/></TD>
                                <TD width='15%'><INPUT placeholder="REMARKS" type="text" name="inscoremarks[]"/></TD>
                            </TR>
                        </TABLE>
                    </td>
                </tr>
                <!--    For Product Detail     -->
                <tr>
                    <td>
                        </br></br>
                        <b>PRODUCT DETAIL</b>                        
                    </td>
                    <td colspan="2" align='right'>
                        </br></br>
                        <INPUT type="button" value="Add Row" onclick="addRow('dataTable2')" />
                        <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable2')" />
                    </td>
                </tr>
                <tr>                    
                    <td colspan="3">                        
                        <TABLE>
                            <TR bgcolor='#8bb3f4'>
                                <TD width='2%'></TD>
                                <TD width='10'><label><b>DESCRIPTION *</b></label></TD>
                                <TD width='10%'><label><b>NO. OF PKT *</b></label></TD>
                                <TD width='08%'><label><b>ACTUAL WEIGHT *</b></label></TD>
                                <TD width='10%'><label><b>CHARGED WEIGHT *</b></label></TD>
                                <TD width='10%'><label><b>LENGTH *</b></label></TD>
                                <TD width='10%'><label><b>WIDTH *</b></label></TD>
                                <TD width='10%'><label><b>HEIGHT *</b></label></TD>
                                <TD width='10%'><label><b>MODE OF PACKING *</b></label></TD>
                                <TD width='10%'><label><b>RATE PER PACKAGE *</b></label></TD>
                                <TD width='10%'><label><b>RATE CHARGED *</b></label></TD>
                            </TR>
                        </TABLE>
                    </td>
                </tr>
                <tr>                    
                    <td colspan="3">                        
                        <TABLE id="dataTable2">
                            <TR>
                                <TD><INPUT type="checkbox" name="chk"/></TD>
                                <TD><INPUT placeholder="DESCRIPTION" type="text" name="prodec[]"/></TD>
                                <TD><INPUT placeholder="NO. OF PACKAAGE" type="text" name="pronopkt[]"/></TD>
                                <TD><INPUT placeholder="ACTUAL WEIGHT" type="text" name="proactwt[]"/></TD>
                                <TD><INPUT placeholder="CHARGED WEIGHT" type="text" name="prochrgwt[]"/></TD>
                                <TD><INPUT placeholder="LENGTH" type="text" name="prolength[]"/></TD>
                                <TD><INPUT placeholder="WIDTH" type="text" name="prowidth[]"/></TD>
                                <TD><INPUT placeholder="HEIGHT" type="text" name="proheight[]"/></TD>
                                <TD><INPUT placeholder="MODE OF PACKING" type="text" name="promopkt[]"/></TD>
                                <TD><INPUT placeholder="RATE PER PACKAGE" type="text" name="proratepkt[]"/></TD>
                                <TD><INPUT placeholder="RATE CHARGED" type="text" name="proratechrg[]"/></TD>                                
                            </TR>
                        </TABLE>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">
                        <div class="container">
                            <input type="submit" name="Create" />
                        </div>
                    </td>
                    <td></td>
                </tr>                                
            </table>
            <%
                } catch (Exception e) {

                }
            %>
        </form>    
    </body>
</html>
