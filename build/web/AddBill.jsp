<%-- 
    Document   : AddBill
    Created on : Oct 12, 2022, 7:59:11 AM
    Author     : Admin
--%>

<%@page import="Model.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom admin css file link  -->
   <link rel="stylesheet" href="admin_style.css">
   <!-- Boostrap 5 -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>  

   <!-- jquery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <%
        Bill b = new Bill();
            if (request.getAttribute("bill") != null) {
                b = (Bill) request.getAttribute("bill");
            }
        %>
        <header>
            <c:import url="Header_LoginedAdmin.jsp"></c:import>
        </header>
        <section class="add-products">
      <h1 class="title">Add Bill</h1>

      <form action="AddBillServlet" method="post" >
          <h2>Bill_ID</h2>
        <input
          type="text"
          name="billid"
          value="<%=b.getBillid()+1 %>"
          class="box"
          placeholder="Enter BillID"
          required=""
        />
        <h2>Date</h2>
        <input
          type="date"
          name="date"
          class="box"
          required=""
        />
        <h2>Total</h2>
        <input
          type="number"
          name="total"
          class="box"
          placeholder="Enter Total"
          required=""
        />
        <input
          type="number"
          name="status"
          class="box"
          placeholder="Enter Review"
          hidden="true"
        />
        <h2>User_ID</h2>
        <input
          type="text"
          name="userid"
          class="box"
          placeholder="Enter UserID"
          required=""
        />
        <h2>House_ID</h2>
        <input
          type="number"
          name="houseid"
          class="box"
          placeholder="Enter HouseID"
        />
        <h2>Start Date</h2>
        <input
          type="date"
          name="startdate"
          class="box"
          placeholder="Enter Start Date"
        />
        <h2>End Date</h2>
        <input
          type="date"
          name="enddate"
          class="box"
          placeholder="Enter End Date"
        />
        <h2>Note</h2>
        <input
          type="text"
          name="note"
          class="box"
          placeholder="Enter Note"
        />
        <input class="Update-btn" type="submit" value="   Add   " name="Add Bill" />
      </form>
    </section>
    </body>
</html>
