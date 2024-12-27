<%@page import="com.*"%>
<%@page import="SqlConnection.dbcon"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String selectedCat = request.getParameter("category");
if (selectedCat == null) {
    selectedCat = "Fashion"; // Default category if none is selected
}
String con = "failed";

User auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
	
}
LocalDate today = LocalDate.now();
LocalDate deliveryDate = today.plusDays(4);
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
String formattedDeliveryDate = deliveryDate.format(formatter);


%>
    
    
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-size: 0.9rem;
        }
         .container {
       max-width: 600px;
        
        }
        .card {
            padding: 13px;

        }
        .table th, .table td {
            font-size: 0.8rem;
            padding: 7px;
        }
        h1, h3 {
            font-size: 1.2rem;
        }
        p {
            font-size: 0.8rem;
        }
    </style>
    <style>
    body {
        font-size: 0.7rem; /* Slightly smaller global font size */
    }
    .container {
        max-width: 800px; /* Smaller width */
        margin-top: 80px !important; /* Reduced margin-top */
    }
    .card {
        padding: 7px; /* Reduced padding */
         box-shadow: 0 6px 12px rgba(0, 0, 0, 0.7); /* Darker black shadow */
        border-radius: 8px; /* Smooth corners */
    }
    .table th, .table td {
        font-size: 0.8rem; /* Smaller table font size */
        padding: 4px; /* Reduced table cell padding */
    }
    h1, h3 {
        font-size: 0.7rem; /* Reduced header font size */
    }
    p {
        font-size: 0.7rem; /* Smaller paragraph font size */
        margin-bottom: 4px; /* Reduce paragraph spacing */
    }
</style>
    
    <%@include file="bootstrap/head.jsp"%>
    
</head>
<body>
<%@include file="bootstrap/Navbar.jsp"%>

<div class="container mt-3" style="max-width: 800px; margin-top: 70px !important;">


    <div class="card p-3 shadow-sm">
        <h1 class="text-center mb-3">Purchase Details</h1>

        <!-- User Information -->
        <div class="user-info mb-3">
            <h3>User Information</h3>
            <p><strong>Username: <%= auth.getName() %></strong> </p>
            <p><strong>Contact:</strong> <%= auth.getContact() %></p>
            <p><strong>Email:</strong> <%= auth.getEmail() %></p>
        </div>

        <!-- Order Details -->
        <div class="order-details mb-3">
            <h3>Order Details</h3>
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
    <%
        ArrayList<Card> orderList = (ArrayList<Card>) session.getAttribute("order_list");
        double grandTotal = 0.0;

        if (orderList != null && !orderList.isEmpty()) {
            ProductDao pDao = new ProductDao(dbcon.getConnection());

            for (Card item : orderList) {
                Product product = pDao.getSingleProduct(item.getId());
                double total = product.getPrice() * item.getQuan();
                grandTotal += total;
    %>
    <tr>
        <td><%= product.getName() %></td>
        <td><%= item.getQuan() %></td>
        <td>₹ <%= product.getPrice() %></td>
    </tr>
    <% 
            }
        } 
    %>
</tbody>
<tfoot>
    <tr>
        <td colspan="2" class="text-right total-row">Grand Total:</td>
        <td class="grand-total">₹ <%= grandTotal %> + 25 GST </td>
    </tr>
</tfoot>

            </table>
            <p class="fw-bold">Total Price: ₹ <%=grandTotal + 25%> </p>
        </div>

        <!-- Delivery Information -->
        <div class="delivery-info mb-3">
            <h3>Delivery Information</h3>
            <p><strong>Delivery Id :</strong> B006GW03WK</p>
            <p><strong>Delivery Address:</strong> <%= auth.getAddress() %></p>
            <p><strong>The product will be delivered on:</strong> <%= formattedDeliveryDate %></p>
            
        </div>

        <!-- Footer -->
        <div class="footer text-center">
            <p>Thank you for shopping with us!</p>
        </div>
    </div>
</div>
<%@include file="bootstrap/footer.jsp"%>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
