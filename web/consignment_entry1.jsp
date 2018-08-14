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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSIGNMENT NOTE ENTRY</title>
        <SCRIPT language="javascript">
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
        </SCRIPT>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br/>
        <h1 align="center">CREATE CONSIGNER</h1>
        <%
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
        <form name="cnentry" action="consignment_validation.jsp" method="post" onsubmit="validateMyForm();">
            <table width="90%" align="center">
                <%if (request.getAttribute("Message") != null) {%>
                <tr><td colspan="3"><b><font color="blue"><%=request.getAttribute("Message")%></font></b></td></tr>
                            <%}%>   
                <tr>
                    <td width="33%">
                        <div class="container">
                            <label><b>CN NUMBER *</b></label>
                            <input type="text" placeholder="Enter CN NUMBER" name="cnnumber">
                        </div>
                    </td>
                    <td width="33%">
                        <div class="container">
                            <label><b>CONSIGNER *</b></label>
                            <select name="consigner" required>
                                <%
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("ID").toString()%>"><%=rs1.getString("CONSIGNER").toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>
                    <td width="33%">
                        <div class="container">
                            <label><b>CONSIGNEE *</b></label>
                            <select name="consignee" required>
                                <%
                                    while (rs2.next()) {
                                %>
                                <option value="<%=rs2.getString("ID").toString()%>"><%=rs2.getString("CONSIGNEE").toString()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </td>                   
                </tr>
                <tr>
                    <td>
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
                    <td>
                        <div class="container">
                            <label><b>DATE *</b></label>
                            <input type="date" placeholder="Enter DATE" name="date">
                        </div>
                    </td>
                    <td>
                        <div class="container">
                            <label><b>PAY BASIS *</b></label>
                            <select name="paybasis" required>
                                <option value="paid">PAID</option>
                                <option value="topay">TOPAY</option>
                                <option value="tobebilled">TO BE BILLED</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="container">
                            <label><b>MOD *</b></label>
                            <select name="mod" required>
                                <option value="air">AIR</option>
                                <option value="rail">RAIL</option>
                                <option value="road">ROAD</option>
                            </select>
                        </div>                        
                    </td>
                    <td>
                        <div class="container">
                            <label><b>SERVICE TYPE *</b></label>
                            <select name="servicetype" required>
                                <option value="AIR">AIR</option>
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
                    <td colspan="3">
                        <br/>
                        <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
                        <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />
                        <br/><br/><b>INSURANCE DETAIL</b>
                        <TABLE id="dataTable">
                            <TR>
                                <TD><INPUT type="checkbox" name="chk"/></TD>
                                <TD><INPUT placeholder="COMPANY NAME" type="text" name="insconame"/></TD>
                                <TD><INPUT placeholder="POLICY NUMBER" type="text" name="insconumber"/></TD>
                                <TD><INPUT placeholder="SUM INSURRED" type="text" name="inscoamount"/></TD>
                                <TD><INPUT placeholder="START DATE" type="date" name="inscostartdate"/></TD>
                                <TD><INPUT placeholder="ENDS DATE" type="date" name="inscoenddate"/></TD>
                                <TD><INPUT placeholder="REMARKS" type="text" name="inscoremarks"/></TD>
                            </TR>
                        </TABLE>
                    </td>
                </tr>
                <!--    For Product Detail     -->
                <tr>
                    <td colspan="3">
                        <br/>
                        <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
                        <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />
                        <br/><br/><b>PRODUCT DETAIL</b>
                        <TABLE id="dataTable">
                            <TR>
                                <TD><INPUT type="checkbox" name="chk"/></TD>
                                <TD><INPUT placeholder="DESCRIPTION" type="text" name="prodec"/></TD>
                                <TD><INPUT placeholder="NO. OF PACKAAGE" type="text" name="insconumber"/></TD>
                                <TD><INPUT placeholder="ACTUAL WEIGHT" type="text" name="inscoamount"/></TD>
                                <TD><INPUT placeholder="CHARGED WEIGHT" type="text" name="inscostartdate"/></TD>
                                <TD><INPUT placeholder="LENGTH" type="text" name="inscoenddate"/></TD>
                                <TD><INPUT placeholder="WIDTH" type="text" name="inscoremarks"/></TD>
                                <TD><INPUT placeholder="HEIGHT" type="text" name="inscoremarks"/></TD>
                                <TD><INPUT placeholder="MODE OF PACKING" type="text" name="inscoremarks"/></TD>
                                <TD><INPUT placeholder="RATE PER PACKAGE" type="text" name="inscoremarks"/></TD>
                                <TD><INPUT placeholder="RATE CHARGED" type="text" name="inscoremarks"/></TD>                                
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
        </form>    
    </body>
</html>
