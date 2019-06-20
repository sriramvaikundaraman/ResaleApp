<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.connect.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
session = request.getSession();
if (session.isNew()) {
    out.println("<h1> Please Login to continue..</h1>");
    out.println("<a href='index.jsp'>Home</a>");
} else {

		String remail="";
        session = request.getSession();
 		String user = (String)session.getAttribute("user");
 		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#div
	{
		color: blue;
	}
</style>
</head>
<body>
<script type="text/javascript">
	var jsonStr='${msgsjson}';
	var json = JSON.parse(jsonStr);
	json.forEach(function(msg){
		msgs(msg);	
	});
	function msgs(msg){

		var div=document.createElement('div');
		div.id="mydiv";
		div.style.padding="10px";
		div.style.width="300px";

		if(msg.semail=="<%=user%>"){
			div.setAttribute('align',"right");
		    div.style.backgroundColor = "green";
		    div.style.marginLeft="60%";
	    }
		else
		{
			div.setAttribute('align',"left");
		}
		div.innerHTML=msg.semail+"&nbsp;&nbsp;&nbsp;&nbsp;"+msg.msg;
		document.getElementById("chatbox").appendChild(div);
		linebreak = document.createElement("br");
        document.getElementById("chatbox").appendChild(linebreak);



	}
</script>
<div id="messages"></div>
</body>
</html>
<%
}
%>