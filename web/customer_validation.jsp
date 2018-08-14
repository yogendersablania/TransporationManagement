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
                String type = request.getParameter("flag").toString().trim();
                String name = request.getParameter("name").toString().trim();
                String address1 = request.getParameter("address1").toString().trim();
                String address2 = request.getParameter("address2").toString().trim();
                String address3 = request.getParameter("address3").toString().trim();
                String landmark = request.getParameter("landmark").toString().trim();
                String city = request.getParameter("city").toString().trim();
                String state = request.getParameter("state").toString().trim();
                String country = request.getParameter("country").toString().trim();
                String pin = request.getParameter("pin").toString().trim();
                String phone = request.getParameter("phone").toString().trim();
                String mobile = request.getParameter("mobile").toString().trim();
                String email = request.getParameter("email").toString().trim();
                String website = request.getParameter("website").toString().trim();
                String gstin = request.getParameter("gstin").toString().trim();
                String pan = request.getParameter("pan").toString().trim();
                    
                Connection connection = com.smexpress.in.Connection_Manager.get_Connection();

                if (type.equals("consigner")) {
                    Statement statement1 = connection.createStatement();
                    Statement statement2 = connection.createStatement();
                    String sqlString1 = "SELECT COUNT(*) FROM consigner WHERE consigner_name = '" + name + "'";
                    String sqlString2 = "SELECT COUNT(*) FROM consigner";
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
                        String sqlString3 = "INSERT INTO consigner(consigner_id, consigner_name, consigner_address1, consigner_address2, consigner_address3, consigner_landmark, consigner_city, consigner_state, consigner_country, consigner_pin, consigner_phone, consigner_mobile, consigner_email, consigner_website, consigner_gstin, consigner_pan) VALUES ( '" + id + "','" + name + "','" + address1 + "','" + address2 + "','" + address3 + "','" + landmark + "','" + city + "','" + state + "','" + country + "','" + pin + "','" + phone + "','" + mobile + "','" + email + "','" + website + "','" + gstin + "','" + pan + "')";
                        Statement statement3 = connection.createStatement();
                        statement3.executeUpdate(sqlString3);
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_entry.jsp");
                        request.setAttribute("Message", "Transaction sucessfully posted.");
                        requestDispatcher.forward(request, response);
                        connection.close();
                    } else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_entry.jsp");
                        request.setAttribute("Message", "There is some error in transaction posting.");
                        requestDispatcher.forward(request, response);
                        connection.close();
                    }
                } else {
                    Statement statement1 = connection.createStatement();
                    Statement statement2 = connection.createStatement();
                    String sqlString1 = "SELECT COUNT(*) FROM consignee WHERE consignee_name = '" + name + "'";
                    String sqlString2 = "SELECT COUNT(*) FROM consignee";
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
                        String sqlString3 = "INSERT INTO consignee (consignee_id, consignee_name, consignee_address1, consignee_address2, consignee_address3, consignee_landmark, consignee_city, consignee_state, consignee_country, consignee_pin, consignee_phone, consignee_mobile, consignee_email, consignee_website, consignee_gstin, consignee_pan) VALUES ( '" + id + "','" + name + "','" + address1 + "','" + address2 + "','" + address3 + "','" + landmark + "','" + city + "','" + state + "','" + country + "','" + pin + "','" + phone + "','" + mobile + "','" + email + "','" + website + "','" + gstin + "','" + pan + "')";
                        Statement statement3 = connection.createStatement();
                        statement3.executeUpdate(sqlString3);
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_entry.jsp");
                        request.setAttribute("Message", "Transaction sucessfully posted.");
                        requestDispatcher.forward(request, response);
                        connection.close();
                    } else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_entry.jsp");
                        request.setAttribute("Message", "There is some error in transaction posting.");
                        requestDispatcher.forward(request, response);
                        connection.close();
                    }
                }
            } catch (Exception e) {
                out.println(e.getMessage().toString());
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_entry.jsp");
                request.setAttribute("Message", e.getMessage());
            }
        %>
    </body>
</html>