<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "DAO.bookingDetails" %>
<%@ page import= "DAO.searchDao" %>
<%
	bookingDetails.passengerName = request.getParameter("name");
	bookingDetails.passengerEmail = request.getParameter("email");
	bookingDetails.passengerMobile = request.getParameter("mobile");
	bookingDetails.address = request.getParameter("address");
	bookingDetails.age = request.getParameter("age");
	bookingDetails.identity = request.getParameter("id");
	bookingDetails.country = request.getParameter("country");
%>
<!DOCTYPE html>
<html>
<head>
<link rel ="stylesheet" href="css/payment.css">
<meta charset="ISO-8859-1">
<title>Payment</title>
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
<div class="center">
	<h1>Payment</h1>
	<form action="${pageContext.request.contextPath}/thankyou.jsp" method="post" class="form-container">
	<div class = "txt_field">
	<input type="text" class="form-control" id="name_on_card" name="name_on_card" required>
	<label for="card_details">Name on Card</label>
	</div>
	<div class="txt_field">
	<input type="number" class="form-control" id="card_details" name="card_details" required>
	<label for="card_details">Card Number</label>
	</div>
	<p align="left"><span><strong>Total fare = <br> <%=bookingDetails.ticketPrice%> </strong></span></p>
	<div>
	<button type="submit" class="btn btn-success btn-block" value="Submit">Confirm Payment</button>
	</div>
	</form>
</div>

</body>
</html>
