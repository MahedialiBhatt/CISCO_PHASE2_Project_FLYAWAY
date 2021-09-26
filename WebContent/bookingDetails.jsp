<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="DAO.bookingDetails" %>
<%
	bookingDetails.flightBookingId = request.getParameter("flight_id");
	bookingDetails.ticketPrice = request.getParameter("ticket_price");
	bookingDetails.flightName=request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href="css/bookingdetails.css">
<meta charset="ISO-8859-1">
<title>Booking Details</title>
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
		<li><a class ="logout" href = "userlogin.jsp">Logout</a>
	</ul>
	</nav>
	</div>

<div class = "center">
	<h1>Enter Details</h1>
	<form class="form-container" action="${pageContext.request.contextPath}/payment.jsp" method="post">
	<div class ="txt_field">
	<input type = "text" id ="name" name ="name" required>
	<label for="name">Full Name</label>
	</div>
	<div class ="txt_field">
	<input type = "text" id ="address" name ="address" required>
	<label for="address">Address</label>
	</div>
	<div class ="txt_field">
	<input type = "number" id ="age" name ="age" required>
	<label for="age">Age</label>
	</div>
	<div class ="txt_field">
	<input type = "text" id ="mobile" name ="mobile" required>
	<label for="mobile">Mobile No</label>
	</div>
	<div class ="txt_field">
	<input type = "text" id ="email" name ="email" required>
	<label for="email">Email Id</label>
	</div>
	<div class="txt_field">
	<input type = "text" id ="id" name ="id" required>
	<label for="id">Identity No</label>
	</div>
	<div class = "txt_field">
	<input type="text"  id="country" name="country" required >
	<label for="country">Country</label>
	</div>
	<div>
	<button type="submit" class="btn btn-success btn-block" value="Submit">Submit</button>
	</div>
	</form>
</div>
</body>
</html>