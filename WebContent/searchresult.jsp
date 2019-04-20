<%@page import="com.ars.model.Flight"%>
<%@page import="java.util.List"%>
<%@page import="com.ars.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/main.js"></script>
<meta charset="ISO-8859-1">
<title>Search result</title>
<style>
.mylink {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
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

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}

p {
	font-family: "Times New Roman", Times, serif;
	border: 5px solid black;
	height:
	margin: 20px 20px 10x 20px;
	padding: 10px 5px 15px 20px;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	margin-left: 1100px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
	border-radius: 8px;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}
</style>
</head>
<body>
	<%
		HttpSession session1=request.getSession();
		if(session1!=null){
			User user=(User)session1.getAttribute("userloggedin");
			List<Flight> availableFlight=(List<Flight>)session1.getAttribute("availableflights");
		
	%>
	<ul>
		<li><a href="home.jsp">Home</a></li>
		<li><a class="active" href="search.jsp">Search</a></li>
		<li><a href="profile.jsp">User Profile</a></li>
		<li><a href="bookinginfo.jsp">Booking Info</a></li>
		<li><a href="LogoutController">Logout</a></li>
		<li style="float:right" class="mylink">Hi <%= user.getName() %>,</li>
	</ul>
	<br>
	<br>
	<br>
	<%
			for(int i=0; i<availableFlight.size(); i++)
			{
	%>
	<p>
		<b>Flight Number:</b> <%= availableFlight.get(i).getFlightNumber() %><br>
		<b>Flight Franchise:</b> <%= availableFlight.get(i).getFlightFranchise() %><br>
		<b>Fare:</b> Rs.<%= availableFlight.get(i).getFare() %>/person<br>
		<b>Departure Time:</b> <%= availableFlight.get(i).getDepartureTime() %><br>
		<a href="BookingConfirmationController?no=<%=i%>"><button class="button button2">Book Now</button></a><br><br>
	
			
	
	</p>
	<%
			}
		}
		else
			response.sendRedirect("index.jsp");
	%>
	
</body>
</html>