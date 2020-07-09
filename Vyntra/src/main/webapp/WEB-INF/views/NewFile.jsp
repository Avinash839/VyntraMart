<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>

<html>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<style>
	img{
	width:100px;
	height:100px;
	}
</style>

<body>

<%
	try {

		String connectionURL = "jdbc:mysql://localhost:3306/vyntra";

		Connection connection = null;

		   PreparedStatement statement = null;

		
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");

		   PreparedStatement stmt=connection.prepareStatement("select * from vyntra.product_details ");  

		   ResultSet rs=stmt.executeQuery();  
		
		while (rs.next()) {
			String im=rs.getString(10);
			String arr[]=im.split(" ");
			
				%> <div class="container gallery">
				<div class="row">
				<div  class="col-lg-4 col-sm-2 col-md-6" ><div class="thumbnail" ><img style="width:300px;height:450px;" src="<%=arr[1]%>" >
				</div></div>
				
			<% %>
			
	<%}
	}
catch(Exception e){
	System.out.println(e);
}
		
	%></div>
	</div>
</body>
</html>