<%-- 
    Document   : viewReport
    Created on : 4 Aug, 2018, 5:15:21 PM
    Author     : Yogender
--%>

<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="com.smexpress.in.CommonInfo"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consigner List</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Connection connection = com.smexpress.in.Connection_Manager.get_Connection();
            CommonInfo commonInfo = new CommonInfo();

            try {
                // Loading the Jasper Report file from local file system\
                String jrxmlFile = commonInfo.File_Path + "\\consigner_list.jrxml";
                InputStream input = new FileInputStream(new File(jrxmlFile));

                // Generate the report
                JasperReport jasperReport = JasperCompileManager.compileReport(input);
                JasperPrint jasperPrint = JasperFillManager.fillReport(jrxmlFile, null, connection);

                // Export the report as a PDF
                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                session.setAttribute("Error : ", ex.getMessage());
            } finally {
                if (connection != null) {
                    connection.close();
                }
            }
        %>
    </body>
</html>
