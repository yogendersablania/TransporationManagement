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
                String cn = request.getParameter("cn").toString().trim();
                String consignee = request.getParameter("consignee").toString().trim();
                String risk = request.getParameter("risk").toString().trim();
                String date = request.getParameter("date").toString().trim();
                String paybasis = request.getParameter("paybasis").toString().trim();
                String mod = request.getParameter("mod").toString().trim();
                String consigner = request.getParameter("consigner").toString().trim();
                String servicetype = request.getParameter("servicetype").toString().trim();

                Connection connection = null;
                String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
                String database = "smexpfrx_erp";
                String username = "smexpfrx_admin";
                String password = "Pass@123";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);

                Statement statement = connection.createStatement();
                String sqlString1 = "SELECT CN_NO FROM CONSIGNMENT WHERE CN_NO = '" + cn + "'";
                statement.executeQuery(sqlString1);
                ResultSet rs = statement.getResultSet();
                while (rs.next()) {
                    String dbcn = rs.getString("CN_NO").toString();

                    if (dbcn.equals(cn) || dbcn == cn) {
                        RequestDispatcher view = request.getRequestDispatcher("consignment_entry.jsp");
                        request.setAttribute("flag", true);
                        view.forward(request, response);
                        connection.close();
                    } else {
                        String sqlString = "INSERT INTO CONSIGNMENT (CN_NO, CN_CONSIGNEE, CN_RISK, CN_DATE, CN_PAY_BASIS, CN_MOD, CN_CONSIGNER, CN_SERVICE_TYPE) VALUES ( '" + cn + "','" + consignee + "','" + risk + "','" + date + "','" + paybasis + "','" + mod + "','" + consigner + "','" + servicetype + "'";
                        statement.executeQuery(sqlString);

                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_entry.jsp");
                        request.setAttribute("flag", true);
                        requestDispatcher.forward(request, response);
                        connection.close();
                    }
                }
            } catch (Exception e) {
                out.println(e.getMessage().toString());
            }
        %>
    </body>
</html>