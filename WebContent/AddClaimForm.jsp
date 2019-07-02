<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

<a href="UserRegisterProductDetails.jsp">Go Back</a>
	<form class="center-block" method="post">
		<p>
			Date of Claim : <br/> <input type="date" name="doc" />	
		</p>
		<p>
			Description : <br/> <input type="text" name="description" />
		</p>
		
		<p> Serial Number: <br/> <label> <%=request.getParameter("serialNumber") %></label><br/><br/>
		
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
			String doc = request.getParameter("doc");
			String description = request.getParameter("description");
			String serialNumber = request.getParameter("serialNumber");
			String query1 = "SELECT COUNT(*) FROM claimdetails where serialNumber = '" + serialNumber + "'";
			String query2= "SELECT purchasedate from registerproduct where serialNumber =  '" + serialNumber + "'";
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query1);
			
		if(rs.next()){
				int count = rs.getInt(1);
				if(count >= 3){
					%> <h2 style = "color: white">Maximum of 3 claims limits has been reached!</h2> <%
				
				}else{
					rs = st.executeQuery(query2);
					if(rs.next()){
						Calendar calendar = Calendar.getInstance();
						calendar.setTime(rs.getDate(1));
						calendar.add(calendar.YEAR, 5);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						Date dateOfClaim = sdf.parse(doc);
						Date date= calendar.getTime();
						if (date.after(dateOfClaim)) {							
							String query3 = "INSERT INTO claimdetails VALUES (?,?,'waiting',?)";
							PreparedStatement pst = con.prepareStatement(query3);
							pst.setString(1, doc);
							pst.setString(2, description);
							pst.setString(3, serialNumber);
							pst.execute();
							%>

							<h2 style="color: white">Claim has been added</h2>
							<%
							
						} else {
							%> <h2 style = "color: white">Your protection plan is over! You have exceeded 5 years!</h2> <%
						}
					}
					
				}
			}
		
			
	} %>
	
	
</div>
</body>
</html>
