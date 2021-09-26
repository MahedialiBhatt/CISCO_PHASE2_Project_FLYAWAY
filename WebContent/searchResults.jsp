<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*" %>
<%@page import = "DAO.searchDao" %>
<%

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/flyawaydb";
String username = "root";
String password = "root";
String sql = searchDao.getQuery();
try{
	Class.forName(driver);
}
catch(ClassNotFoundException e) {
	e.printStackTrace();
}
Connection con = null;
Statement st = null;
ResultSet rs = null;

%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href = "css/searchresults.css">
<meta charset="ISO-8859-1">
<title>Search Results</title>
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
<div class ="container">
<h2>Search Results</h2>
<p>
Available Flights <br> <%=searchDao.source %> to <%=searchDao.destination %> <br>
Date of Travel :<%=searchDao.date %> <br>

<p>Select a Flight</p>
<table class = "flightDetails">

<tr>
<th scope = "col"> Flight</th>
<th scope = "col"> Source</th>
<th scope = "col"> Destination</th>
<th scope = "col"> Date</th>
<th scope = "col"> Fare(Rs)</th>
<th scope = "col"> Select</th>
</tr>

<tbody>
<%
try {
	con = DriverManager.getConnection(url,username,password);
	st = con.createStatement();
	rs = st.executeQuery(sql);
	while(rs.next()){
%>
<tr align ="center">
  <td><%=rs.getString("airline_name") %></td>
            <td><%=rs.getString("source") %></td>
            <td><%=rs.getString("destination") %></td>
            <td><%=searchDao.date%></td>
            <td><%=rs.getString("price") %></td>
            <td>
                <form action="${pageContext.request.contextPath}/bookingDetails.jsp" method="post">
                    <input type="hidden" id="name" name="name" value="<%=rs.getString("airline_name")%>">
                    <input type="hidden" id="ticket_price" name="ticket_price" value="<%=rs.getString("price")%>">
                    <input type="hidden" id="flight_id" name="flight_id" value="<%=rs.getString("flight_no")%>">
                    <input type="submit" class="btn btn-success" value="Book This Flight">
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
</tbody>

</table>
</div>

</body>
</html>