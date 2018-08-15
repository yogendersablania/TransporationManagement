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
                int type = Integer.parseInt(request.getParameter("flag"));
                String name = request.getParameter("name").toString().trim();
                String address = request.getParameter("address").toString().trim();
                String state = request.getParameter("state").toString().trim();
                String phone = request.getParameter("phone").toString().trim();
                String website = request.getParameter("website").toString().trim();
                String pass = request.getParameter("pass").toString().trim();
                String address2 = request.getParameter("address2").toString().trim();
                String landmark = request.getParameter("landmark").toString().trim();
                String country = request.getParameter("country").toString().trim();
                String mobile = request.getParameter("mobile").toString().trim();
                String gstin = request.getParameter("gstin").toString().trim();
                String address3 = request.getParameter("address3").toString().trim();
                String city = request.getParameter("city").toString().trim();
                String pin = request.getParameter("pin").toString().trim();
                String email = request.getParameter("email").toString().trim();
                String pan = request.getParameter("pan").toString().trim();

                Connection connection = null;
                String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
                String database = "smexpfrx_erp";
                String username = "smexpfrx_admin";
                String password = "Pass@123";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);

                if (type == 0) {
                    Statement statement = connection.createStatement();
                    String sqlString1 = "SELECT CONSIGNER_NAME FROM CONSIGNER WHERE CONSIGNER_NAME = '" + name + "'";
                    statement.executeQuery(sqlString1);
                    ResultSet rs = statement.getResultSet();
                    while (rs.next()) {
                        String consigner_name = rs.getString("CONSIGNER_NAME").toString();

                        if (consigner_name.equals(name) || consigner_name == name) {
                            RequestDispatcher view = request.getRequestDispatcher("consigner_entry.jsp");
                            request.setAttribute("flag", true);
                            view.forward(request, response);
                            connection.close();
                        } else {
                            String sqlString2 = "INSERT INTO CONSIGNER (CONSIGNER_NAME, CONSIGNER_ADDRESS1, CONSIGNER_ADDRESS2, CONSIGNER_ADDRESS3, CONSIGNER_LANDMARK, CONSIGNER_CITY, CONSIGNER_STATE, CONSIGNER_COUNTRY, CONSIGNER_PIN, CONSIGNER_PHONE, CONSIGNER_MOBILE, CONSIGNER_EMAIL, CONSIGNER_WEBSITE, CONSIGNER_GSTIN, CONSIGNER_PAN) VALUES ( '" + name + "','" + address + "','" + address2 + "','" + address3 + "','" + landmark + "','" + city + "','" + state + "','" + country + "','" + pin + "','" + phone + "','" + mobile + "','" + email + "','" + website + "','" + gstin + "','" + pan + "'";
                            statement.executeQuery(sqlString2);

                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_entry.jsp");
                            request.setAttribute("flag", true);
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    }
                } else {
                    Statement statement = connection.createStatement();
                    String sqlString1 = "SELECT CONSIGNEE_NAME FROM CONSIGNEE WHERE CONSIGNEE_NAME = '" + name + "'";
                    statement.executeQuery(sqlString1);
                    ResultSet rs = statement.getResultSet();
                    while (rs.next()) {
                        String consigner_name = rs.getString("CONSIGNER_NAME").toString();

                        if (consigner_name.equals(name) || consigner_name == name) {
                            RequestDispatcher view = request.getRequestDispatcher("consignee_entry.jsp");
                            request.setAttribute("flag", true);
                            view.forward(request, response);
                            connection.close();
                        } else {
                            String sqlString2 = "INSERT INTO CONSIGNEE (CONSIGNEE_NAME, CONSIGNEE_ADDRESS1, CONSIGNEE_ADDRESS2, CONSIGNEE_ADDRESS3, CONSIGNEE_LANDMARK, CONSIGNEE_CITY, CONSIGNEE_STATE, CONSIGNEE_COUNTRY, CONSIGNEE_PIN, CONSIGNEE_PHONE, CONSIGNEE_MOBILE, CONSIGNEE_EMAIL, CONSIGNEE_WEBSITE, CONSIGNEE_GSTIN, CONSIGNEE_PAN) VALUES ( '" + name + "','" + address + "','" + address2 + "','" + address3 + "','" + landmark + "','" + city + "','" + state + "','" + country + "','" + pin + "','" + phone + "','" + mobile + "','" + email + "','" + website + "','" + gstin + "','" + pan + "'";
                            statement.executeQuery(sqlString2);

                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_entry.jsp");
                            request.setAttribute("flag", true);
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    }
                }
            } catch (Exception e) {
                out.println(e.getMessage().toString());
            }
        %>
    </body>
</html>