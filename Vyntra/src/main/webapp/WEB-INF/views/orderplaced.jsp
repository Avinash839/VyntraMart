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
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String login_id=(String)request.getAttribute("login_id");
		System.out.println(login_id+" from orderplaced.jsp");
		String total=(String)request.getAttribute("total");
		String cart_id=login_id.substring(0, login_id.indexOf("@"))+"_cart";
		String orders_id=(String)request.getAttribute("orders_id");
		
		   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");
		   Statement st = connection.createStatement();
		   ResultSet rs=st.executeQuery("SELECT order_id FROM orders");
		   int id=0;
		   if(rs.last()){
		   id=rs.getInt(1)+1;
		   }
		   st.executeUpdate("insert into orders values("+id+","+"'"+login_id+"'"+","+total+",'order placed')");
		   
		  %>
		  <h3>your order worth Rs.<%=total%> is placed successfully</h3>
		  <% rs=st.executeQuery("delete from "+cart_id); %>
		  <form action="login_to_myaccount">
		  	<input type="text" class="mybutt" name="login_id" value=<%=login_id %> hidden />
		  	<%System.out.println("login_id from orderplaced.jsp"+login_id); %>
		  	<input class="mybutt" type="submit" value="Explore More">
		  </form>
		  
		<%
	}
catch(Exception e){
	System.out.println(e);
}
		
	%>
	
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
