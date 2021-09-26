<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "css/searchportal.css">
<title>Search Flights</title>
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
		<li><a class ="logout" href = "userlogin.jsp">Logout</a>
	</ul>
	</nav>
	</div>
<div class ="center">
<form class = "form-container" action = "search" method = "post" >
<p> Enter details to show available flights </p>
<div class = "date-group">
<label class ="date" class ="date">Date</label>
<input type = "date" class ="form-control" id = "date" name ="date" placeholder = "Travel Date:">
</div>
<br>
<div class ="form-group">
<label class="source">Source</label>
<select name ="source">
    <option value = "Ahmedabad">Ahmedabad</option>
	<option value = "Bangalore">Bangalore</option>
	<option value = "Delhi">Delhi</option>
	<option value = "Mumbai">Mumbai</option>
	<option value = "Hyderabad">Hyderabad</option>
</select>
</div>
<br>
<div class ="form-group">
<label class="destination">Destination</label>
<select class ="dest" id ="destination" name ="destination">
	<option value = "Ahmedabad">Ahmedabad</option>
	<option value = "Bangalore">Bangalore</option>
	<option value = "Delhi">Delhi</option>
	<option value = "Mumbai">Mumbai</option>
	<option value = "Hyderabad">Hyderabad</option>
</select>
</div>
<br>
<br>
<button type ="submit" value = "Submit">Search Flights</button>
</form>
</div>
</body>
</html>