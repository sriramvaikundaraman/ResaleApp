<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
<head>
	<title>Image Uploader</title>
</head>
<style>
	td,tr
	{
		padding: 20px;

	}
	input[type=submit]
	{
		padding: 20px;
		margin-left: 25%;
		width: 200px;
	}
	input[type=submit]:hover{
	background-color: #43b26e;
	color: white;
}
</style>
<body style="background-color: #d7dae0;margin-top: 70px;">
	<center>
		
		<div style="margin-left: 30%;margin-right: 30%;background-color: white;box-shadow: 10px 10px 40px; border-radius: 10px;padding: 10px;">
		<h1>Sell your Product</h1>

		<form method="post" action="uploader.jsp" ENCTYPE="multipart/form-data" onsubmit="return confirm('Do you really want to add this item?');" >
			<table border="0" >

                        <tr>
                              <td>Enter the title:</td>
                              <td><input type="text" required="" name="title" id="title"></td>
                        </tr>
                         <tr>
                              <td>Enter the Price:</td>
                              <td><input type="number" required="" name="price" id="title"></td>
                        </tr>
                        <tr>
                              <td>Enter Category </td>
                              <td>
                              <select name="category" required="">
                        		<option value="Vehicle">Vehicle</option>
                        		<option value="Mobile">Mobile</option>
                        		<option value="Laptop">Laptop</option>
                        		<option value="Electronic Gadget">Electronic Gadget</option>
                        		<option value="Furniture">Furniture</option>
                        		<option value="other">Other</option>
                              </select>
                              </td>
                        </tr>

                        <tr >
                              <td>Enter the Description:</td>
                              <td ><input type="text" required="" style="width:200px ;height:100px;"  name="description" id="title"></td>
                        </tr>
                      
				
				<tr>
					<td>Upload Your photo : </td>
					<td><input type="file"  required=""  name="photo" id="photo" >
					</td>
				</tr>
			
				<tr>
					<td colspan="2">
						<input type="submit" value="upload">
					</td>
				</tr>
				
			</table>
		</form>
		</div>
	</center>

</body>
</html>
<%
}
%>