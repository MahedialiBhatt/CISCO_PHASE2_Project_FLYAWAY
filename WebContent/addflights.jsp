<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup.css">
<meta charset="ISO-8859-1">

</head>
<body>
<%
if(session.getAttribute("username")==null)
	{
		response.sendRedirect("adminlogin.jsp");
	}
%>
<div class = "center">
	<h1>Add Flights</h1>
	<form action="addflights" method="post" class="form-container">
	<div class ="txt_field">
	<input type = "text"  name = "Name" required>
	<label for = "Name">Name</label>
	</div>
	<div class ="txt_field">
	<input type = "number"  name = "Flight_no" required>
	<label for = "Flight_no">Flight No</label>
	</div>
	<div class ="txt_field">
	<input type = "text" name = "Source" required>
	<label for = "Source">Source</label>
	</div>
	<div class ="txt_field">
	<input type = "text" name = "Destination" required>
	<label for = "Destination">Destination</label>
	</div>
	<div class ="txt_field">
	<input type = "text"  name = "Class" required>
	<label for = "Class">Class</label>
	</div>
	<div class ="txt_field">
	<input type = "date"  name = "Date" required>
	<label for = "Date">Date</label>
	</div>
	<div class ="txt_field">
	<input type = "number" name = "TicketPrice" required>
	<label for = "TicketPrice">Ticket Price(Rs)</label>
	</div>
	<div class ="txt_field">
	<input type = "number" name = "totalSeats" required>
	<label for = "totalSeats">Total Seats</label>
	</div>
	<div class ="txt_field">
	<input type = "number" name = "bookedSeats" required>
	<label for = "bookedSeats">Booked Seats</label>
	</div>
	<button type = "submit" value = "addflights">Submit </button>
	</form>
</div>


</body>
</html>