<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
<meta charset="ISO-8859-1">
<title>User Sign-Up</title>
</head>
<body>
<header>ABC Protection Plan Inc.</header>
	<div class="main">	
	
	
		<form method="post">
			<h1>User SignUp</h1>
			<p>
				Username : <input type="text" name="uName" />
			</p>
			<p>
				Password : <input type="password" name="pass" />
			</p>
			<p>
				Name : <input type="text" name="name" />
			</p>
			<p>
				Address : <input type="text" name="address" />
			</p>
			<p>
				Cell No. : <input type="text" name="phnNumber" />
			</p>
			<p>
				Email : <input type="text" name="email" />
			</p>
			<input type="submit" name="submit" value="Submit" />
		</form>
		<%
			// Connect to the server
			Class.forName("com.mysql.jdbc.Driver");
			String username = "root";
			String password = "root";
			String url = "jdbc:mysql://localhost:3306/week10projectdb";
			Connection con = DriverManager.getConnection(url, username, password);
			if (request.getParameter("submit") != null) {
									
				String usrName = request.getParameter("uName");
				String pswrd = request.getParameter("pass");
				String name = request.getParameter("name");
				String address = request.getParameter("address");
				String cellNo = request.getParameter("phnNumber");
				String email = request.getParameter("email");
				if(usrName== null || usrName.isEmpty()){
					%> <h2 style = "color: white">Enter username</h2> <%
				}else if(pswrd== null || pswrd.isEmpty()){	
				%> <h2 style = "color: white">Enter password</h2> <%
				}else if(name== null || name.isEmpty()){
					%> <h2 style = "color: white">Enter name</h2> <%
				}else if(address== null || address.isEmpty()){
					%> <h2 style = "color: white">Enter address</h2> <%
				}else if(cellNo== null || cellNo.isEmpty()){
					%> <h2 style = "color: white">Enter cell number</h2> <%
				}else if(email== null || email.isEmpty()){
					%> <h2 style = "color: white">Enter cell Email</h2> <%
				}else {
					
				String query = "INSERT INTO userdetails VALUES (?,?,?,?,?,?)";
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, usrName);
				pst.setString(2, pswrd);
				pst.setString(3, name);
				pst.setString(4, address);
				pst.setString(5, cellNo);
				pst.setString(6, email);
				pst.execute();
		%>

		<h2>You are now registered!</h2>
		<%
				}
			}
			
		%>
	</div>
</body>
</html>