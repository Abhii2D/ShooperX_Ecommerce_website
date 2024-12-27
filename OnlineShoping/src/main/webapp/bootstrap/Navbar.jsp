<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.*"%>
    <% 
    String name = auth.getName();
    String type = "ok";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="head.jsp" %>
<style>
.navbar-custom {
    background: linear-gradient(90deg, #004085, #0069d9);
    padding: 7px 20px;
    font-size: 16px;
    font-weight: 500;
}

.navbar-custom .navbar-brand {
    color: white !important;
    font-size: 20px;
    font-weight: bold;
    display: flex;
    align-items: center;
}

.navbar-custom .navbar-logo {
    width: 40px;
    height: auto;
    margin-right: 10px;
}

.navbar-custom .nav-link {
    color: white !important;
    margin-right: 20px;
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 16px;
    transition: color 0.3s, text-shadow 0.3s;
}

.navbar-custom .nav-link:hover {
    color: #ffc107 !important;
    text-shadow: 0 0 10px rgba(255, 193, 7, 0.8);
}

.custom-badge {
    font-size: 12px;
    background-color: #ffc107;
    color: black;
    border-radius: 50%;
    padding: 4px 8px;
    margin-left: 5px;
    font-weight: bold;
}

.navbar-custom .nav-link i {
    font-size: 18px;
}

.navbar-logo {
    height: 60px;
    width: auto;
    object-fit: contain;
}

.card-header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background-color: #f8f9fa;
    padding: 4px 0;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    z-index: 1000;
}

.category-links {
    display: flex;
    gap: 20px;
}

.category-links a {
    text-decoration: none;
    color: black;
    font-size: 16px;
    font-family: italic;
}

.category-links a:hover {
    text-decoration: underline;
}

.content {
    margin-top: 60px;
    padding: 20px;
}

.navbar-custom .dropdown-menu {
    border-radius: 8px;
    background-color: #f8f9fa;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 10px 0;
}

.navbar-custom .dropdown-item {
    color: #333;
    font-size: 16px;
    padding: 10px 20px;
    transition: background-color 0.3s, color 0.3s;
}

.navbar-custom .dropdown-item:hover {
    background-color: #007bff;
    color: white;
}

.navbar-custom .dropdown-item i {
    font-size: 18px;
    margin-right: 10px;
}

.navbar-custom .dropdown-menu .dropdown-item {
    display: flex;
    align-items: center;
    gap: 10px;
}

.navbar-custom .dropdown-toggle {
    padding-right: 20px;
}

.navbar-custom .dropdown-toggle:hover {
    color: #ffc107;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-custom fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <span><img src="bootstrap/shopperx.png" alt="" class="navbar-logo" ></span> ShopperX
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-home"></i> Home
                    </a>
                </li>
              <% if(auth != null){ %> 
                <li class="nav-item">
                    <a class="nav-link" href="card.jsp">
                        <i class="fas fa-shopping-cart"></i> Cart 
                        <span class="badge custom-badge">
                            ${card_list.size()}
                        </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp">
                        <i class="fas fa-box"></i> Order
                    </a>
                </li>
               <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-user-circle" style="font-size: 20px; margin-right: 8px;"></i>
                        <span id="userName"><%= name %></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="Profiles.jsp"><i class="fa fa-user-circle" style="font-size: 16px; margin-right: 8px;"></i>Profile</a></li>
                        <li><a class="dropdown-item" href="LogoutServlet"><i class="fa fa-sign-out-alt" style="font-size: 16px; margin-right: 8px;"></i>Logout</a></li>
                    </ul>
                </li>
               <% } else { %> 
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </li>
              <% } %> 
            </ul>
        </div>
    </div>
</nav>
<% if(con.equals("ok")) {%>
<div class="card-header" style="margin-top:63px">
    <div class="category-links">
        <a href="index.jsp">All</a>
        <a href="Filter.jsp?category=Fashion">Fashion</a>
        <a href="Filter.jsp?category=Mobile">Mobiles</a>
        <a href="Filter.jsp?category=Beauty">Beauty</a>
        <a href="Filter.jsp?category=Gadgets">Gadgets</a>
        <a href="Filter.jsp?category=Home Automation">Home Appliances</a>
        <a href="Filter.jsp?category=shoes">Shoes</a>
        <a href="#">Electronics</a>
    </div>
</div>
<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
<%@include file="footer.jsp" %>
</body>
</html>
