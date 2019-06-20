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

		String remail="";
        session = request.getSession();
 		String user = (String)session.getAttribute("user");
   
		if (session.getAttribute("recv") == null||session.getAttribute("recv") == "")
 		remail=request.getParameter("hidden");
  		else
 		remail=(String)session.getAttribute("recv");

		session.setAttribute("recv", remail);
	
	%>
<!DOCTYPE html>
<html>
<head>
	<title>ChatPage</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
			<script type="text/javascript">
		
		function scrollbottom()
		{
			var out = document.getElementById("chatbox");
// allow 1px inaccuracy by adding 1
			var isScrolledToBottom = out.scrollHeight - out.clientHeight <= out.scrollTop + 1;
			if(!isScrolledToBottom)
   					 out.scrollTop = out.scrollHeight - out.clientHeight;
   			
		}
	</script>
	<style type="text/css">
		#chatbox
		{
			margin-left: 20%;
			margin-right: 20%;
			background-color: white;
			height: 450px;
			overflow-y: scroll;
		}
	</style>
</head>
<body style="background-color: grey" onload="scrollbottom()">
<h1 align="center">Chat page</h1>
<h2 align="center"><%=remail%></h2>
<div id="chatbox" class="chatbox"></div>
<form method="post">
		<input type="hidden" name="semail" id="semail" value="<%=user%>">
		<input type="hidden" name="remail" id="remail" value="<%=remail%>">
		<input type="text" style="width: 200px;margin-left: 30%;padding: 10px;" name="msg" id="msg" placeholder="Enter your msg here">
		<input type="submit" name="submit" id="submit_btn" value="send" style="padding: 10px;">
	</form>

</body>
<script type="text/javascript">
 
 function scrollbottom()
		{
			

			var out = document.getElementById("chatbox");
			var isScrolledToBottom = out.scrollHeight - out.clientHeight <= out.scrollTop + 1;
			if(isScrolledToBottom)
   					 out.scrollTop = out.scrollHeight - out.clientHeight;
   			//alert(out.scrollTop);
   			
		}


 $('#submit_btn').click(function(){
        	var semail=$('#semail').val();
        	var remail=$('#remail').val();
        	var msg=$('#msg').val();
        	//window.alert(msg);
        	if($.trim(msg)!='')
        		{
        		$.ajax({
        			url:"/olx/chatsender",
        			method:"post",
        			data:{"semail":semail,"remail":remail,"msg":msg},
        			success:function(data)
        			{	
        				if(data='ok'){
        				$('#text_box').val('');
        				}
        			}
        		});
        		}
        });
</script>
<script type="text/javascript">

	setInterval(function(){
     
        	$('#chatbox').load("/olx/chatsender").fadeIn("slow");
        },1);

	 </script>
</html>

<%
}
%>