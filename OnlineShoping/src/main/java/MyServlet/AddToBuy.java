package MyServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.Card;


@WebServlet("/OrderNow")
public class AddToBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));

            // Create a new Card object for the selected product
            Card orderItem = new Card();
            orderItem.setId(id);
            orderItem.setQuan(1); // Default quantity

            // Access the session to store order details
            HttpSession session = request.getSession();
            ArrayList<Card> orderList = (ArrayList<Card>) session.getAttribute("order_list");

            if (orderList == null) {
                orderList = new ArrayList<>();
                session.setAttribute("order_list", orderList);
            }

            // Check if the product already exists in the order list
            boolean exists = false;
            for (Card item : orderList) {
                if (item.getId() == id) {
                    exists = true;
                    out.println("<h3>This product is already in your order!</h3>");
                    out.println("<a href='index.jsp'>Continue Shopping</a>");
                    break;
                }
            }

            if (!exists) {
                orderList.add(orderItem);
                session.setAttribute("order_list", orderList);
                
                // Now, remove the product from the cart
                ArrayList<Card> cardList = (ArrayList<Card>) session.getAttribute("card_list");
                if (cardList != null) {
                    cardList.removeIf(card -> card.getId() == id); // Remove the product from the cart
                    session.setAttribute("card_list", cardList);
                }

                response.sendRedirect("order.jsp"); // Redirect to order summary
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
	
