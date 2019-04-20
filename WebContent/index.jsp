<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Air Ticket Reservation System</title>
<script type="text/javascript" src="js/main.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.mylink {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
body {
	font-family: Arial, Helvetica, sans-serif;
	background-image: url("images/home.jpg");
}

input[type=text], input[type=password] {
	width: 30%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 30%;
}

button:hover {
	opacity: 0.6;
}

.container {
	background-color: lightgrey;
	width: 500px;
	height: 200px;
	border: 10px solid green;
	padding: 50px;
	margin: 20px;
	margin-left: 350px;
	margin-top: 20px opacity: 50%
}
</style>
</head>
<body>
	<br>
	<br>
	<h2>
		<center>FLIGHT RESERVATION SYSTEM</center>
	</h2>

	<form action="LoginController" method="post">

		
		<div class="container">
			<%if(request.getAttribute("invaliduser")!=null){ %>
			<b><center><font color="red"><%= request.getAttribute("invaliduser") %><br></font></center></b>
			<%} %>
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="userid" required onkeypress="onlyAlphaAndNumber(event)" maxlength="10"> <br>
			<label for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="password" required maxlength="16"> <br>
			<br>
			<center>
				<button type="submit">Login</button>
			</center>

		</div>
		<!-- 

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button> 

		</div> -->
	</form>

</body>
</html>