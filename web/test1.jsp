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
        <form name="cnentry" action="test2.jsp" method="post" onsubmit="validateMyForm();">
            <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
            <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />
            <br/><br/><b>PRODUCT DETAIL</b>
            <TABLE id="dataTable">
                <TR>
                    <TD><INPUT type="checkbox" name="chk"/></TD>
                    <TD><INPUT placeholder="DESCRIPTION" type="text" name="prodec"/></TD>
                    <TD><INPUT placeholder="NO. OF PACKAAGE" type="text" name="insconumber"/></TD>
                </TR>
            </TABLE>
            <INPUT type="submit" value="submit" />
        </form>    
    </body>
</html>
