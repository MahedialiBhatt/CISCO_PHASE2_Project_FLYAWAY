<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<link rel="stylesheet" href="css/userlogin.css">
</head>
<body>
<nav class ="navbar">
	<ul>
		<li><a class = "active" href = "welcome.jsp">Home</a></li>
	</ul>
	</nav>
	<div class = "center">
	<h1>Login</h1>
	<form action="userLogin" method="post" class="form-container">
	<div class="txt_field">
	<label for = "username">Username</label>
	<input type = "text" name = "uname" required>
	</div>
	<div class ="txt_field">
	<label for = "password">Password</label>
	<input type = "password"  name = "pass" required>
	</div>
	<button type = "submit" value = "userlogin">Login </button>
	<div class ="signup_link">
	Not a member? <a href = "signup.jsp">Become a Member</a>
	</div>
	</form>
	</div>

</body>
</html>