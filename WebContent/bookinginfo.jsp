<%@page import="java.util.List"%>
<%@page import="com.ars.model.Booking"%>
<%@page import="com.ars.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/main.js"></script>
<meta charset="ISO-8859-1">
<title>Booking Info</title>
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

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #3366ff;
	color: white;
}
</style>
</head>
<body>
	<%
		HttpSession session1=request.getSession();
		if(session1!=null){
			User user=(User)session1.getAttribute("userloggedin");
			List<Booking> availableBookingList= (List<Booking>)session1.getAttribute("bookinglist");
	%>
	<ul>
		<li><a href="home.jsp">Home</a></li>
		<li><a href="search.jsp">Search</a></li>
		<li><a href="profile.jsp">User Profile</a></li>
		<li><a class="active" href="ViewBookingController">Booking
				Info</a></li>
		<li><a href="LogoutController">Logout</a></li>
		<li style="float:right" class="mylink">Hi <%= user.getName() %>,</li>
	</ul>
	<br>
	<br>
	<br>
	<table id="customers">
		<tr>
			<th>Booking ID</th>
			<th>Flight number</th>
			<th>Flight Franchise</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Date of Journey</th>
			<th>Departure Time</th>
			<th>No of Passengers</th>
			<th>Fare</th>
		</tr>
		<%
  	for(int i=0; i<availableBookingList.size(); i++)
  	{
  %>
		<tr>
			<td><%= availableBookingList.get(i).getBookingId() %></td>
			<td><%= availableBookingList.get(i).getFlight().getFlightNumber() %></td>
			<td><%= availableBookingList.get(i).getFlight().getFlightFranchise() %></td>
			<td><%= availableBookingList.get(i).getFlight().getSource() %></td>
			<td><%= availableBookingList.get(i).getFlight().getDestination() %></td>
			<td><%= availableBookingList.get(i).getDepartureDate() %></td>
			<td><%= availableBookingList.get(i).getFlight().getDepartureTime() %></td>
			<td><%= availableBookingList.get(i).getNoOfPassengers() %></td>
			<td>$<%= availableBookingList.get(i).getTotalFare() %></td>
		</tr>
		<%
 	}
  	%>
	</table>
	<% 
		}
		else
			response.sendRedirect("index.jsp");
	%>
</body>
</html>