package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.UserLoginDao;

@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
   
    public userLogin() {
        super();
    }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");

		UserLoginDao dao = new UserLoginDao();
		
		if(dao.check(uname,pass))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			out.println("Logged in");
			response.sendRedirect("searchportal.jsp");
		}
		else
		{			
			out.println("Incorrect login/password");
			response.sendRedirect("userlogin.jsp");
		}
	}

}
