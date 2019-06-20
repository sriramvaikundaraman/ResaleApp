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
<style type="text/css">
	input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}
</style>
<body>
<center>
<h1 align="center">Welcome Admin</h1>
<form action="allusers.jsp">
<input type="submit"  name="allusers" style=" padding: 1em 5em"  value="All users">
<br><br>
</form>
<form action="allproducts.jsp">
<input type="submit" style=" padding: 1em 5em" name="allorders" value="All Products">
<br><br>
</form>

<form action="signout">
<input type="submit" style=" padding: 1em 5em" name="signout" value="SignOut">
</form>
</center>


<%
}
%>
</table>
</body>
</html>