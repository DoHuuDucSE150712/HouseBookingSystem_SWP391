<%-- 
    Document   : user
    Created on : Oct 18, 2022, 1:16:16 PM
    Author     : Asus
--%>

<%@page import="Model.House"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        List<House> list = new ArrayList<House>();
        if(request.getAttribute("HouseList") != null){
            list = (List<House>) request.getAttribute("HouseList");
        }
        %>
        <table border="1">
            <thead>
                    <tr>
                    <th>Where to</th>
                    <th>How many</th>
                    <th>Arrivals</th>
                    <th>Leaving</th>
                    <th>Action</th>
                    </tr>
                </thead>
                <%
                for(House h : list){
                %>
                <tr>
                    <td><%=h.getHouseid() %></td>
                    <td><%=h.getHousename() %></td>
                    <td><%=h.getPostdate() %></td>
                    <td><%=h.getReview() %></td>
                    <td>
                            <span class="action_btn">
                                <a href="GetBillServlet">BOOK</a>
                            </span>
                </tr>
                </tr>
                 <%
                }
                %>
        </table>

    </body>
</html>
