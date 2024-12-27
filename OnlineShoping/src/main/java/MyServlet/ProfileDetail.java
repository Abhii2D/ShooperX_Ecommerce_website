package MyServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import SqlConnection.dbcon;
import UserAuth.UserDao;

@WebServlet("/ProfileDetail")
public class ProfileDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("Profiles.jsp");	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	try(PrintWriter out = response.getWriter()){
		String email = request.getParameter("email");
		String contact = request.getParameter("Contact");
		String name = request.getParameter("username");
		String address = request.getParameter("address");
		Boolean bn;
		try {
		UserDao uDao = new UserDao(dbcon.getConnection());
			bn=uDao.userProfile(name,email, contact,address);
		if(bn == true) {
			
		
			RequestDispatcher rsDispatcher = request.getRequestDispatcher("login.jsp");
			rsDispatcher.include(request, response);
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
		doGet(request, response);
	}

}



