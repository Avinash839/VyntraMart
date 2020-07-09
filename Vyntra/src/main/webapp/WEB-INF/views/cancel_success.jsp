<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String str=(String)request.getAttribute("order_id"); %>
your order of id <%=str %> is cancelled as per your request
</body>
</html>