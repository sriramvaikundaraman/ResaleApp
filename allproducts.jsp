<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>



<%
    // Already

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
	td,tr
	{
		padding: 10px;
	}
	img
	{
		width: 50px;
		height: 50px;
	}
	input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}
</style>
<body>

<h1 align="center">List of all Products</h1>
<table border="1" align="center">
<tr>
<td> Product Name</td>
<td>Photo</td>
<td>Amount</td>
<td>Uploaded Date</td>
<td>Uploaded Time</td>
<td>email</td>
<td>Status</td>

</tr>
<%
try{
String status="";
Connection con = ConnectionManager.getConnection();
statement=con.createStatement();
String sql ="select * from uploadedfiles";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
if(resultSet.getString("status").equals("0"))
{
     status="Unsold";
}
else
status="sold";
%>
<tr>
<td><%=resultSet.getString("title") %></td>
<td><img src="<%=resultSet.getString(3) %>" ></td>
<td><%=resultSet.getString(7) %></td>
<td><%=resultSet.getString(4) %></td>
<td><%=resultSet.getString(5) %></td>
<td><%=resultSet.getString(2) %></td>
<td><%=status%></td>
<td>
	<form action="adminproductremove" method="post"  onsubmit="return confirm('Are you sure you want to remove the file?');">
		<input type="hidden" name="hidden" value="<%=resultSet.getString(1)%>">
		<input type="submit" name="submit" value="Remove">
	</form>
</td>
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
</body>
</html>