package MyServlet;
import com.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import com.Card;
import com.mysql.cj.Session;


@WebServlet("/AddToCard")
public class AddToCard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html");
	
	try(PrintWriter out = response.getWriter()) {
		ArrayList<Card> cardList = new ArrayList<Card>();
		int id = Integer.parseInt(request.getParameter("id"));
		Card cdCard = new Card();
		cdCard.setId(id);
		cdCard.setQuan(1);
		HttpSession hSession = request.getSession();
		ArrayList<Card> cc = (ArrayList<Card>)hSession.getAttribute("card_list");
		if(cc == null) {
			cardList.add(cdCard);
			hSession.setAttribute("card_list", cardList);
			response.sendRedirect("index.jsp");
		}else {
			Boolean exist=false;
			cardList = cc;
			for(Card c : cc) {
				if(c.getId() == id) {
					exist=true;
					out.println("<h1>exist in Card</h1> <a href='index.jsp'>home</a>");
				}
				
				
			}
			if(!exist) {
				cardList.add(cdCard);
				response.sendRedirect("index.jsp");
				}
		}
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	}

}
