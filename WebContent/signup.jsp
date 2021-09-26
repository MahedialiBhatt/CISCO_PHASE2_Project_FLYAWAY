<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<link rel ="stylesheet" href ="css/signup.css">
</head>
<body>
<div class ="center">
	<h1>Signup</h1>
	<form action="signup" method="post" class="form-container">
	<div class="txt_field">
	<input type = "text" name = "uname" required>
	<label for = "username">Username</label>
	</div>
	<div class ="txt_field">
	<input type = "password" id ="pswd" name = "pass" required>
	<label for = "password">Password</label>
	</div>
	<div class ="txt_field">
	<input type = "password" id="confirmpswd" name = "confirmpass" required>
	<label for = "confirmpassword">Confirm Password</label>
	</div>
	<button type = "submit" value = "signup">Register </button>
	</form>
</div>


</body>
</html>