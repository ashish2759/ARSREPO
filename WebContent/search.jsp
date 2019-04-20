<%@page import="com.ars.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
<script type="text/javascript" src="js/main.js"></script>
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

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}

.container {

  background-color: lightgrey;
  width: 500px;
  height: 200px;
  border: 10px solid #008CBA;
  padding: 50px;
  margin: 20px;
  margin-left: 350px;
  margin-top: 10px
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
<body onload="restrictDate()">
<%
		HttpSession session1=request.getSession();
		if(session1!=null){
			User user=(User)session1.getAttribute("userloggedin");
		
	%>
<ul>
  <li><a  href="home.jsp">Home</a></li>
  <li><a class="active" href="search.jsp">Search</a></li>
  <li><a href="profile.jsp">User Profile</a></li>
  <li><a href="bookinginfo.jsp">Booking Info</a></li>
  <li><a href="LogoutController">Logout</a></li>
 <li style="float:right" class="mylink">Hi <%= user.getName() %>,</li>
</ul>
<br><br><br> 
<form action="SearchController" method="post">
<h1><center>Search For Flights...</center></h1>
<div class="container">
	<center><span id="notsame"></span></center>
	Source: <select required name="source" id="source">
		<option value="">------Select a city------</option>
		
		<option value="Abu Dhabi">Abu Dhabi</option>
		<option value="Singapore">Singapore</option>
		<option value="Dubai">Dubai</option>
		<option value="Malacca">Malacca</option>
		<option value="Bangkok">Bangkok</option>
		<option value="Bali">Bali</option>
		<option value="Phuket">Phuket</option>
		<option value="Chicago">Chicago</option>
		<option value="Indianapolis">Indianapolis</option>
	</select><br><br>
	Destination: <select required name="destination" id="destination" onchange="return isSame()">
		<option value="">------Select a city------</option>
		
		<option value="Abu Dhabi">Abu Dhabi</option>
		<option value="Singapore">Singapore</option>
		<option value="Dubai">Dubai</option>
		<option value="Malacca">Malacca</option>
		<option value="Bangkok">Bangkok</option>
		<option value="Bali">Bali</option>
		<option value="Phuket">Phuket</option>
		<option value="Chicago">Chicago</option>
		<option value="Indianapolis">Indianapolis</option>
	</select><br><br>
	No of Passengers: 
	<select required name="noofpassengers">
	<option value="">---Select a no. of passengers--</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
	</select><br><br>
	Departure Date: <input type="date" required name="departuredate" id="date1"><br><br>
	<center><button class="button button2" type="submit">Search</button></center>
		<% if(request.getAttribute("noflightsfound")!=null){
				%>
				No Flights found...try exploring a different place :)
			<%} 
			%>
	</form>
</div>

<%
		}
		else
			response.sendRedirect("index.jsp");
	%>
</body>
</html>