<%@page import="com.ars.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<script type="text/javascript" src="js/main.js"></script>
<style>
body {
    background-color: #78C9EA;
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
  border-right:1px solid #bbb;
}

li:last-child {
  border-right: none;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.mylink {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
</style>
</head>
<body>
	<%
		HttpSession session1=request.getSession();
		if(session1!=null){
			User user=(User)session1.getAttribute("userloggedin");
		
	%>
<ul>
  <li><a class="active" href="home.jsp">Home</a></li>
  <li><a href="search.jsp">Search</a></li>
  <li><a href="profile.jsp">User Profile</a></li>
  <li><a href="ViewBookingController">Booking Info</a></li>
  <li><a href="LogoutController">Logout</a></li>
 <li style="float:right" class="mylink">Hi <%= user.getName() %>,</li>
</ul>
<br><br><br><center><h1>FLIGHT RESERVATION SYSTEM</h1></center>
	<%
		}
		else
			response.sendRedirect("index.jsp");
	%>
</body>
</html>