package MyServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.Card;


@WebServlet("/IncreaseDecrease")
public class IncreaseDecrease extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		response.setContentType("text/html");
		try(PrintWriter ptPrintWriter = response.getWriter();){
			String ac = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
		ArrayList<Card> card_list=	(ArrayList<Card>)request.getSession().getAttribute("card_list");
		if(ac != null && id>=1) {
			if(ac.equals("inc")) {
				for(Card card :card_list) {
					if(card.getId() == id) {
						int quentity = card.getQuan();
						quentity++;
						card.setQuan(quentity);
						response.sendRedirect("card.jsp");
					}
				}
			}

			if(ac.equals("dec")) {
				for(Card card :card_list) {
					if(card.getId() == id && card.getQuan() > 1) {
						int quentity = card.getQuan();
						quentity--;
						card.setQuan(quentity);
						break;
						
					}
			}
				response.sendRedirect("card.jsp");
		}
		}else {
			response.sendRedirect("card.jsp");
		}
		
		}
	}

//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		doGet(request, response);
//	}

}
