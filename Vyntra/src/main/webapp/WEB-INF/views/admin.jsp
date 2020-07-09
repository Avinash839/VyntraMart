<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> 
    </script> 
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
<body>
<%String login_id=(String) request.getAttribute("login_id");%>
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'Add_product')">Add product</button>
  <button class="tablinks" onclick="openCity(event, 'Delete_product')">Delete product</button>
  <button class="tablinks" onclick="openCity(event, 'Edit_discount/rate')">Edit discount/rate</button>
  <button class="tablinks" onclick="openCity(event, 'Support_work')">Support work</button>
  <button class="tablinks" onclick="openCity(event, 'Stock_management')">Stock management</button>
  <button class="tablinks" onclick="openCity(event, 'Order_Status_management')">Order Status management</button>
    
</div>

<div id="Add_product" class="tabcontent">
  <form action="add_product">
     Product_code <input type="text" name="product_id"><br>
     Brand_name  <input type="text" name="brand_name"><br>
     Category <input type="text" name="category"><br>
     Price <input type="text" name="price"><br>
     Discount <input type="text" name="discount"><br>
     Colour <input type="text" name="colour"><br>
     Rating <input type="text" name="rating"><br>
     Ideal for <input type="text" name="ideal"><br>
     Supplier <input type="text" name="supplier"><br>
     Pic Links<input type="text" name="pics"><br>
     Quantity available<input type="text" name="quantity"><br>
      <input type="submit" value="Add">
  </form>
</div>

<div id="Delete_product" class="tabcontent">
  <form action="delete_product">
  Product_code  <input type="text" name="product_id"><br>
      <input type="submit" value="Delete">
  </form>
</div>

<div id="Edit_discount/rate" class="tabcontent">
  <form action="edit_discount/rate">
   Product_code <input type="text" name="product_id"><br>
    New Discount<input type="text" name="discount"><br>
      New Rate<input type="text" name="discount"><br>
     <input type="submit" value="Update">
  </form>
</div>

<div id="Support_work" class="tabcontent">
  Support works
</div>

<div id="Stock_management" class="tabcontent">
  <form action="Stock_management">
  Product_code  <input type="text" name="product_id"><br>
  Number of Arrival <input type="text" name="Extra goods"><br>
      <input type="submit" value="Update">
  </form>
</div>

<div id="Order_Status_management" class="tabcontent">

	<input class="myinput" type="text" id="gfg" onkeyup="myFunction()" placeholder="Search for order_id.." >
	
	<%
try {

String connectionURL = "jdbc:mysql://localhost:3306/vyntra";

Connection connection = null;

   Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

   connection = DriverManager.getConnection(connectionURL, "root", "AVINASHjay123@");

statement = connection.createStatement();

String QueryString = "SELECT * from vyntra.orders	";
rs = statement.executeQuery(QueryString);
%><div class ="div">
<table class="mytab" id="tables">
 <thead>
<tr class="header">
    <th style="width:20%;">Order_id</th>
    <th style="width:20%;">Customer_id</th>
    <th style= "width:20%;">Amount</th>
    <th style="width:20%;">Order_status</th>
  </tr>
   </thead>
  <tbody id="geeks">
<%
while (rs.next()) {
%>
<tr onclick="javascript:showRow(this);">
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
</tr>
<% }
 %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</tbody>
<font size="+3" color="red"></b>
<%
out.println("Unable to connect to database.");
}
%>
</table>
</div>
<p id="demo"></p>
<form action="Order_Status_management" method="get">
 <input type="text" value=<%=login_id %> hidden/>
order id :<input type="text" class="tes" name="order_id" id="firstname" /><br>

order status : <input type="text" class="tes" name="order_status" /><br>
<input type="submit" class ="tes" value="Update">
</form>

    <form action="/login_to_myaccount">
    <input type="text" value=<%=login_id %> hidden/>
        <input  type="submit"  value="Back to Home"><br></form>
</div>    

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
   <script> 
            $(document).ready(function() { 
                $("#gfg").on("keyup", function() { 
                    var value = $(this).val().toLowerCase(); 
                    $("#geeks tr").filter(function() { 
                        $(this).toggle($(this).text() 
                        .toLowerCase().indexOf(value) > -1) 
                    }); 
                }); 
            }); 
            
            
            $(document).ready(function(){
                $("#tables").children("tbody").children("tr").children("td").click(function(){
                    $(this.parentNode).toggleClass("active");
                });
            });
            
            var name="";
            function showRow(row)
            {
            var x=row.cells;
            document.getElementById("firstname").value = x[0].innerHTML;
                name= x[1].innerHTML;
              
            }
            function call(){
            	window.location.replace("remove.jsp?name="+name);
            }
        </script>
</body>
</html> 
