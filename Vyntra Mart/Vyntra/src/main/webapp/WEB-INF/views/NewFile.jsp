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
	<script>
        function changeImage(var id,var arr[1],var arr[2]) {
            var image = document.getElementById(id);
            if (image.src.match(arr[1])) {
                image.src = arr[2];
            }
            else {
                image.src = arr[1];
            }
            console.logln(id);
            console.logln(arr[1]);
            console.logln(arr[2]);
        }
    </script>
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

		   Statement statement = null;

		ResultSet rs = null;

		Class.forName("com.mysql.jdbc.Driver").newInstance();

		   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");

		statement = connection.createStatement();

		String QueryString = "SELECT * from vyntra.sample ";
		rs = statement.executeQuery(QueryString);
		while (rs.next()) {
			String im=rs.getString(2);
			String arr[]=im.split(" ");
			
				%> <div class="container gallery">
				<div class="row">
				<div  class="col-lg-4 col-sm-2 col-md-6" ><div class="thumbnail" ><img style="width:300px;height:450px;" src="<%=arr[1]%>" id="<%=rs.getInt(1) %>"><input type="button" onclick="changeImage(<%=rs.getInt(1)%>,<%=arr[1] %>,<%=arr[2] %>)" value="Change" />
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