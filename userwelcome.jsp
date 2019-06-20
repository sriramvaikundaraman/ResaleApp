<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
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
.productname
{
  padding: 10px;
  margin-left: 100px;
}

.sep
{
  width: 200px;
  margin-left: 38%;
}


input[type=submit]:hover
{
	background-color: #43b26e;
	color: white;
}
</style>
<script type='text/javascript'>
     function submit()
      {
         document.forms["myform"].submit();
         return false;
      }
   </script>

<body>

<div class="topnav" style="height: 65px;">
  <a class="active" href="chatlist.jsp">Chats</a>
  <a href="myproducts.jsp">MyProducts</a>
  <a href="myrequests.jsp">Requests</a>
  <a href="updateprofile.jsp">Update Profile</a>
  <form action="search.jsp" style="float: left; ">
    <input type="text" style="padding: 10px;margin-top: 10px;" name="search" placeholder="Search products here">
    <input type="submit" name="submit" value="Search" style="padding:10px;margin-top: 10px;" >
  </form>
  
  <div class="topnav-right">
    <form action="signout" style="float: left;">
    <input type="submit" style="padding:10px;margin-top: 10px;" value="SignOut" >
</form>
    

    <a href="userprofile.jsp"><%=(String)session.getAttribute("user")%></a>

    	<%


    	try{

		Connection con = null;
		ResultSet resultSet = null;
		con = ConnectionManager.getConnection();
	    String user = (String)session.getAttribute("user");
        //out.println(user);
        PreparedStatement stmt2=con.prepareStatement("select names from user where email=?");
        stmt2.setString(1,user);
        ResultSet rs=stmt2.executeQuery();
        rs.next();
        String username=rs.getString(1);




        %></a>
       
  </div>
</div>

<div style="padding-left: 16px">
  <h2>Buy and Sell here</h2>
</div>
<h1 align="center"> Welcome    <%=username%></h1>
<form action="imageuploader.jsp" class="sep">
  <input type="submit"  style="padding: 1em 5em; margin-left: 32% "  value="Sell your product" ></form>


<br><br>
<%

PreparedStatement stmt1=con.prepareStatement("select * from uploadedfiles where email!=?");
stmt1.setString(1,user);
resultSet = stmt1.executeQuery();
while(resultSet.next()){
%>
<div >
<form action="details.jsp" id="myform" >
<div class="container" > 
	<a href="javascript: document.form.submit();"onclick="javascript:this.form.submit();"  type="submit">
<img src="<%=resultSet.getString(3) %>"   />


<input type="hidden" name="hidden" value="<%=resultSet.getString(1) %>">
<input type="submit" class="productname" id="productname" style="margin-left: 100px; border:none; margin-top: 30px;" name="submit" value="<%=resultSet.getString(6) %>">
</form>
<p style="font-size: 20px;text-align: center;">Rs.<%=resultSet.getString(7) %></p>
<p style="font-size: 13px;text-align: center;"><%=resultSet.getString(9) %></p>
<p style="font-size: 13px;text-align: center;"><%=resultSet.getString(8) %></p>
</a>
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

<%
}
%>
</table>
</body>
</html>