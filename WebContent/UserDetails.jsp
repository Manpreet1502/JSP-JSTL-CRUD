<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>User Details</title>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">

</head>
<body>
	<div class="main">
	<header>ABC Protection Plan Inc.</header>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/week10projectdb" user="root"
			password="root" />


		<form>
			<p>
				Username : <br>
				<input type="text" name="username" class="search-text"/>
			</p>
			<input type="submit" name="submit" value="Search" />
		</form>
		<c:choose>
			<c:when test="${empty param.username}">
				<c:if test="${not empty param.submit}">
					<h2 style="color: red">Please enter username to search</h2>
				</c:if>
				<sql:query dataSource="${dbsource}" var="result">
	            	select * from userdetails
	       		 </sql:query>
			</c:when>
			<c:otherwise>
				<sql:query dataSource="${dbsource}" var="result">
	            select * from userdetails
	            where username='${param.username}'
	       		 </sql:query>
			</c:otherwise>
		</c:choose>
		<form>
			<table border="1">
				<h1>User List</h1>
				<tr>
					<th>Username</th>
					<th>Password</th>
					<th>Name</th>
					<th>Address</th>
					<th>Cell Number</th>
					<th>Email</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.password}" /></td>
						<td><c:out value="${row.name}" /></td>
						<td><c:out value="${row.address}" /></td>
						<td><c:out value="${row.cellno}" /></td>
						<td><c:out value="${row.email}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>

		<a href="AdminMainPage.jsp">Go Admin Page</a>
	</div>
</body>
</html>