<%-- 
    Document   : customer_validation
    Created on : Jul 21, 2018, 10:34:16 PM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Validation</title>
    </head>
    <body>
        <%
            try {
                String cnnumber = request.getParameter("cnnumber").toString().trim();
                String consigner = request.getParameter("consigner").toString().trim();
                String consignee = request.getParameter("consignee").toString().trim();
                String risk = request.getParameter("risk").toString().trim();
                String date = request.getParameter("date").toString().trim();
                String paybasis = request.getParameter("paybasis").toString().trim();
                String mod = request.getParameter("mod").toString().trim();
                String servicetype = request.getParameter("servicetype").toString().trim();
                String gstpaidby = request.getParameter("gstpaidby").toString().trim();

                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();

                Statement statement1 = connection.createStatement();
                Statement statement2 = connection.createStatement();
                String sqlString1 = "SELECT COUNT(*) FROM consignment WHERE consignment_no = '" + cnnumber + "'";
                String sqlString2 = "SELECT COUNT(*) FROM consignment";
                statement1.executeQuery(sqlString1);
                statement2.executeQuery(sqlString2);
                ResultSet rs1 = statement1.getResultSet();
                ResultSet rs2 = statement2.getResultSet();
                rs1.next();
                rs2.next();
                int rowscount = rs1.getInt(1);
                int id = rs2.getInt(1) + 1;
                if (rowscount == 0) {
                    rowscount++;
                    String sqlString3 = "INSERT INTO consignment(consignment_id, consignment_no, consignment_consignee, consignment_risk, consignment_date, consignment_pay_basis, consignment_mod, consignment_consigner, consignment_service_type) VALUES ( '" + id + "','" + cnnumber + "','" + consignee + "','" + risk + "','" + date + "','" + paybasis + "','" + mod + "','" + consigner + "','" + servicetype + "')";
                    Statement statement3 = connection.createStatement();
                    statement3.executeUpdate(sqlString3);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignment_entry.jsp");
                    request.setAttribute("Message", "Transaction Sucessfully Posted.");
                    requestDispatcher.forward(request, response);
                    connection.close();
                } else {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignment_entry.jsp");
                    request.setAttribute("Message", "There is some error in transaction posting.");
                    requestDispatcher.forward(request, response);
                    connection.close();
                }
            } catch (Exception e) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignment_entry.jsp");
                request.setAttribute("Message", e.getMessage());
                out.println(e.getMessage().toString());
                requestDispatcher.forward(request, response);
            }
        %>
    </body>
</html>