<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>
<%
    // Already

Statement statement = null;
ResultSet resultSet = null;


String email="";
String name="";
String contactno="";
String doorno="";
String locality="";
String street="";
String city="";
String pincode="";
String count1="";
String count2="";

session = request.getSession();
if (session.isNew()) {
 out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} else {
    
     email = (String)session.getAttribute("user");
     try
     {
	Connection con = ConnectionManager.getConnection();
	PreparedStatement stmt=con.prepareStatement("select * from user where email=?");
	stmt.setString(1,email);
	resultSet = stmt.executeQuery();
	resultSet.next();
	name=resultSet.getString(1);
	doorno=resultSet.getString(4);
	street=resultSet.getString(5);
	locality=resultSet.getString(6);
	city=resultSet.getString(7);
	pincode=resultSet.getString(8);
	contactno=resultSet.getString(9);
	PreparedStatement stmt1=con.prepareStatement("select count(*) from uploadedfiles where email=?");
    stmt1.setString(1,email);
    ResultSet rs1=stmt1.executeQuery();
    rs1.next();
    count1=rs1.getString(1);

    PreparedStatement stmt2=con.prepareStatement("select count(*) from uploadedfiles where email=? and status=1");
    stmt2.setString(1,email);
    ResultSet rs2=stmt2.executeQuery();
    rs2.next();
 	count2=rs2.getString(1);

    con.close();
} catch (Exception e) {
e.printStackTrace();
}







%>

<!DOCTYPE html>
<html>
<head>
	<title>Your profile</title>
	<style type="text/css">
		td,tr
	{
		padding: 20px;

	}
	.container
	{
		margin-left: 30%;
		margin-right: 30%;
		border-radius: 10%;
		background-color: white;
		box-shadow: 10px 10px 50px;
		padding: 20px;
		margin-top: 50px;
		margin-bottom: 50px;

	}
	</style>
</head>
<body style="background-color: #dee4ed">
	<center>
		<div class="container">
	<h1>Your Profile</h1>
	
	<table border="0" >


                        <tr>
                              <td>Name</td>
                              <td><%=name%></td>
                        </tr>
                         <tr>
                              <td>Email</td>
                              <td><%=email%></td>
                        </tr>

                          <tr>
                              <td>Contact number</td>
                              <td><%=contactno%></td>
                        </tr>
                         <tr>
                              <td>Total number of products uploaded</td>
                              <td><%=count1%></td>
                        </tr>
                         <tr>
                              <td>Total number of products sold</td>
                              <td><%=count2%></td>
                        </tr>
                         <tr>
                              <td>Door number</td>
                              <td><%=doorno%></td>
                        </tr>
                         <tr>
                              <td>Street</td>
                              <td><%=street%></td>
                        </tr>
                         <tr>
                              <td>Locality</td>
                              <td><%=locality%></td>
                        </tr>
                         <tr>
                              <td>City</td>
                              <td><%=city%></td>
                        </tr>
                         <tr>
                              <td>Pin Code</td>
                              <td><%=pincode%></td>
                        </tr>

			</table>
			<a href="userwelcome.jsp">Home</a>
			<br>
			<br>
			<br>
		</center>
	</div>

</body>
</html>

<%
}
%>