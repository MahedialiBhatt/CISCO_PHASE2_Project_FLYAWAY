package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDao;

@WebServlet("/Login_Admin")
public class Login extends HttpServlet 
{
		private static final long serialVersionUID = 1L;

		public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException {
		PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		LoginDao dao = new LoginDao();
		if(dao.adminIsValidOrNot(uname, pass))
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			out.println("Logged in");
			response.sendRedirect("adminDashboard.jsp");
		}
		else
		{
			out.println("Incorrect login/password");
			
		}
		} 		
}
	
	
	

