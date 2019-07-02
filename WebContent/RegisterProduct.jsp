<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Product</title>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">

</head>
<body>
<div class = "main">
<header>ABC Protection Plan Inc.</header>
	<a href="UserMainPage.jsp">Go back</a>
	<form method="post" class="center-block">
	<h1>Register Product</h1>

		User Name : <h3>${sessionScope["username"]}</h3> Product Name
		: <select name="item">
			<option>Mouse</option>
			<option>Keyboard</option>
			<option>Monitor</option>
			<option>TV</option>
			<option>Refrigerator</option>
		</select> <br> Serial Number : <input type="text" name="snumber" /> <br>
		Purchase Date : <input type="date" name="pdate"> <br> <input
			type="submit" name="submit" value="Add product" /> <br>
	<%
		if (request.getParameter("submit") != null) {
			String uname = request.getParameter("uname");
			String productname = request.getParameter("item");
			String serialnumber = request.getParameter("snumber");
			String purchasedate = request.getParameter("pdate");
			
			Class.forName("com.mysql.jdbc.Driver");
			String username = "root";
			String password = "root";
			String url = "jdbc:mysql://localhost:3306/Week10projectdb";
			Connection con = DriverManager.getConnection(url, username, password);
			// create statement
			Statement st = con.createStatement();
			
			String sqlQuery = "select * from registerproduct where serialNumber='"  + 	request.getParameter("snumber") +"'";
			ResultSet rs = st.executeQuery(sqlQuery);
			
			if (serialnumber == null || serialnumber.isEmpty()) { %>
				<h2 style = "color: white"> Please Enter serial Number </h2><%
			}else if(rs.next()){ %>
				<h2 style = "color: white"> Serial Number already exists</h2>
			<% }
			else {
				
				String sql = "insert into RegisterProduct(username,productName,serialNumber,purchaseDate) values ('"
						+ uname + "','" + productname + "','" + serialnumber + "','" + purchasedate + "')";
				st.executeUpdate(sql);
				%>
				<h2 style="color: white">New Product has been added!</h2>
				<%
			}
		}
	%>
		</form>

</div>
</body>
</html>