<%-- 
    Document   : consigner_edit_validation
    Created on : 1 Sep, 2018, 9:34:29 PM
    Author     : yogen
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String type = request.getParameter("flag").toString().trim();
            String id = request.getParameter("id").toString().trim();
            String page1 = request.getParameter("page").toString().trim();
            String name = request.getParameter("name").toString().trim();
            String mobile = request.getParameter("mobile").toString().trim();
            String email = request.getParameter("email").toString().trim();
            String website = request.getParameter("website").toString().trim();
            String gstin = request.getParameter("gstin").toString().trim();
            String pan = request.getParameter("pan").toString().trim();

            if (type.equals("consigner")) {
                try {
                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString = "UPDATE consigner SET consigner_name=?, consigner_mobile=?, consigner_email=?, consigner_website=?, consigner_gstin=?, consigner_pan=? WHERE consigner_id = " + id;
                    PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, mobile);
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, website);
                    preparedStatement.setString(5, gstin);
                    preparedStatement.setString(6, pan);

                    if (preparedStatement.executeUpdate() > 0) {
                        if (page1.equals("LIST")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_list.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_edit_search.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }

                    } else {
                        if (page1.equals("LIST")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_list.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_edit_search.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    }

                } catch (Exception e) {
                    String Msg = e.getMessage().toString();
                    if (page1.equals("LIST")) {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_list.jsp");
                        request.setAttribute("Message", "User successfully edited in system.");
                        requestDispatcher.forward(request, response);
                    } else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consigner_edit_search.jsp");
                        request.setAttribute("Message", "User successfully edited in system.");
                        requestDispatcher.forward(request, response);
                    }
                }
            } else if (type.equals("consignee")) {
                try {
                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString = "UPDATE consignee SET consignee_name=?, consignee_mobile=?, consignee_email=?, consignee_website=?, consignee_gstin=?, consignee_pan=? WHERE consignee_id = " + id;
                    PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, mobile);
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, website);
                    preparedStatement.setString(5, gstin);
                    preparedStatement.setString(6, pan);

                    if (preparedStatement.executeUpdate() > 0) {
                        if (page1.equals("LIST")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_list.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_edit_search.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    } else {
                        if (page1.equals("LIST")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_list.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_edit_search.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    }

                } catch (Exception e) {
                    String Msg = e.getMessage().toString();
                    if (page1.equals("LIST")) {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_list.jsp");
                        request.setAttribute("Message", "User successfully edited in system.");
                        requestDispatcher.forward(request, response);
                    } else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignee_edit_search.jsp");
                        request.setAttribute("Message", "User successfully edited in system.");
                        requestDispatcher.forward(request, response);
                    }
                }
            } else {
                try {
                    Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
                    String sqlString = "UPDATE customer SET customer_name=?, customer_mobile=?, customer_email=?, customer_website=?, customer_gstin=?, customer_pan=? WHERE customer_id = " + id;
                    PreparedStatement preparedStatement = connection.prepareStatement(sqlString);
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, mobile);
                    preparedStatement.setString(3, email);
                    preparedStatement.setString(4, website);
                    preparedStatement.setString(5, gstin);
                    preparedStatement.setString(6, pan);

                    if (preparedStatement.executeUpdate() > 0) {
                        if (page1.equals("LIST")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_edit_search.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    } else {
                        if (page1.equals("LIST")) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_edit_search.jsp");
                            request.setAttribute("Message", "User successfully edited in system.");
                            requestDispatcher.forward(request, response);
                            connection.close();
                        }
                    }

                } catch (Exception e) {
                    String Msg = e.getMessage().toString();
                    if (page1.equals("LIST")) {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list.jsp");
                        request.setAttribute("Message", "User successfully edited in system.");
                        requestDispatcher.forward(request, response);
                    } else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_edit_search.jsp");
                        request.setAttribute("Message", "User successfully edited in system.");
                        requestDispatcher.forward(request, response);
                    }
                }
            }
        %>
    </body>
</html>
