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


@WebServlet("/Removeitem")
public class RemoveItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		try(PrintWriter ptPrintWriter = response.getWriter()){
			String id = request.getParameter("id");
			ptPrintWriter.print("prodcut id : "+ id);
			if(id!=null) {
				ArrayList<Card>card_listArrayList = (ArrayList<Card>) request.getSession().getAttribute("card_list");
				if(card_listArrayList != null) {
					for(Card card : card_listArrayList) {
						if(card.getId() == Integer.parseInt(id)) {
							card_listArrayList.remove(card_listArrayList.indexOf(card));
						}
					}
					response.sendRedirect("card.jsp");
				}
			}else {
				response.sendRedirect("card.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
