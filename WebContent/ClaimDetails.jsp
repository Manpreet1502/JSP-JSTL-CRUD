<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>Claim Details</title>
       <link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
    </head>
    <body> 
 	<div class = "main">
 	<header>ABC Protection Plan Inc.</header>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/week10projectdb"
                           user="root"  password="root"/>
    	<sql:query dataSource="${dbsource}" var="result">
	            select * from claimdetails
	    </sql:query>
 	
        <form action = "StatusProcessing.jsp">
        	<h1 style = "color: white">Product Details</h1>
            <table border="1">
                
                <tr>                    
                    <th>Date Of Claim</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Serial Numer</th>
                    <th>AddClaim</th>
                    
                 </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                   	    <td><c:out value="${row.DateOfClaim}"/></td>
                        <td><c:out value="${row.description}"/></td>                        
                        <td><c:out value="${row.status}"/></td>
                        <td><c:out value="${row.serialNumber}"/></td>
                        <td><a href="StatusProcessing.jsp?status=Approved&DateOfClaim=${row.DateOfClaim}&serialNumber=${row.serialNumber}">Approved</a><br>
  							<a href="StatusProcessing.jsp?status=Rejected&DateOfClaim=${row.DateOfClaim}&serialNumber=${row.serialNumber}">Rejected</a><br></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        
        <a href="AdminMainPage.jsp">Go Admin Page</a>
   </div>
</body>
</html>