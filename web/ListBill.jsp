<%-- 
    Document   : ListBill
    Created on : Oct 11, 2022, 9:49:23 PM
    Author     : Admin
--%>

<%@page import="Model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        List<Bill> list = new ArrayList<Bill>();
        if(request.getAttribute("BillList") != null){
            list = (List<Bill>) request.getAttribute("BillList");
        }
        %>
        <div class="header_fixed">
<!--       <h1>Manage House</h1>
        <form action="mainController" method="get">
            Name : <input type="text" name="name" >
            <input type="submit" value="search" name="action">
        </form>-->
       
        
        <c:import url="Header_LoginedAdmin.jsp"></c:import>
        <form action="SearchBillServlet" class="search-bar-container"  method="post"  >
        <input style="height: 60px;font-size: 40px;" type="text" name="search" id="search-bar" placeholder="Search here..."">
        <button class="fas fa-search" style="height: 60px; font-size: 40px; background-color: #fff" value="search" type="submit"></button>
        </form>
            <table>
                <thead>
                    <tr>
                    <th>Bill_ID</th>
                    <th>Date</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>User_ID</th>
                    <th>Action</th>
                    </tr>
                </thead>
            <%
                for(Bill b : list){
                %>
                <tr>
                    <td><a href="getBillServlet?id=<%=b.getBillid() %>"><%=b.getBillid() %></a></td>
                    <td><%=b.getDate() %></td>
                    <td><%=b.getTotal() %></td>
                    <td><%=b.getStatus() %></td>
                    <td><%=b.getUserid() %></td>
                    <td>
                            <span class="action_btn">
                                <a href="NextEditBillServlet?id=<%=b.getBillid() %>">Update</a>
                                <a href="DeleteBillServlet?id=<%=b.getBillid() %>">Delete</a>
                                <a href="AddBill.jsp">Add</a>
                            </span>
                                </td>
                </tr>
                <%
                }
                %>
            </table>
            </div>
    </body>
</html>
