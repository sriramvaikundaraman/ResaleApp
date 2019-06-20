<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>
<%

session = request.getSession();
if (session.isNew()) {
 out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} else {
%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Profile</title>
	<style type="text/css">
		
		.container
		{
			background-color: white;
			margin-left: 30%;
			margin-right: 30%;
			padding:20px;
			margin-top: 100px;
			border-radius: 10%;
			box-shadow: 10px 10px 40px;
			height: 600px;

		}
		input[type=submit],input[type=button],input[type=number],input[type=text]
		{
			padding: 20px;
			width: 300px;
		}

		input[type=submit]:hover,input[type=button]:hover
		{
			background-color:#43b26e;
			color: white;
		}




	</style>
	<script type="text/javascript">
			function showname()
			{
				var namebox=document.getElementById("name");
				var namesubmit=document.getElementById("namesubmit");
				namebox.style.visibility="visible";
				namesubmit.style.visibility="visible";

			}
			function showcontact()
			{
				var contactbox=document.getElementById("contact");
				var contactsubmit=document.getElementById("contactsubmit");
				contactbox.style.visibility="visible";
				contactsubmit.style.visibility="visible";

			}
			function check()
			{
			var n=document.getElementById("contact").value;
		
	    	if(n<5000000000||n>=9999999999)
			{
			alert("Enter a valid mobile number");
			document.getElementById("contact").focus();
			return false;
			}
			else
			{
			
			return true;
			}
		}
			


	</script>
</head>
<body style="background-color: #dee4ed">

<div class="container">
<center>
	<h1>Update Your Profile</h1>
	<input type="button" name="update name" onclick="showname()" value="Change your name"><br><br><br>
	<form action="updater" method="post">
	<input type="text" name="name" id="name" placeholder="Enter your new name" style="visibility: hidden;">
		<input type="submit" id="namesubmit" name="namesubmit" value="Change Name" style="visibility: hidden;">
	</form>
	<br><br><br>


	<input type="button" name="update contactno" onclick="showcontact()" value="Change Your contactno"><br><br><br>
	<form action="updater" method="post" onsubmit="return check()">
		<input type="number" name="contact" id="contact" placeholder="Enter your new mobile number" style="visibility: hidden;">
		<input type="submit" name="contactsubmit" id="contactsubmit" value="Change contact no" style="visibility: hidden;">

</center>
</form>
</body>
</html>
<%
}
%>