<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
<title>Status Processing</title>
</head>
<body>
<div class = "main">
<header>ABC Protection Plan Inc.</header>
<form>
<a href="AdminMainPage.jsp">Go Admin Main Page</a>
<%
		// Connect to the server
		Class.forName("com.mysql.jdbc.Driver");
		String username = "root";
		String password = "root";
		String url = "jdbc:mysql://localhost:3306/week10projectdb";
		Connection con = DriverManager.getConnection(url, username, password);
		String status = request.getParameter("status");
			String sql= "update claimdetails set status = '" + status + "' where dateofclaim = '" + request.getParameter("DateOfClaim") + "' and serialNumber = '" + request.getParameter("serialNumber") + "'";
			Statement st = con.createStatement();
			st.execute(sql);
			%> <h1 style = "color = white">Status of Serial Number <%=request.getParameter("serialNumber")%> has been <%= status%></h1>
		



</form>
</div>
</body>
</html>