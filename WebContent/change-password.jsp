<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "Servlet.Login" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<link rel="stylesheet" href = "css/signup.css">
</head>
<body>
<%
if(session.getAttribute("username")==null)
	{
		response.sendRedirect("adminlogin.jsp");
	}
%>
<div class ="center">
	<h1>Change Password</h1>
	<form action="changepassword" method="post" class="form-container">
	<div class="txt_field">
	<input type = "text" name = "uname" required>
	<label for = "username">Username</label>
	</div>
	<div class ="txt_field">
	<input type = "password" id ="pswd" name = "cpass" required>
	<label for = "password">Current Password</label>
	</div>
	<div class ="txt_field">
	<input type = "password" id="npass" name = "npass" required>
	<label for = "confirmpassword">New Password</label>
	</div>
	<div class ="txt_field">
	<input type = "password" id="cnpass" name = "cnpass" required>
	<label for = "confirmnewpassword">Confirm New Password</label>
	</div>
	<button type = "submit" value = "changepassword">Change Password </button>
	</form>
</div>

</body>
</html>