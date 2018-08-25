<%@page import="com.smexpress.in.Consigner_List_Pdf"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>SM EXPRESS</title>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="css/menu.css">

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/function.js"></script>

    </head>
    <body>
        <div style="background:#0099cc; font-size:22px; text-align:center; color:#FFF; font-weight:bold; height:50px; padding-top:20px;"><a class="logo" href=""><img src="" alt=""></a>TRANSPORT OPERATING SYSTEM</div>
        <div style="background:#0099cc; font-size:13px; text-align:center; color:#FFF; font-weight:bold; height:30px; padding-top:10px;"><b>User Name: <%=session.getAttribute("username")%> | Login Time: <%=session.getAttribute("logintime")%></b></div>
        <div id="wrap">
            <header>                
                <div class="inner relative">
                    <a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
                    <nav id="navigation">
                        <ul id="main-menu">
                            <li class="current-menu-item"><a href="">Home</a></li>
                            <li class="parent">
                                <a href="">Consignment Note</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/consignment_entry.jsp"><i class="icon-wrench"></i>CN ENTRY</a></li>
                                    <li><a href="${pageContext.request.contextPath}/consignment_edit.jsp"><i class="icon-credit-card"></i>Alter</a></li>
                                    <li><a href="${pageContext.request.contextPath}/consignment_delete.jsp"><i class="icon-gift"></i>Delete</a></li>
                                    <li>
                                        <a class="parent" href="#"><i class="icon-file-alt"></i>Reports</a>
                                        <ul class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/consignment_list.jsp">CONSIGNMENT LIST</a></li>
                                            <li><a href="">Report 2</a></li>
                                            <li><a href="">Report 3</a></li>
                                            <li><a href="">Report 4</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <!--
                            <li class="parent">
                                <a href="">Vehicle Hire Note</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/vhc_entry.jsp"><i class="icon-wrench"></i>Create</a></li>
                                    <li><a href="${pageContext.request.contextPath}/vhc_edit.jsp"><i class="icon-credit-card"></i>Alter</a></li>
                                    <li><a href="${pageContext.request.contextPath}/vhc_delete.jsp"><i class="icon-gift"></i>Delete</a></li>
                                    <li>
                                        <a class="parent" href="#"><i class="icon-file-alt"></i>Reports</a>
                                        <ul class="sub-menu">
                                            <li><a href="">Report 1</a></li>
                                            <li><a href="">Report 2</a></li>
                                            <li><a href="">Report 3</a></li>
                                            <li><a href="">Report 4</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            -->
                            <li class="parent">
                                <a href="">Customer</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/consigner_entry.jsp">New Consigner</a></li>
                                    <li><a href="${pageContext.request.contextPath}/consignee_entry.jsp">New Consignee</a></li>
                                    <li><a href="${pageContext.request.contextPath}/customer_edit.jsp">Alter</a></li>
                                    <li><a href="${pageContext.request.contextPath}/customer_delete.jsp">Delete</a></li>
                                    <li>
                                        <a class="parent" href="#"><i class="icon-file-alt"></i>Reports</a>
                                        <ul class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/consigner_list.jsp">CONSIGNER LIST</a></li>
                                            <li><a href="${pageContext.request.contextPath}/consignee_list.jsp">CONSIGNEE LIST</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <!--
                            <li class="parent">
                                <a href="">Vendor</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/vendor_entry.jsp"><i class="icon-wrench"></i>Create</a></li>
                                    <li><a href="${pageContext.request.contextPath}/vendor_edit.jsp"><i class="icon-credit-card"></i>Alter</a></li>
                                    <li><a href="${pageContext.request.contextPath}/vendor_delete.jsp"><i class="icon-gift"></i>Delete</a></li>
                                    <li>
                                        <a class="parent" href="#"><i class="icon-file-alt"></i>Reports</a>
                                        <ul class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/viewReport.jsp">Consigner list</a></li>
                                            <li><a href="">Report 2</a></li>
                                            <li><a href="">Report 3</a></li>
                                            <li><a href="">Report 4</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            -->
                            <li class="parent">
                                <a href="">User</a>
                                <ul class="sub-menu">
                                    <li><a href="${pageContext.request.contextPath}/user_entry.jsp">Create User</a></li>
                                    <li><a href="${pageContext.request.contextPath}/"></i>Edit User</a></li>
                                    <li><a href="${pageContext.request.contextPath}/"></i>Delete User</a></li>
                                    <li>
                                        <a class="parent" href="#"><i class="icon-file-alt"></i>Reports</a>
                                        <ul class="sub-menu">
                                            <li><a href="${pageContext.request.contextPath}/user_list.jsp">User List</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class="current-menu-item"><a href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>                            
                        </ul>                        
                    </nav>
                    <div class="clear"></div>
                </div>
            </header>	
        </div>    
    </body>
</html>