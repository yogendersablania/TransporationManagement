<html>
    <body>
        <%
            try {

                String[] txt = request.getParameterValues("txt[]");
                String[] country = request.getParameterValues("country[]");
        %>

        <%=txt[1]%>
        <%=country[1]%>

        <%} catch (Exception e) {
        %>       
        <%=e.getMessage().toString()%>
        <% }%>
    </body>
</html>



