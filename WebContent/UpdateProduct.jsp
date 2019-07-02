<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Product</title>
<link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
</head>
<body>
	<div class="main">
	<header>ABC Protection Plan Inc.</header>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/week10projectdb" user="root"
			password="root" />
		<c:if test="${not empty param.submit}">
			<sql:update dataSource="${dbsource}" var="count">
	            UPDATE productdetails SET  model=?, color=?, category=?
	            WHERE productname='${param.productname}'
	            <sql:param value="${param.model}" />
				<sql:param value="${param.color}" />
				<sql:param value="${param.category}" />
			</sql:update>
		</c:if>
		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from productdetails where productname=?
            <sql:param value="${param.productname}" />
		</sql:query>

		<form class="center-block">
			<table>
				<h1>Update Product</h1>
				<tr>
					<th>Product Name</th>
					<th>Model</th>
					<th>Color</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><label>${row.productname}</label></td>
						<input type="hidden" value="${row.productname}" name="productname" />
						<td><input type="text" value="${row.model}" name="model" /></td>
						<td><input type="text" value="${row.color}" name="color" /></td>
						<td><input type="text" value="${row.category}"
							name="category" /></td>
						<td><input type="submit" name="submit" value="Update" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>

		<c:if test="${not empty param.submit}">
			<c:if test="${count>=1}">
			<a href="AdminMainPage.jsp">Go Admin Page</a><br>
				<font size="5" color='white'> Congratulations ! Data updated
					successfully.</font>
				
			</c:if>
		</c:if>
	</div>
</body>
</html>