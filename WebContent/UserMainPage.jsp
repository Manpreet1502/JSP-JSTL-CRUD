<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
	<div class="main">
	<header>ABC Protection Plan Inc.</header>
	<a href="UserSignIn.jsp" class="menuItem">Go User SignIn Page</a>
		<div class="menu">
			<h1>Perform User Operations</h1>

			<a	href="RegisterProduct.jsp" class="menuItem">Register Product</a> 
			<a href="UserRegisterProductDetails.jsp" class="menuItem">Add Claim</a> 
			<a href="ShowClaims.jsp" class="menuItem">Show Claims</a>
			
		</div>
		<form style = "width:80%; margin: 0 auto">

	<%
				ResultSet rs = null;
				PreparedStatement pst;
				Class.forName("com.mysql.jdbc.Driver");
				String username = "root";
				String password = "root";
				String url = "jdbc:mysql://localhost:3306/week10projectdb";
				Connection con = DriverManager.getConnection(url, username, password);
				Statement st = con.createStatement();
			%>
			
		</form>
		
	</div>
</body>
</html>