<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
<meta charset="ISO-8859-1">
<title>Add New Product</title>
</head>
<body>
<header>ABC Protection Plan Inc.</header>
<div class="main">
<a href="AdminMainPage.jsp">Go Admin Page</a>
	<form class="center-block" method="post">
		<p>
			Product Name : <br/> <input type="text" name="pName" />
		</p>
		<p>
			Product Model : <br/> <input type="text" name="pModel" />
		</p>
		<p>
			Color : <br/> <input type="text" name="pColor" />
		</p>
		<p> Category 
		<br/>
		<select name="pCategory">
			<option>Home Appliance</option>
			<option>Mac Book</option>
			<option>Phone</option>
			<option>Laptop</option>
		</select>
		</p>
		<p></p>
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
			String pName = request.getParameter("pName");
			String pModel = request.getParameter("pModel");
			String pColor = request.getParameter("pColor");
			String pCategory = request.getParameter("pCategory");
			
			Statement st= con.createStatement();
			
			String sqlQuery = "select * from productdetails where productname='"  + request.getParameter("pName") +"'";
			ResultSet rs = st.executeQuery(sqlQuery);	
				
			if(pName == null || pName.isEmpty()){
				%>
				<h2 style = "color: white"> Enter product name</h2>
			<%
			}else if(rs.next()){ %>
				<h2 style = "color: white"> Product Name already exists</h2>
			<%} else{
			String query = "INSERT INTO productdetails VALUES (?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, pName);
			pst.setString(2, pModel);
			pst.setString(3, pColor);
			pst.setString(4, pCategory);
			pst.execute();
			
	%>

	<h2 style="color: white">New Product has been added!</h2>
	<%		}
		}%>
	
	
</div>
</body>
</html>
