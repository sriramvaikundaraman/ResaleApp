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
String user = (String)session.getAttribute("user");
//HttpSession session =null;
session = request.getSession();
if (session.isNew()) {
out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} else {
%>
<!DOCTYPE html>
<html>
<head>
	
	<style type="text/css">
		td,tr{
			padding: 20px;
		}
	</style>
</head>
<body>

<h1 align="center">Hai <%=user%></h1>
<table border="1" align="center">
<tr>
<th> Requested by</th>
<th>Title</th>
<th>Amount</th>
<th>Date</th>
<th>Time</th>
</tr>
<%
try{
Connection con = ConnectionManager.getConnection();
PreparedStatement stmt1=con.prepareStatement("select * from requests left join uploadedfiles on requests.id=uploadedfiles.id where uploadedfiles.email=?");
stmt1.setString(1,user);
resultSet = stmt1.executeQuery();
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString(1) %></td>
<td><%=resultSet.getString(11) %></td>
<td><%=resultSet.getString("amount") %></td>
<td><%=resultSet.getString(9) %></td>
<td><%=resultSet.getString(10) %></td>
</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
}
%>
</table>
<br><br><br>
<center>
	<a href="userwelcome.jsp">Home</a>
</center>
</body>
</html>