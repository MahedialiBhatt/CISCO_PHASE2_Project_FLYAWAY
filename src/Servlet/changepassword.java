package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/changepassword")
public class changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;      
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String uname = request.getParameter("uname");
		String pass = request.getParameter("cpass");
		String newPass = request.getParameter("npass");
		String confirmNewPass = request.getParameter("cnpass");
		
		if(newPass.equals(confirmNewPass)) {
			try {
				updatePassword(uname,newPass);
				out.println("Password Sucessfully Changed");
				out.println("Redirecting to admin login page");
				response.sendRedirect("adminlogin.jsp");
			}catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			out.println("Password do not match,try again");
			try {
				Thread.sleep(2*1000);
				response.sendRedirect("change-password.jsp");
			}catch(InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	public void updatePassword(String uname,String pass) throws SQLException, ClassNotFoundException {
		String sql = "update admin set pass=? where uname=?";
		String url = "jdbc:mysql://localhost:3306/flyawaydb";
		String username = "root";
		String password = "root";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,pass);
		st.setString(2,uname);
		st.executeUpdate();
		
		con.close();
		
	}
	

}
