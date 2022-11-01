<%-- 
    Document   : Housepage
    Created on : Oct 28, 2022, 9:40:11 PM
    Author     : Admin
--%>
<%@page import="Model.House"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            />

        <!-- custom css file link  -->
        <link href="css/housepage.css" rel="stylesheet" type="text/css"/>
    </head>


    <body>
        <header>

            <a href="Index.jsp" class="logo"><span>H</span>ouse<span>B</span>ooking</a>

            <nav class="navbar">
                <a href="Index.jsp">home</a>
                <a href="Index.jsp">book</a>
                <a href="Index.jsp">room</a>
                <a href="Index.jsp">services</a>
                <a href="Index.jsp">gallery</a>
                <a href="Index.jsp">review</a>
                <a href="Index.jsp">contact</a>
            </nav>
            ${username}
            <div class="icons">
                <i class="fas fa-search" id="search-btn"></i>
                <a href="login.jsp">
                    <i class="fas fa-user" id=""></i>
                </a>
            </div>

            <form action="" class="search-bar-container">
                <input type="search" id="search-bar" placeholder="search here...">
                <label for="search-bar" class="fas fa-search"></label>
            </form>

        </header>

        <div class="hotelContainer">
            <div class="hotelWrapper">
                <button class="bookNow">Reserve or Book</button>
                <div class="hotelTitle">${house.housename}</div>
                <div class="hotelAddress">
                    <i class="fas fa-map-marker-alt"></i>
                    <span>${house.address}</span>
                </div>
                <span class="hotelDistance">Check-in Date : ${house.postdate}</span>
                <span class="hotelPriceHighlight">${house.houseprice}$</span>
                <div class="hotelImage">
                    <c:forEach items="${listImage}" var="image" >
                        <img src="${image.imglink}" alt="" class="hotelImg" />
                    </c:forEach>


                </div>
                <div class="hotelDetails">
                    <div class="hotelDetailTexts">
                        <h1 class="hotelTitle">Description</h1>
                        <p class="hotelDesc">
                            ${house.description}$
                        </p>
                    </div>
                    <div class="hotelDetailsPrice">
                        <h1>Rent For</h1>
                        <h2>
                            <b>${house.houseprice}</b>
                        </h2>
                        <form action="housepage" method="post">
                            <input type="text" value="${house.houseid}" hidden="" name="houseid" >
                            startdate:  <input required="" type="date" name="startdate" >
                            enddate:  <input required="" type="date" name="enddate" >
                            note: <input type="text" name="note" >
                            <button type="submit" >Reserve or Book Now</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <section class="comments-container">
            <h1 class="heading" style="font-size: 40px">Leave us your comment</h1>
            <%
        String username = (String)session.getAttribute("username");
        if(username == null){
            %>
            <p class="comment-title">Your comments on the posts</p>
            <div class="user-comments-container">
                <div class="show-comments">
                    <div class="post-title">
                        <span>Please Login to Comment</span>
                        <a href="Login.jsp" class="inline-btn">Login</a>
                    </div>
                </div>
            </div>
            <%
                    }else{
            %>

            <p class="comment-title">Your comments on the posts</p>
            <div class="user-comments-container">
                <div class="show-comments">
                    <div class="post-title">
                        from : <span></span>
                        <a href="">view post</a>
                    </div>
                    <form action="AddCommentServlet" method="post">
                        <div class="post-title">Name: </div>
                        <input
                            class="comment-box"
                            value=""
                            type="text"
                            name="userid"
                            hidden="true"
                            />
                        <div class="post-title">House:</div>
                        <input
                            class="comment-box"
                            type="number"
                            name="houseid"
                            value=""
                            />
                        <div class="post-title">Date:</div>
                        <input
                            class="comment-box"
                            type="date"
                            name="date"
                            />
                        <div class="post-title">Comment:</div>
                        <input
                            class="comment-box"
                            type="text"
                            name="comment"
                            />
                        <!--            <button
                                      type="submit"
                                      class="inline-delete-btn"
                                      name="open_edit_box"
                                    >
                                      edit 
                                    </button>-->
                        <button
                            type="submit"
                            class="inline-option-btn"
                            name="Add"
                            value="addComment"
                            >Add 
                        </button>
                    </form>
                </div>
            </div>     
        </section>
        <%
}
        %>
        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h3>about us</h3>
                    <p>We are team ... This is my our project for SWP391</p>
                </div>
                <div class="box">
                    <h3>locations</h3>
                    <a href="#">Ha Long</a>
                    <a href="#">Da Nang</a>
                    <a href="#">Con Dao</a>
                    <a href="#">Da Lat</a>
                    <a href="#">Nha Trang</a>
                    <a href="#">SaPa</a>
                </div>
                <div class="box">
                    <h3>quick links</h3>
                    <a href="#home">home</a>
                    <a href="#book">book</a>
                    <a href="#packages">packages</a>
                    <a href="#services">services</a>
                    <a href="#gallery">gallery</a>
                    <a href="#review">review</a>
                    <a href="#contact">contact</a>
                </div>
                <div class="box">
                    <h3>follow us</h3>
                    <a href="https://www.facebook.com/huuduc.devil">facebook</a>
                    <a href="#">instagram</a>
                    <a href="#">twitter</a>
                    <a href="#">linkedin</a>
                </div>

            </div>

            <h1 class="credit"> created by <span> Trung, Đức, Hy, Nam, Kiệt </span> | SWP391 </h1>

        </section>


    </body>
    <script>
        var mess = '${mess}';
        if (mess != '') {
            alert(mess);
        }
    </script>
</html>
