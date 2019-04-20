<%@page import="com.ars.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/main.js"></script>
<meta charset="ISO-8859-1">
<title>My Profile</title>
<style>
.mylink {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
body {
	background-color: #1abc9c;
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
	border-right: 1px solid #bbb;
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

li
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#111
;


}
.active {
	background-color: #4CAF50;
}

.container {
	background-color: lightgrey;
	width: 500px;
	height: 200px;
	border: 10px solid green;
	padding: 50px;
	margin: 20px;
	margin-left: 350px;
	margin-top: 100px
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
		<li><a href="home.jsp">Home</a></li>
		<li><a href="search.jsp">Search</a></li>
		<li><a class="active" href="profile.jsp">User Profile</a></li>
		<li><a href="bookinginfo.jsp">Booking Info</a></li>
		<li><a href="LogoutController">Logout</a></li>
		<li style="float:right" class="mylink">Hi <%= user.getName() %>,</li>
	</ul>

	<div class="container">
		<br><b>NAME: </b> <%= user.getName() %>
		<br><br><b>ADDRESS: </b> <%= user.getAddress() %>
		<br><br><b>EMAIL ID: </b> <%= user.getEmail() %>
		<br><br><b>CONTACT: </b> <%= user.getContact() %>
		<br><br><b>LOGIN ID: </b> <%= user.getUserId() %>
		<br><br><b>PASSWORD: </b><%= user.getPassword() %>
	</div>
	<%
		}
		else
			response.sendRedirect("index.jsp");
	%>
</body>
</html>