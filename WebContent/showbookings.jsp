<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "Servlet.Login" %>
<%@page import ="java.sql.*" %>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/flyawaydb";
String username = "root";
String password = "root";
String sql = null;
try{
	Class.forName(driver);
	} catch(ClassNotFoundException e){
		e.printStackTrace();
	}
Connection con =null;
Statement st = null;
ResultSet rs =null;
%>

<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href="css/admindashboard.css">
<meta charset="ISO-8859-1">

<title>Bookings</title>
</head>
<body>
<%

if(session.getAttribute("username")==null)
	{
		response.sendRedirect("adminlogin.jsp");
	}
%>
<div class="navbar">
<nav class ="navbar">
	<ul>
		<li><a class = "active" href = "welcome.jsp">Home</a></li>
		<li><a class ="logout" href = "adminlogin.jsp">Logout</a>
	</ul>
	</nav>
	</div>
<div class ="container">
	
		
<div class ="table">
	<table class ="bookingdata">
	<thread>
	<tr>
		<th scope = "col"> EMAIL ID </th>
		<th scope = "col"> BOOKING ID </th>
		<th scope = "col"> FLIGHT NO </th>
		</tr>
		</thread>
		<tbody>
		<h3>Booking Table</h3>
		
		<%
		
			con = DriverManager.getConnection(url,username,password);
			st = con.createStatement();
			sql = "select * from booking";
			rs=st.executeQuery(sql);
			while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("email_id") %></td>
		<td><%=rs.getString("booking_id") %></td>
		<td><%=rs.getString("flight_no") %></td>
		<%			
		}
		%>
		</tbody>
	
	</table>
</div>
</div>

</body>
</html>