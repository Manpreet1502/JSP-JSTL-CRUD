<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>User Registered Products Details</title>
       <link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
    </head>
    <body> 
 	<div class = "main">
 	<header>ABC Protection Plan Inc.</header>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/week10projectdb"
                           user="root"  password="root"/>
    	<sql:query dataSource="${dbsource}" var="result">
	            select * from registerproduct
	            where username='${sessionScope["username"]}'
	      </sql:query>
 	
        <form>
        	<h1 style = "color: white">User Details</h1>
            <table border="1">
                
                <tr>                    
                    <th>Product Name</th>
                    <th>Username</th>
                    <th>Serial Number</th>
                    <th>Purchase Date</th>
                    <th>AddClaim</th>
                    
                 </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                   	    <td><c:out value="${row.productname}"/></td>
                        <td><c:out value="${row.username}"/></td>                        
                        <td><c:out value="${row.serialnumber}"/></td>
                        <td><c:out value="${row.purchasedate}"/></td>
                        <td><a href="AddClaimForm.jsp?serialNumber=${row.serialnumber}">Add claim</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        
        <a href="UserMainPage.jsp">Go Back</a>
   </div>
</body>
</html>