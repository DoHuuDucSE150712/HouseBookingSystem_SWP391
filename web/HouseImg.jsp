<%-- 
    Document   : HouseImg
    Created on : Oct 12, 2022, 12:05:49 PM
    Author     : Admin
--%>

<%@page import="Model.HouseImg"%>
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
        HouseImg h = new HouseImg();
        if(request.getAttribute("hid") != null){
            h = (HouseImg) request.getAttribute("hid");
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
                    <th>Img_ID</th>
                    <th>Img_Link</th>
                    <th>House_ID</th>
                    <th>Action</th>
                    </tr>
                </thead>
                <tr>
                    <td><%=h.getImgid() %></td>
                    <td><%=h.getImglink() %></td>
                    <td><%=h.getHouseid() %></td>
                    <td>
                            <span class="action_btn">
                                <a href="NextEditBillServlet?id=<%=h.getImgid() %>">Update</a>
                                <a href="DeleteBillServlet?id=<%=h.getImgid() %>">Delete</a>
                                <a href="AddBill.jsp">Add</a>
                            </span>
                    </td>
                </tr>
            </table>
            </div>
    </body>
</html>
