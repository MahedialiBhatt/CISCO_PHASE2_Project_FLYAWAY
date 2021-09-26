<%@page import="Servlet.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "DAO.bookingDetails" %>
<%@ page import = "DAO.searchDao" %>

<%
bookingDetails.nameOnCard = request.getParameter("name_on_card");
bookingDetails.cardDetails =request.getParameter("card_details");
%>

<!-- update database -->
<%@ page import="java.io.IOException"%>
<%@ page import ="java.sql.Connection"%>
<%@ page import ="java.io.PrintWriter"%>
<%@ page import ="java.sql.DriverManager"%>
<%@ page import ="java.sql.PreparedStatement"%>
<%@ page import ="java.sql.SQLException"%>
<%@page import ="javax.servlet.ServletException"%>
<%@page import ="javax.servlet.http.HttpServlet"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="javax.servlet.http.HttpServletResponse"%>
<%@page import ="java.util.Random"%>
<%
			String passengerName = bookingDetails.passengerName;
			String email = bookingDetails.passengerEmail;
			String phone = bookingDetails.passengerMobile;
			String Source = searchDao.source;
			String Destination =searchDao.destination;
			String Day = searchDao.date;
			String TotalPrice = bookingDetails.ticketPrice;
			String address = bookingDetails.address;
			String age = bookingDetails.age;
			String country = bookingDetails.country;
			String identity = bookingDetails.identity;
			
			String sql = "insert into register_details(full_name,address,age,mobile,email_id,personal_identity_id,country) values(?,?,?,?,?,?,?)";
			String sql2 = "insert into booking(email_id,booking_id,flight_no) values(?,?,?)";
			String url = "jdbc:mysql://localhost:3306/flyawaydb";
			String username = "root";
			String password = "root";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement st = con.prepareStatement(sql);
			PreparedStatement st2 = con.prepareStatement(sql2);
			st.setString(1,passengerName);
			st.setString(2,address);
			st.setString(3,age);
			st.setString(4,phone);
			st.setString(5,email);	
			st.setString(6,identity);
			st.setString(7,country);
			st.executeUpdate();
			st2.setString(1,email);
			st2.setString(2,searchDao.getAlphaNumericString(15));
			st2.setString(3,bookingDetails.flightBookingId);
			st2.executeUpdate();
			con.close();
%>
<!-- Show Details -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel ="stylesheet" href="css/thankyou.css">
<title>Thank you</title>
</head>
<body>
<%

if(session.getAttribute("username")==null)
	{
		response.sendRedirect("userlogin.jsp");
	}
%>
<div class="navbar">
<nav class ="navbar">
	<ul>
		<li><a class ="logout" href = "welcome.jsp">Logout</a>
	</ul>
	</nav>
	</div>
<div class="container">
        <h1 align="center"><span><strong>Thank You</strong></span></h1>       
        <p align="center"><span><strong>Your ticket has been booked.</strong></span></p>
        <br>
        <h3>Ticket Summary</h3>
        <h4><strong><%=searchDao.source%> to <%=searchDao.destination%> | <%=searchDao.date%> </strong></h4>
        <p align="left"><%=bookingDetails.flightBookingId%> - <%=bookingDetails.flightName%></p><br>
        <br>
        <h3><strong>Passenger Summary</strong></h3>
        <h3>Booking Name-<%=bookingDetails.passengerName%> | Email- <%=bookingDetails.passengerEmail%> | Phone- <%=bookingDetails.passengerMobile%></h3>
        <br>
        <h3><strong>Payment Summary</strong></h3>
        <h4>Payment By-<%=bookingDetails.nameOnCard%> | Card No- <%=bookingDetails.cardDetails%></h4><br>
        <h2 align="right"><strong>Total Paid- Rs.<%=bookingDetails.ticketPrice%></strong></h2><br><br>
    </div>
</body>
</html>