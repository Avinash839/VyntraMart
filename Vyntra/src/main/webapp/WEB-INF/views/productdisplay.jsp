<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<style>
	img{
	border-radius:5px;
	}
	.mybutt{
            margin-top: 20px;
            margin-bottom: 20px;
            margin-left: 20%;
            width: 80px;
            height: 40px;}
                  nav {
          display: flex;
          height: 80px;
          background-color: white;
          box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        nav a {
          flex: 1;
          text-decoration: none;
          display: flex;
          justify-content: center;
          align-items: center;
          font-size: 1.5rem;
          color: black; 
            margin-left: 30px;
    margin-right: 30px;
          transition: all 0.2s;
        }

        nav a:hover{
          background: #2196F3;
          color: white;
          
        }
</style>
<body>
<nav>
          <a href="#home" >Home</a>
          <a href="#home" >About</a>
          <a href="#home">Contact</a>
          <a href="#home">Help</a>
          <a href="#home">Wishlist</a>
          <a href="#home">Cart</a>
          <a href="loginpage">My Profile</a>
          <a href="logout"> Log out</a>
        </nav>
<%
	try {

		String connectionURL = "jdbc:mysql://localhost:3306/vyntra";

		Connection connection = null;

		   Statement statement = null;
		 
		ResultSet rs = null;

		Class.forName("com.mysql.jdbc.Driver").newInstance();

		   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");

		statement = connection.createStatement();
		String product_id=(String)request.getAttribute("product_id");
		String login_id=(String)request.getAttribute("login_id");
		System.out.println(login_id);
		String QueryString = "SELECT *,(price - (price*discount/100))as rate from vyntra.product_details where product_id="+"'"+product_id+"'";
		rs = statement.executeQuery(QueryString);
		while (rs.next()) {
			String im=rs.getString(10);
			String arr[]=im.split(" ");%>
			<div class="photo" style="float:left;margin-left:7%">
			<img  src="<%=arr[1]%>" style="width: 300px;height: 450px;">
			<img  src="<%=arr[2]%>" style="width: 300px;height: 450px;">
			</div>
			<div class="info" style="margin-left:60%">
			
			<h2><%=rs.getString(2).substring(0, 1).toUpperCase() + rs.getString(2).substring(1)+" "+(rs.getString(8).equals("m")?"Men's":"Women's" )+" "+rs.getString(3)%></h2>
			
			
			<%if(rs.getFloat(5)!=0){
				%><h2 style="text-decoration: line-through">@ Rs.<%=rs.getFloat(4) %></h2>  <h2>@ Rs.<%=rs.getFloat(11) %></h2><% 
			}
			else{
				%><h2>@ Rs.<%=rs.getFloat(11) %></h2><% 
			}
			%>
			<form action="add_to_wishlist" method="get">
				<input type="text" name="login_id" value="<%=login_id %>" hidden />
				<input type="text" name="product_id" value="<%=product_id %>" hidden />
				<input type="submit" class="mybutt" value="Add to Wishlist">;
			</form>
			</div>
			<br><br>
			<form action="add_to_cart">
				<input type="text" name="login_id" value="<%=login_id %>" hidden />
				<input type="text" name="product_id" value="<%=product_id %>" hidden />
				<input type="submit" class="mybutt" value="Add to Cart">;
			</form>
			
			<%}}
catch(Exception e){
	System.out.println(e);
}
		%>
</body>
</html>