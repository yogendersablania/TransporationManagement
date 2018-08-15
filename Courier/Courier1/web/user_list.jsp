<%-- 
    Document   : user_list
    Created on : Jul 22, 2018, 7:11:04 PM
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
        <title>EMPLOYEE LIST</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <br/>
        <table align="center" width="90%">
            <tr><td colspan="7" align="center"><h1><b><a href="">Download List</a></b></h1></td></tr>
            <tr><td colspan="7" align="center"><h1><b>EMPLOYEE LIST</b></h1></td></tr>
                            <%
                                try {
                            %>
            <tr>
                <td><h3>ID</h3></td>
                <td><h3>NAME</h3></td>
                <td><h3>PASSWORD</h3></td>
                <td><h3>ADDRESS</h3></td>
                <td><h3>STATE</h3></td>                
                <td><h3>CITY</h3></td>
                <td><h3>PIN</h3></td>
            </tr>        
            <%
                DB_connection conn = new DB_connection();
                /*
                Connection connection = null;
                String url = "jdbc:mysql://209.99.16.57:3306/smexpfrx_erp";
                String username = "smexpfrx_admin";
                String password = "Pass@123";
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(url, username, password);
                 */
                Statement statement = conn.connection.createStatement();
                String sqlString = "SELECT * FROM employees ORDER BY employees_id";
                statement.executeQuery(sqlString);
                ResultSet rs = statement.getResultSet();

                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt("employees_id")%></td>
                <td><%=rs.getString("employees_name")%></td>
                <td><%=rs.getString("employees_password")%></td>
                <td><%=rs.getString("employees_address")%></td>
                <td><%=rs.getString("employees_city")%></td>
                <td><%=rs.getString("employees_state")%></td>
                <td><%=rs.getString("employees_zip_code")%></td>
            </tr>
            <tr>
                <td colspan="7">
                    <%
                            }
                            rs.close();
                            statement.close();
                            conn.connection.close();
                        } catch (Exception e) {
                            out.println("Error : " + e.getMessage());
                        }
                    %>
                </td>
            </tr>
        </table>
    </body>
</html>
