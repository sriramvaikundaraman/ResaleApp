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

			String id=request.getParameter("hidden");
			String user = (String)session.getAttribute("user");
        	 java.util.Date dt = new java.util.Date();

            java.text.SimpleDateFormat sdf = 
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            String currentTime = sdf.format(dt);

            String currentdate=currentTime.substring(0,10);
            String currenttime=currentTime.substring(11);
       

%>
<!DOCTYPE html>
<html>

<head>
	<title>Request</title>
	<style type="text/css">
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
  border-radius: 0%;
  box-shadow: 10px 10px 40px;
  background-color: white;
}

/* Full-width input fields */
input[type=number] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=submit]{
  
  background-color: blue;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
   cursor: pointer;
  width: 50%;
  opacity: 0.9;


}
input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}

	</style>
</head>
<body>
	<form action="amountreq" method="post">
		<div class="container">
			<h1> Enter the amount to request this product</h1>
			<p>You can request maximum of 10% of the actual cost</p>
			
				
		<input type="hidden" name="hidden" value="<%=id%>">
		<input type="number" name="amount" placeholder="Enter your desired amount">
		<input type="submit" name="submit" value="submit">
	</div>
	</form>

</body>
</html>

<%
}
%>