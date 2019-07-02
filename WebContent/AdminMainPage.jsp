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
<header>ABC Protection Plan Inc.</header>
	<div class="main">
	<a href="AdminSignIn.jsp" class="menuItem">Go Admin	SignIn Page</a>
		<div class="menu">
			<h1>Perform Admin Operations</h1>

			<a href="UserDetails.jsp" class="menuItem">Show/Search Users</a> 
			<a	href="RegisterProductDetails.jsp" class="menuItem">Show/Search Registered Products</a> 
			<a href="ProductDetails.jsp" class="menuItem">Add/UpdateProduct</a> 
			<a href="ClaimDetails.jsp" class="menuItem">Approve/Reject Claim</a> 
			
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
			
				<h1>Dashboard</h1>
			<table style="border: 1px solid black;">
				<tr>
					<td>Number of Users</td>
					<td>
						<%
							String sql = "Select count(username) from UserDetails";
							rs = st.executeQuery(sql);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
				<tr>
					<td>Number of Products available</td>
					<td>
						<%
							String sql1 = "Select count(productname) from ProductDetails";
							rs = st.executeQuery(sql1);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
				<tr>
					<td>Number of Registered Products</td>
					<td>
						<%
							String sql2 = "Select count(serialNumber) from RegisterProduct";
							rs = st.executeQuery(sql2);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>

				<tr>
					<td>Number of Claims</td>
					<td>
						<%
							String sql3 = "Select count(serialNumber) from ClaimDetails";
							rs = st.executeQuery(sql3);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
				
				<tr>
					<td>Waiting Claims</td>
					<td>
						<%
							String sql4 = "Select count(serialNumber) from ClaimDetails where status = 'waiting'";
							rs = st.executeQuery(sql4);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
				
				<tr>
					<td>Approved Claims</td>
					<td>
						<%
							String sql5 = "Select count(serialNumber) from ClaimDetails  where status = 'approved'";
							rs = st.executeQuery(sql5);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
				<tr>
					<td>Rejected Claims</td>
					<td>
						<%
							String sql6 = "Select count(serialNumber) from ClaimDetails  where status = 'rejected'";
							rs = st.executeQuery(sql6);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
				<tr>
					<td>Most Defected Product (Serial Number)</td>
					<td>
						<%
							String sql7 = "select serialNumber from claimdetails group by serialNumber  order by count(*) desc  limit 1;";
							rs = st.executeQuery(sql7);
							if (rs.next()) {
								String count = rs.getString(1);
								out.println(count);
							}
						%>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
</body>
</html>