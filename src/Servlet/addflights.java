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

@WebServlet("/addflights")
public class addflights extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String Name = request.getParameter("Name");
		String Flight_No = request.getParameter("Flight_no");
		String Source = request.getParameter("Source");
		String Destination = request.getParameter("Destination");
		String Class = request.getParameter("Class");
		String Date = request.getParameter("Date");
		String TicketPrice = request.getParameter("TicketPrice");
		String TotalSeats = request.getParameter("totalSeats");
		String BookedSeats = request.getParameter("bookedSeats");
		String available = String.valueOf((Integer.parseInt(TotalSeats)-(Integer.parseInt(BookedSeats))));
		try 
		{
			insertFlights(Name,Flight_No,Source,Destination,Class,Date,TicketPrice,TotalSeats,BookedSeats,available);
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		out.println("Added Sucessfully");
		out.println("Redirecting to Add flights page");
		response.sendRedirect("addflights.jsp");
	}

	private void insertFlights(String name,String Flight_No,String source, String destination,String Class_f ,String date, String ticketPrice, String TotalSeats,String BookedSeats,String available) throws ClassNotFoundException, SQLException {
		String sql = "INSERT INTO flight_details(airline_name,price,flight_no,source,destination,total_seats,booked_seats,seat_availibility,date_of_travel,class) values(?,?,?,?,?,?,?,?,?,?)";
		String url = "jdbc:mysql://localhost:3306/flyawaydb";
		String username = "root";
		String password = "root";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,username,password);
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1,name);
		st.setString(3,Flight_No);
		st.setString(4,source);
		st.setString(5,destination);
		st.setString(6,TotalSeats);
		st.setString(7,BookedSeats);
		st.setString(8,available);
		st.setString(10,Class_f);
		st.setString(9,date);
		st.setString(2,ticketPrice);	
		st.executeUpdate();	
		con.close();
	}

}
