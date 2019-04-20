<%@page import="com.ars.model.Booking"%>
<%@page import="com.ars.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/main.js"></script>
<meta charset="ISO-8859-1">
<title>BookingConfirmation</title>
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

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}

.container {
	background-color: lightgrey;
	width: 600px;
	height: 500px;
	border: 10px solid green;
	padding: 50px;
	margin: 20px;
	margin-left: 350px;
	margin-top: 50px
}
</style>
</head>
<body>
	<%
		HttpSession session1=request.getSession();
		if(session1!=null){
			User user=(User)session1.getAttribute("userloggedin");
			Booking booking=(Booking)session1.getAttribute("booking");
		
	%>
	<ul>
		<li><a href="./home.jsp">Home</a></li>
		<li><a class="active" href="./search.jsp">Search</a></li>
		<li><a href="./profile.jsp">User Profile</a></li>
		<li><a href="bookinginfo.jsp">Booking Info</a></li>
		<li><a href="LogoutController">Logout</a></li>
		<li style="float:right" class="mylink">Hi <%= user.getName() %>,</li>
	</ul>
	<center>
		<h2>BOOKING DETAILS</h2>
	</center>
	<div class="container">
		<b>BOOKING ID: </b> <%=booking.getBookingId() %> <br>
		<br>
		<b>NAME: </b> <%=user.getName() %> <br>
		<br>
		<b>EMAIL ID: </b> <%= user.getEmail() %> <br>
		<br>
		<b>FlIGHT NUMBER: </b> <%=booking.getFlight().getFlightNumber() %> <br>
		<br>
		<b>FLIGHT FRANCHISE: </b> <%=booking.getFlight().getFlightFranchise() %> <br>
		<br>
		<b>SOURCE CITY: </b> <%=booking.getFlight().getSource() %> <br>
		<br>
		<b>DESTINATION CITY: </b> <%=booking.getFlight().getDestination() %> <br>
		<br>
		<b>DEPARTURE DATE: </b> <%=booking.getDepartureDate() %> <br>
		<br>
		<b>DEPARTURE TIME: </b> <%=booking.getFlight().getDepartureTime() %> <br>
		<br>
		<b>NUMBER OF PASSENGERS: </b> <%= booking.getNoOfPassengers() %> <br>
		<br>
		<b>FARE FOR EACH PERSON: </b> $ <%= booking.getFlight().getFare() %>/- <br>
		<br>
		<% double fare =booking.getNoOfPassengers() * booking.getFlight().getFare(); %>
		<b>FARE: </b> <br>
		<br> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>BASE
			FARE: </b> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp $ <%= fare %> <br>
		<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>GST
			@ 5% of Base fare: </b> &nbsp&nbsp&nbsp $<%= booking.getGstPrice() %> <br>
		<br>
		<b>TOTAL:</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		&nbsp&nbsp $<%= booking.getTotalFare() %>
	</div>
	<%
		}
		else
			response.sendRedirect("index.jsp");
	%>
</body>
</html>