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
            margin-left: 30px;
    margin-right: 30px;
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
          <a href="javascript:history.go(0)"class="active">Home</a>
          <a href="#home" >About</a>
          <a href="#home">Help</a>
          <a href="#home" class="active">View</a>
          <a href="profile_details" onclick="openCity(event, 'profile')">My Profile</a>
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
		
		   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");
		
		statement = connection.createStatement();

		
		
		PreparedStatement stmt=connection.prepareStatement("select order_id, amount,order_status from orders where customer_id ='login_id';".replace("login_id",login_id));  

	    rs=stmt.executeQuery();  

		while (rs.next()) {
			String order_id=rs.getString(1);
			String order_amount=rs.getString(2);
			String order_status=rs.getString(3);
			%>
			<h3>Order_id=<%=order_id %></h3>
			<h3>Order_amount=<%=order_amount %></h3>
			<h3>Order_Status=<%=order_status %></h3>
			<%
				if(order_status.equals("delivered")){
					%>
					<form action="return_order">
						<input type="text" name="order_id" value=<%=order_id %> hidden/>
						
						<input type="submit" value="Return Order" >
					</form>
					<%
				}
			if(order_status.equals("order placed")){
				%>
				<form action="cancel_order">
					<input type="text" name="order_id" value=<%=order_id %> hidden/>
					
					<input type="submit" value="Cancel Order" >
				</form>
				<%
			}
			%>
	<%}
	}
catch(Exception e){
	System.out.println(e);
}
		
	%></div>
	</div>
	</main>
	<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
</body>
</html>