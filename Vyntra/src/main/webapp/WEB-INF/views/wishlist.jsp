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
body{
bacground-image:url(bg.png);
}
	.mybutt{
            border-radius:5px;
            width: 80px;
            height: 40px;
        }
        .wishlist{
            margin-left: 30%;
            width: 85px;
            height: 40px;
        }
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
          font-size: 1.2rem;
          color: black; 
          transition: all 0.2s;
        }

        nav a:hover{
          background: #2196F3;
          color: white;
          
        }
</style>

<body>
<nav>
          <a href="#home">Home</a>
          <a href="#home" >About</a>
          <a href="#home">Contact</a>
          <a href="#home">Help</a>
        
          <a href="profile_details">My Profile</a>
          <a href="logout" >Log out></a>
        </nav>
<%
	try {

		String connectionURL = "jdbc:mysql://localhost:3306/vyntra";

		Connection connection = null;

		   Statement statement = null;

		ResultSet rs = null;
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String login_id=(String)request.getAttribute("login_id");
		String wishlist_id=(String)request.getAttribute("wishlist_id");
		   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");
		
		statement = connection.createStatement();

		
		
		   PreparedStatement stmt=connection.prepareStatement("select * from product_details join "+wishlist_id+" on vyntra.product_details.product_id = "+wishlist_id+".product_id");  

		    rs=stmt.executeQuery();  
		
		while (rs.next()) {
			String im=rs.getString(10);
			String arr[]=im.split(" ");
			
				%>
				 <div class="container gallery">
					<div class="row">
						<div  class="col-lg-4 col-sm-2 col-md-6" >
							<div class="thumbnail" ><img style="width:300px;height:450px;" src="<%=arr[1]%>" id="<%=rs.getString(1) %>">
								<form method="get" action="getproduct" >
									<input type="text" class="mybutt" name="product_id" value=<%=rs.getString(1)%>  hidden />
									<input class="mybutt" type="submit" value="View">  
								</form>
							</div>
						</div>
					</div>
				</div>
			
	<%}
	}
catch(Exception e){
	System.out.println(e);
}
		
	%>
</body>
</html>