<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>
<%@page session="false"%>


<!DOCTYPE html>
<html>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a  {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.topnav button: {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.topnav button:hover {
  background-color: #ddd;
  color: black;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav-right {
  float: right;
}
</style>
<style type="text/css">
    h3,h6
    {
      text-align: center;

    }
    input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}
    img {
     display: block;
    width:  100px;
    height: 100px;
    background-repeat:   no-repeat;
    vertical-align: middle;
    margin-right: auto;
    margin-left: auto;
    border-radius: 10px;
   

}

a{
  text-decoration: none;
  color: black;
  font-family: monospace;
}
.container {
  float: left;
  margin: 12px;
  padding: 25px;
  background-color: white;
  border-radius: 10%;
  
  width: 300px;
  box-shadow: 10px 10px 40px;
}
input[type=submit]{
  width: 200px;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
.sep
{
  width: 200px;
  margin-left: 38%;
</style>

<body>

<div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="#contact">Contact</a>
  <div class="topnav-right">
    <a href="adminlogin.jsp">Admin Login</a>
     <a href="signin.html">SignIn</a>
      <a href="signup.html">SignUp</a>


  </div>
</div>

<div style="padding-left: 16px">
  <h2>Buy and Sell here</h2>
  <p>sriram.v</p>
</div>
<h1 align="center"> Welcome User</h1>



<br>
<%
try{

Connection con = null;
ResultSet resultSet = null;
con = ConnectionManager.getConnection();
PreparedStatement stmt1=con.prepareStatement("select * from uploadedfiles where status=0");
resultSet = stmt1.executeQuery();
while(resultSet.next()){
%>
<div >

<div class="container" >
<img src="<%=resultSet.getString(3) %>" />

<form action="signin.html">
<input type="hidden" name="hidden" value="<%=resultSet.getString(1) %>">
<input type="submit" style="margin-left: 50px; margin-top: 30px;" name="submit" value="<%=resultSet.getString(6) %>">
</form>
<p style="font-size: 20px;text-align: center;">Rs.<%=resultSet.getString(7) %></p>
<p style="font-size: 13px;text-align: center;"><%=resultSet.getString(9) %></p>
<p style="font-size: 13px;text-align: center;"><%=resultSet.getString(8) %></p>
</div>
</div>



<%
}

con.close();
}
catch (Exception e) {
e.printStackTrace();
}

%>
</table>
</body>
</html>