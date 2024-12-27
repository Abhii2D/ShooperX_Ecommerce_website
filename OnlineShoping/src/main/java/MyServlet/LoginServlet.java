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


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public LoginServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	response.setContentType("text/html;charset=UTF-8");
	try(PrintWriter out = response.getWriter()){
		String email = request.getParameter("em");
		String pass = request.getParameter("ep");
	try {
		UserDao uDao = new UserDao(dbcon.getConnection());
		User user =  uDao.userlogin(email, pass);
		if(user != null) {
			request.getSession().setAttribute("auth", user);
			String unameString = user.getName();
			RequestDispatcher rsDispatcher = request.getRequestDispatcher("index.jsp");
			rsDispatcher.include(request, response);
		}else {
			out.print("Login Failed");
			RequestDispatcher rsDispatcher = request.getRequestDispatcher("login.jsp");
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
