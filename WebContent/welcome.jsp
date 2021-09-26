<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to FLYAWAY</title>
<link rel="stylesheet" href= "css/welcome.css">
</head>
<body>
<div class="wrapper">
	<nav class ="navbar">
	<ul>
		<li><a class = "active" href = "welcome.jsp">Home</a></li>
		<li><a href = "adminlogin.jsp">Admin Login</a>
	</ul>
	</nav>
	<div class="center">
 	<h1> Welcome to FlyAway </h1><br>
 	<h2>Online Flight Ticket Booking Platform </h2><br>
 	<div class = "bookFlights">
 	<center><button onclick = "location.href = 'userlogin.jsp'" class = "searchpage">User Login</button></center>
 	</div>
	</div>
</div>
</body>
</html>