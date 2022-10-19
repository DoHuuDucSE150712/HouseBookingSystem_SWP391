<%-- 
    Document   : BillDetail
    Created on : Oct 12, 2022, 10:46:58 AM
    Author     : Admin
--%>

<%@page import="Model.BillDetail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="adminuser_style.css"/>
    </head>
    <body>
        <%
        BillDetail b = new BillDetail();
        if(request.getAttribute("bid") != null){
            b = (BillDetail) request.getAttribute("bid");
        }
        %>
        <div class="header_fixed">
<!--       <h1>Manage House</h1>
        <form action="mainController" method="get">
            Name : <input type="text" name="name" >
            <input type="submit" value="search" name="action">
        </form>-->
       
        
        <c:import url="Header_LoginedAdmin.jsp"></c:import>
            <table>
                <thead>
                    <tr>
                    <th>Bill_Detail_ID</th>
                    <th>Bill_ID</th>
                    <th>House_ID</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Note</th>
                    </tr>
                </thead>
                <tr>
                    <td><%=b.getBilldetailid() %></td>
                    <td><%=b.getBillid() %></td>
                    <td><%=b.getHouseid() %></td>
                    <td><%=b.getStartdate() %></td>
                    <td><%=b.getEnddate() %></td>
                    <td><%=b.getNote() %></td>
                </tr>
            </table>
            </div>
    </body>
</html>
