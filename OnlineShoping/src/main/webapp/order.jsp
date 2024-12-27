<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.*"%>
<%@ page import="SqlConnection.dbcon"%>
<%User auth = (User) request.getSession().getAttribute("auth");
String con = "failed";
if (auth != null) {
    request.setAttribute("auth", auth);
}
 %>
<!DOCTYPE html>
<html>
<head>
<title>Order Summary</title>
<%@include file="bootstrap/head.jsp"%>
<style>
.receipt-header {
	font-size: 1.5rem;
	font-weight: bold;
}

.total-row {
	font-size: 1.2rem;
	font-weight: bold;
}

.grand-total {
	font-size: 1.5rem;
	font-weight: bold;
	color: green;
}

</style>
</head>
<body>
	<%@include file="bootstrap/Navbar.jsp"%>
	<div class="container px-3 mt-5 pt-5">
		<h2 class="mb-4">🛒 Order Summary</h2>
		<table class="table table-bordered text-center">
			<thead class="bg-primary text-white">
				<tr>
					<th>Product Image</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total</th>
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
					<td><img src="image/<%= product.getImage() %>" alt="Product Image"
						class="img-thumbnail" style="width:80px; height:60px;"></td>
					<td><%= product.getName() %></td>
					<td>₹ <%= product.getPrice() %></td>
					<td><%= item.getQuan() %></td>
					<td>₹ <%= total %></td>
				</tr>
				<% 
                        }
                    } else { 
                %>
				<tr>
					<td colspan="5">No orders placed yet!</td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" class="text-right total-row">Grand Total:</td>
					<td class="grand-total">₹ <%= grandTotal %></td>
				</tr>
			</tfoot>
		</table>

		<div class="text-right mt-4">
			<a href="index.jsp" class="btn btn-secondary">🛍️ Continue
				Shopping</a> <a href="Recipt.jsp" class="btn btn-success">💳
				Proceed to Checkout</a>
		</div>
	</div>
	<%@include file="bootstrap/footer.jsp"%>
</body>
</html>
