<%@page import="SqlConnection.dbcon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.*"%>

<%
String con = "failed";
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}

ArrayList<Card> card_list = (ArrayList<Card>) session.getAttribute("card_list");
List<Card> cardProdcut = new ArrayList<>(); // Ensure it's always initialized

if (card_list != null && !card_list.isEmpty()) {
    ProductDao pDao = new ProductDao(dbcon.getConnection());
    cardProdcut = pDao.getCardProducts(card_list); 
    double total=  pDao.getTotalCardPrice(card_list);
    
    request.setAttribute("card_list", card_list);
    request.setAttribute("total", total);
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <%@include file="bootstrap/head.jsp"%>
    <style>
        /* Additional Styling for Cart Page */
        .checkout-btn {
            font-size: 16px;
            padding: 10px 20px;
        }
        .cart-table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
        .quantity-input {
            width: 60px;
            text-align: center;
        }
        .cart-total {
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@include file="bootstrap/Navbar.jsp"%>

    <!-- Container for Cart -->
    <div class="container-fluild px-3 mt-5 pt-5">
        <!-- Price and Checkout Section -->
        <div class="row py-3">
            <div class="col-md-12 d-flex justify-content-between align-items-center mb-3">
                <h3 class="cart-total">Total Price: ₹ 
                ${ (total > 0)?total: 0} </h3>
                <a class="btn btn-success checkout-btn" href="#">
                    <i class="fas fa-credit-card"></i> CheckOut
                </a>
            </div>
        </div>

        <!-- Table Section -->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover table-bordered text-center cart-table">
                    <thead class="bg-primary text-white">
                        <tr>
                            <th scope="col"><i class="fas fa-image"></i> Product</th>
                            <th scope="col"><i class="fas fa-tag"></i> Name</th>
                            <th scope="col"><i class="fas fa-list"></i> Category</th>
                            <th scope="col"><i class="fas fa-rupee-sign"></i> Price</th>
                            <th scope="col"><i class="fas fa-cart-plus"></i> Quantity</th>
                            <th scope="col"><i class="fas fa-times-circle"></i> Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (cardProdcut != null && !cardProdcut.isEmpty()) { 
                            for (Card c : cardProdcut) { %>
                                <tr>
                                    <td style="padding:40px;">
                                        <img src="image/<%= c.getImage() %>" alt="Product Image" class="img-thumbnail">
                                    </td>
                                    <td><%= c.getName() %></td>
                                    <td><%= c.getCategoy() %></td>
                                    <td>₹ <%= c.getPrice() %></td>
                                    <td>
                                        <form action="OrderNow" method="get" class="form-inline">
                                            <input type="hidden" name="id" value="<%= c.getId() %>">
                                            <div class="form-group d-flex justify-content-center align-items-center">
                                                <a class="btn btn-sm btn-outline-secondary mx-1" href="IncreaseDecrease?action=dec&id=<%=c.getId()%>">
                                                    <i class="fas fa-minus"></i>
                                                </a>
                                                <input type="text" name="quantity" class="form-control quantity-input " value="<%=c.getQuan() %>" readonly />
                                                <a class="btn btn-sm btn-outline-secondary mx-1" href="IncreaseDecrease?action=inc&id=<%=c.getId()%>">
                                                    <i class="fas fa-plus"></i>
                                                </a>
                                                       <button type="submit" class="btn btn-sm btn-primary">Add to Order</button>
   </div>
                                        </form>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-danger" href="Removeitem?id=<%= c.getId() %>">
                                            <i class="fas fa-trash"></i> Remove
                                        </a>
                                    </td>
                                </tr>
                        <%   }
                           } else { %>
                            <tr>
                                <td colspan="6" class="text-center">Your cart is empty!</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap Script -->
    <%@include file="bootstrap/footer.jsp"%>
</body>
</html>
