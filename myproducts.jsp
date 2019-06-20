<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>

<%
Statement statement = null;
ResultSet resultSet = null;
session = request.getSession();
if (session.isNew()) {
    out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} else {
 
%>
<!DOCTYPE html>
<html>
<head>
	<title>Your products</title>
	<style type="text/css">
		h3,h6
		{
			text-align: center;

		}
		img {
     display: block;
    width:  100px;
    height: 100px;
    background-repeat:   no-repeat;
    vertical-align: middle;
    margin-right: auto;
    margin-left: auto;
   

}

input[type=submit]:hover
{
	background-color: black;
	color: white;
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
  margin-bottom: 70px;
  width: 300px;
  box-shadow: 10px 10px 40px;
}


.container1 {
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

input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}

	</style>
</head>
<body style="background-color: #e1e3e8">
<h1 align="center">Your Products</h1><br>
<h2 align="center">Unsold List </h2>

<%
try{
String user = (String)session.getAttribute("user");

Connection con = ConnectionManager.getConnection();

PreparedStatement stmt1=con.prepareStatement("select * from uploadedfiles where email=? and status =0");
stmt1.setString(1,user);
resultSet = stmt1.executeQuery();
while(resultSet.next()){
%>

<div class="container" >
<img src="<%=resultSet.getString(3) %>" />

<form action="mydetails.jsp">
<input type="hidden" name="hidden" value="<%=resultSet.getString(1) %>">
<input type="submit" style="margin-left: 50px; margin-top: 30px;" name="submit" value="<%=resultSet.getString(6) %>">
</form>
<p style="font-size: 20px;text-align: center;">Rs.<%=resultSet.getString(7) %></p>
<p style="font-size: 13px;text-align: center;"><%=resultSet.getString(9) %></p>
<p style="font-size: 13px;text-align: center;"><%=resultSet.getString(8) %></p>
</div>



<%
}

con.close();
} catch (Exception e) {
e.printStackTrace();
}

%>
<div style="clear: left;margin-top: 30px;">

<h2 align="center">Sold List</h2>


<%
try{
String user = (String)session.getAttribute("user");

Connection con1 = ConnectionManager.getConnection();
PreparedStatement stmt2=con1.prepareStatement("select * from uploadedfiles where email=? and status=1");
stmt2.setString(1,user);
resultSet = stmt2.executeQuery();
while(resultSet.next()){
%>

<div class="container1" >
<img src="<%=resultSet.getString(3) %>" />

<form action="mydetails.jsp">
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

con1.close();
} catch (Exception e1) {
e1.printStackTrace();
}
}



%>















</body>
</html>