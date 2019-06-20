
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>





<%

   session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
  
function reload() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}

</script>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color:#929eb2;
  margin-left: 400px;
  margin-right: 400px;
  margin-top: 100px;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=email], input[type=password],input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #ce42f4;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}
</style>

</head>
<body onload="reload()">

<form action="adminsignin" method="POST" id="f">
  <div class="container">
    <h1 align="center" style="color: #ce42f4">Admin Login</h1>
   
    <hr>
    

    <label for="email"><b>Email</b></label>
    <input type="email" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>

    <button type="submit"  class="registerbtn">SignIn</button>
  </div>
  
</form>

</body>
</html>
