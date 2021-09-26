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

@WebServlet("/signup")
public class signup extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String confirmPass = request.getParameter("confirmpass");
		
		if(pass.equals(confirmPass)) {
			try {				
				insertIntoDatabase(uname,pass);
				out.println("Registration Sucessfull");
				out.println("Redirecting to search page");
				response.sendRedirect("searchportal.jsp");
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}			
		}
		else {
			out.println("Passwords do not match, please try again");
			try {
				Thread.sleep(2*1000);
				response.sendRedirect("signup.jsp");
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			
		}
	}
	
	public void insertIntoDatabase(String uname, String pass)  throws ClassNotFoundException, SQLException  {
		String sql = "insert into login values (?,?)";
		String url = "jdbc:mysql://localhost:3306/flyawaydb";
		String username = "root";
		String password = "root";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,uname);
		st.setString(2, pass);
		st.executeUpdate();	
		
		con.close();
		}
		
	}

