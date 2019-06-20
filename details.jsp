<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>

<%
session=request.getSession();
if (session.isNew()) {
    out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} else {
%>
<!DOCTYPE html>
<html>
<head>
	<title>Product details</title>
	<style>


	img{
    border-radius: 5%;
     display: block;
    width:  500px;
    height: 600px;
    background-repeat:   no-repeat;
    vertical-align: middle;
    margin-right: auto;
    margin-left: auto;
}
    div.gallery {
  margin: 5px;
  border: 1px solid #ccc;
  float: left;
  border-radius: 5%;
  background-color: white;
  padding :0px;
  box-shadow: 5px 5px 20px;
}

div.gallery:hover {
  border: 1px solid #777;
}



div.desc {
  padding: 10px;
  text-align: center;
  float: left;
  margin-left: 70px;
  width: 900px;
  height: 600px;
  border: 1px solid #ccc;
  border-radius: 5%;
  background-color: white;
  padding :0px;
  box-shadow: 5px 5px 20px;
}
.registerbtn {
	 border-radius: 10% 10% 10% 10%;
  background-color:#737984;
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
<body style="background-color: #e3e6ea;margin-top: 50px;">
<%
String ids=request.getParameter("hidden");
try{

//if (session.getAttribute("id") == null||session.getAttribute("id") == "")
session.removeAttribute("id");
//out.println(session.getAttribute("id"));
Connection connection=ConnectionManager.getConnection();  
//Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sriram?useSSL=false","root","");
PreparedStatement stmt=connection.prepareStatement("select * from uploadedfiles where id = ?");
stmt.setString(1,ids);
ResultSet rs=stmt.executeQuery();
rs.next();


%>
	

<div class="gallery">
  <a target="_blank" href="<% rs.getString(1); %>">
    <img src="<%=rs.getString(3) %>" >
  </a>
  


</div>
<div class="desc">
  <h1 align="center">    <%=rs.getString(6)%> </h1>
    <h2>Rs.<%=rs.getString(7)%></h2>
    <p>Category :<%=rs.getString(8)%></p>
    <h2>Description : <%=rs.getString(9) %></h2>
    <h4>Uploaded on : <%=rs.getString(4) %></h4>
    <h4>Uploaded by</h4>
    <h4><%=rs.getString(2) %></h4>
    <form action="requests.jsp" method="post">
      <input type="hidden" name="hidden" value=  "<%=ids%>">
      <input type="submit" name="submit" class="registerbtn" value=" Request">
    </form>


    <form action="chat.jsp" method="post">
      <input type="hidden" name="hidden" value="<%=ids%>">
      <input type="submit"  name="submit" class="registerbtn" value=" Chat">
    </form>
   <br>
    
    <a style="text-align: center;"  href="userwelcome.jsp">Home</a>



</div>







<%

}
        catch(Exception e)
        {
            out.println(e);
            
        }
    }



%>
</body>
</html>