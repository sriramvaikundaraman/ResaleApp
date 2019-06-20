<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>

<%
String id="";
 session = request.getSession();
 if (session.isNew()) {
    out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} 

else {
try{
 	String user = (String)session.getAttribute("user");
 	  
	if (session.getAttribute("id") == null||session.getAttribute("id") == "")
  	id=request.getParameter("hidden");
  	else
 	id=(String)session.getAttribute("id");

 	session.setAttribute("id",id);
 	 Connection con=ConnectionManager.getConnection();  

  //out.println(id);

 	 PreparedStatement stmt1=con.prepareStatement("select email from uploadedfiles where id =?");
  stmt1.setString(1,id);
  ResultSet rs=stmt1.executeQuery();
  rs.next();
  String remail=rs.getString("email");
  PreparedStatement stmt=con.prepareStatement("create table if not exists chats(semail varchar(30),remail varchar(30),msg varchar(300), dates date,times time);");
        stmt.executeUpdate();
  PreparedStatement stmt2=con.prepareStatement("select * from chats where semail=? and remail=? or semail=? and remail=?");
  stmt2.setString(1,user);
  stmt2.setString(2,remail);
  stmt2.setString(3,remail);
  stmt2.setString(4,user);
  rs=stmt2.executeQuery();
  %>


<!DOCTYPE html>
<html>
<head>
	<title>Chat</title>
	<script type="text/javascript">
		
		function scrollbottom()
		{
			
			var out = document.getElementById("scroll");
			var isScrolledToBottom = out.scrollHeight - out.clientHeight <= out.scrollTop + 1;
			if(!isScrolledToBottom)
   					 out.scrollTop = out.scrollHeight - out.clientHeight;
   			
		}

	</script>

	<style type="text/css">
		body{
			margin-left: 30%;
			margin-right: 30%;
		}

		.container{
			
			background-color: grey;
			padding: 20px;
			margin-right: 30%;
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}

		
		.scroll
		{
			overflow-y: scroll;
			height: 430px;
			padding: 30px;
		}
	</style>
</head>
<body onload="scrollbottom()"  style="background-color: #d5d9e0">
	<h1 align="center">Chat</h1>

	<h2 align="center"><%=remail%> </h2>
	<div class="scroll" id="scroll" style="background-color: white;border-radius: 5px;box-shadow: 5px 5px 10px;" >

<%
while(rs.next())
{
	if(!rs.getString(1).equals(user))
{

%>
	<div class="container" style="width: 50%">
		<p style="float: right; font-size: 22px;"><%=rs.getString(3)%></p>
		<p ><%=rs.getString(1)%></p>
		
		<p style="float: left"> <%=rs.getString(5)%></p>
		
	
	</div>
	<br>

	<%
	}

	else
	{

%>


	<div class="container2"  id="container2" style="background: #b3e5c4;padding: 20px;border-radius: 5px;margin: 10px;color:black;width: 50%; margin-left: 45%">
		<p style="float: right; font-size: 22px;"><%=rs.getString(3)%></p>
		<p >You  : </p>
		
		<p style="float: left"> <%=rs.getString(5)%></p>
		<br>
</div>

<%

	}

}

	%>

</div>
	<br>
	<form action="userwelcome.jsp">
		<input type="submit" name="submit" style="float: left;padding: 20px;background: #eaea83;box-shadow: 3px 3px 10px;" value="Home">
	</form>
	<form action="chat.jsp">
		<input type="submit" name="submit" style="float: left;padding: 20px;background: #eaea83;box-shadow: 3px 3px 10px;" value="Check">
	</form>
	
	<form action="chatsend" method="post">
		<input type="hidden" name="semail" value="<%=user%>">
		<input type="hidden" name="remail" value="<%=remail%>">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="text" name="msg" placeholder="Type your message here" style="padding:20px;margin-left: 20%;box-shadow: 3px 3px 10px;">
		<input type="submit" name="submit" style="padding: 20px; vertical-align: center;box-shadow: 3px 3px 10px;">
	</form>


	<%
	con.close();
} catch (Exception e) {
e.printStackTrace();
}
}
%>



</body>
</html>