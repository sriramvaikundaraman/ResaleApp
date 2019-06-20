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
    // Already created.

 
    // Already created.
%>
<!DOCTYPE html>
<html>
<style type="text/css">
	td,tr
	{
		padding: 10px;
	}
</style>
<body>

<h1 align="center">List of all users</h1>
<table border="1" align="center">
<tr>
<td> name</td>
<td>email</td>
<td>City name</td>
<td>Contact</td>

</tr>
<%
try{
Connection con = ConnectionManager.getConnection();
statement=con.createStatement();
String sql ="select * from user";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("names") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("doorno") %>,<%=resultSet.getString("street") %>,<%=resultSet.getString("locality") %>,<%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("contactno") %></td>
<td>
	<form action="userremove" method="post"  onsubmit="return confirm('Are you sure you want to remove user?');">
		<input type="hidden" name="hidden" value="<%=resultSet.getString(2)%>">
		<input type="submit" name="submit" value="Remove <%=resultSet.getString(1)%> ">
	</form>
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