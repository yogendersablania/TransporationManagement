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
                String date = request.getParameter("date").toString().trim();
                String customer = request.getParameter("customer").toString().trim();
                String consigner = request.getParameter("consigner").toString().trim();
                String consignee = request.getParameter("consignee").toString().trim();
                String risk = request.getParameter("risk").toString().trim();
                String paybasis = request.getParameter("paybasis").toString().trim();
                String mod = request.getParameter("mod").toString().trim();
                String servicetype = request.getParameter("servicetype").toString().trim();
                String gstpaidby = request.getParameter("gstpaidby").toString().trim();

                String[] insconame = request.getParameterValues("insconame[]");
                String[] insconumber = request.getParameterValues("insconumber[]");
                String[] inscoamount = request.getParameterValues("inscoamount[]");
                String[] inscostartdate = request.getParameterValues("inscostartdate[]");
                String[] inscoenddate = request.getParameterValues("inscoenddate[]");
                String[] inscoremarks = request.getParameterValues("inscoremarks[]");

                String[] prodec = request.getParameterValues("prodec[]");
                String[] pronopkt = request.getParameterValues("pronopkt[]");
                String[] proactwt = request.getParameterValues("proactwt[]");
                String[] prochrgwt = request.getParameterValues("prochrgwt[]");
                String[] prolength = request.getParameterValues("prolength[]");
                String[] prowidth = request.getParameterValues("prowidth[]");
                String[] proheight = request.getParameterValues("proheight[]");
                String[] promopkt = request.getParameterValues("promopkt[]");
                String[] proratepkt = request.getParameterValues("proratepkt[]");
                String[] proratechrg = request.getParameterValues("proratechrg[]");
        %>    

        <%=cnnumber%><br/><br/>
        <%=date%><br/><br/>
        <%=customer%><br/><br/>
        <%=consigner%><br/><br/>
        <%=consignee%><br/><br/>
        <%=risk%><br/><br/>
        <%=paybasis%><br/><br/>
        <%=mod%><br/><br/>
        <%=servicetype%><br/><br/>
        <%=gstpaidby%><br/><br/>


        <%
            int i = 0;
            while (i < insconame.length) {
        %>
        <%=insconame[i]%><br/><br/>
        <%=insconumber[i]%><br/><br/>
        <%=inscoamount[i]%><br/><br/>
        <%=inscostartdate[i]%><br/><br/>
        <%=inscoenddate[i]%><br/><br/>
        <%=inscoremarks[i]%><br/><br/>
        <%
                i++;
            }
        %>

        <%
            int j = 0;
            while (j < insconame.length) {
        %>
        <%=prodec[j]%><br/><br/>
        <%=pronopkt[j]%><br/><br/>
        <%=proactwt[j]%><br/><br/>
        <%=prochrgwt[j]%><br/><br/>
        <%=prolength[j]%><br/><br/>
        <%=prowidth[j]%><br/><br/>
        <%=proheight[j]%><br/><br/>
        <%=promopkt[j]%><br/><br/>
        <%=proratepkt[j]%><br/><br/>
        <%=proratechrg[j]%><br/><br/>
        <%
                j++;
            }
        %>




        <%
        } catch (Exception e) {

        %>
        <%=e.getMessage()%>
        <%
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("consignment_entry1.jsp");
                request.setAttribute("Message", e.getMessage());
                out.println(e.getMessage().toString());
                requestDispatcher.forward(request, response);
            }
        %>
    </body>
</html>