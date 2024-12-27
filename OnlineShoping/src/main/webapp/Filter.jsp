<%@page import="java.util.*" %>
<%@page import="com.*"%>
<%@page import="SqlConnection.dbcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String selectedCat = request.getParameter("category");
if (selectedCat == null) {
    selectedCat = "Fashion"; // Default category if none is selected
}
String con = "ok";
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);

}
ProductDao pd = new ProductDao(dbcon.getConnection());
List <Product> products =pd.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to shopping Cart!</title>

<%@include file="bootstrap/head.jsp"%>
</head>
<body>

	<%@include file="bootstrap/Navbar.jsp"%>
	
	
	<div class="container-fluid " style="padding-left:50px; margin-top: 120px;">
    
    <div class="row" > <!-- Removed container padding between rows -->
        <%
        
        if(!products.isEmpty()){
            for(Product p : products){
            	if (p.getCategoy().equalsIgnoreCase(selectedCat)) {
        %>
        <div class="col-md-2 my-3" style="padding-left: 5px; padding-right: 5px; margin:5px;"> <!-- Increased gap by changing my-2 to my-3 -->
            <div class="card" style="width: 100%; margin-bottom: 2.0rem;"> <!-- Increased margin between cards -->
                <img class="card-img-top" style="width: 100%; height: 8rem;" src="image/<%=p.getImage() %>" alt="card image"> <!-- Reduced image height -->
                <div class="card-body" style="padding: 0.75rem;"> <!-- Slightly reduced padding inside the card -->
                    <h5 class="card-title" style="font-size: 16px;"> <%= p.getName() %></h5>
                    <h6 class="price" style="font-size: 14px;">Price : <%=p.getPrice() %></h6>
                    <h6 class="category" style="font-size: 14px;">Category : <%= p.getCategoy() %></h6>
                    <div class="mt-3 d-flex justify-content-between" style="gap: 10px;">
                        <a href="AddToCard?id=<%=p.getId() %>" class="btn btn-dark btn-sm" style="font-size: 14px;">Add to Cart</a>
                        <a href="OrderNow?id=<%=p.getId() %>" class="btn btn-primary btn-sm" style="font-size: 14px;">Buy Now</a>

                    </div>
                </div>
            </div>
        </div>
        <%
            }}
        }
        %>
    </div>
</div>
















	<!-- bootstrap Script -->
	<%@include file="bootstrap/footer.jsp"%>
</body>
</html>