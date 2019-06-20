<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>



<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
//HttpSession session =null;
session = request.getSession();
if (session.isNew()) {
 out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
   
} else {
    
%>
<!DOCTYPE html>
<html>
<style type="text/css">
	td,tr{
		padding-left: 60px;
		padding-right: 60px;
	}
	input[type=submit],input[type=email]
	{
		padding: 20px;
		box-shadow: 10px;
		border-radius: 10%;
	}
	body {
  font-family: Arial, Helvetica, sans-serif;
  background-color:#929eb2;
  margin-left: 400px;
  margin-right: 400px;
  margin-top: 100px;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
  border-radius: 3%;
  box-shadow: 10px 10px 40px;
  height: 500px;
  overflow-y: scroll;
}
input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}
</style>
<body>
	<div class="container">
		<center>
			<h1>New Chat</h1>
	<div class="newchat">
		<form action="newchat.jsp" method="post">
			<input type="email" name="email" placeholder="Enter the receiver mail ID">
			<input type="submit" name="submit" value="Start Chat">
		</form>



	</div>
</center>


<h1 align="center">Recent Chats</h1>

<table border="1" align="center">
<tr>
<td> name</td>
<td>select</td>

</tr>
<%
try{
session=request.getSession();
//if (session.getAttribute("recv") == null||session.getAttribute("recv") == "")
session.removeAttribute("recv");
Connection con = ConnectionManager.getConnection();
statement=con.createStatement();
String user = (String)session.getAttribute("user");
PreparedStatement stmt1=con.prepareStatement("select  semail as email from chats  where semail=? or remail=? union select remail from chats where semail=? or remail=?");
stmt1.setString(1,user);
stmt1.setString(2,user);
stmt1.setString(3,user);
stmt1.setString(4,user);

resultSet = stmt1.executeQuery();
while(resultSet.next()){
if(!resultSet.getString("email").equals(user)&&!resultSet.getString("email").equals("null"))
{
%>
<tr>
<td><%=resultSet.getString("email") %></td>
<td>
<form action="mychat.jsp">
	<input type="hidden" name="hidden" value="<%=resultSet.getString(1)%>" >
	<input type="submit" name="submit" value="Chat now">
</form>
</td>
</tr>







<%
}
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
}
%>
</table>
<br><br>
<a href="userwelcome.jsp" style="margin-left: 49%">Home</a>
</div>
</body>
</html>