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
  try
  {
	Class.forName(driver);
  } 
  catch(ClassNotFoundException e)
  {
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

<title>Dashboard Admin</title>
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
		<li><a href = "change-password.jsp">Change Password</a>
		<li><a href = "addflights.jsp">Add Flight</a>
		<li><a href = "showbookings.jsp">Show Bookings</a>
		<li><a class ="logout" href = "adminlogin.jsp">Logout</a>
	</ul>
	</nav>
	</div>
<div class ="container">
	<h2> Admin Dashboard </h2>
		
<div class ="table">
	<table class ="flightdata">
	<thread>
	<tr>
		<th scope = "col"> Airline Name </th>
		<th scope = "col"> Price </th>
		<th scope = "col"> Flight No </th>
		<th scope = "col"> Source </th>
		<th scope = "col"> Destination </th>
		<th scope = "col"> Date of Travel </th>
		<th scope = "col"> Class </th>
		</tr>
		</thread>
		<tbody>
		<h3>Flight Table</h3>
		
		<%
		
			con = DriverManager.getConnection(url,username,password);
			st = con.createStatement();
			sql = "select *from flight_details";
			rs=st.executeQuery(sql);
			while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("airline_name") %></td>
		<td><%=rs.getString("price") %></td>
		<td><%=rs.getString("flight_no") %></td>
		<td><%=rs.getString("source") %></td>
		<td><%=rs.getString("destination") %></td>
		<td><%=rs.getString("date_of_travel") %></td>
		<td><%=rs.getString("class") %></td>
		<%			
		}
		%>
		</tbody>
	
	</table>
</div>
</div>

</body>
</html>