package DAO;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

public class LoginDao 
{
	String SQL_query = "select * from admin where uname=? and pass=?";
	String URL = "jdbc:mysql://localhost:3306/flyawaydb";
	String db_Username = "root";
	String db_Pass = "root";
	public boolean adminIsValidOrNot(String uname, String pass) 
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL,db_Username,db_Pass);
			PreparedStatement st = con.prepareStatement(SQL_query);
			st.setString(1,uname);
			st.setString(2,pass);
			ResultSet rs = st.executeQuery();
			System.out.println(rs);
			 if(rs.next()) 
			 {
				return true;
			 }
			} 
		    catch (ClassNotFoundException | SQLException  e) 
		    {
				e.printStackTrace();
			}
		return false;	
	}
}
