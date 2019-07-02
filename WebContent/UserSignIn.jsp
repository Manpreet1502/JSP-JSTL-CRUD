<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Sign In</title>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
</head>
<body>
<div class = "main">
<header>ABC Protection Plan Inc.</header>
	<form method="post" class="center-block">
	<h1>User SignIn</h1>
		<p>
			Username : <input type="text" name="username" />
		</p>
		<p>
			Password : <input type="password" name="password" />
		</p>
		<input type="submit" name="submit" value="Submit" />
	</form>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		String username = "root";
		String password = "root";
		String url = "jdbc:mysql://localhost:3306/week10projectdb";
		Connection con = DriverManager.getConnection(url, username, password);
		Statement st = con.createStatement();
		if (request.getParameter("submit") != null) {
			String sql = "Select * from UserDetails where username='" + request.getParameter("username")
					+ "' and password='" + request.getParameter("password") + "'";
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				String uName = rs.getString(1);
				String pass = rs.getString(2);
				session.setAttribute("username", uName);
				response.sendRedirect("UserMainPage.jsp");

			} else {
	%>
	<h2>User does not exists! Please sign up!</h2>
	<br />
	<a href="UserSignUp.jsp">Sign Up</a>
	<%
		}
		}
	%>

</div>
</body>
</html>