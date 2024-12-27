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

import com.User;

import SqlConnection.dbcon;
import UserAuth.UserDao;


@WebServlet("/RegesterServlet")
public class RegesterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegesterServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");	
		
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	try(PrintWriter out = response.getWriter()){
		String email = request.getParameter("reg-email");
		String pass = request.getParameter("reg-password");
		String name = request.getParameter("reg-name");
		Boolean bn;
		try {
		UserDao uDao = new UserDao(dbcon.getConnection());
			bn=uDao.userlogin(name,email, pass);
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
