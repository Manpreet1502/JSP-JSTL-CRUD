<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>Registered Product</title>
       <link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
    </head>
    <body> 
 	<div class = "main">
 	<header>ABC Protection Plan Inc.</header>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/week10projectdb"
                           user="root"  password="root"/>
    	<form>
	    	<p>
				Serial Number : <br>
				<input type="text" name="serialnumber" class="search-text" />
			</p>
			<input type="submit" name="submit" value="Search" />
    	</form>
 		<c:choose>
		    <c:when test="${empty param.serialnumber}">
		    	<c:if test="${not empty param.submit}">
		    		<h2 style = "color: red"> Please enter serial number to search</h2>
		    	</c:if>
		        <sql:query dataSource="${dbsource}" var="result">
	            	select * from registerproduct
	       		 </sql:query>
		    </c:when>
		    <c:otherwise>
				<sql:query dataSource="${dbsource}" var="result">
	            select * from registerproduct
	            where serialnumber='${param.serialnumber}'
	       		 </sql:query>
		    </c:otherwise>
		</c:choose>
        <form>
            <table border="1">
                <h1>Registered Products</h1>
                <tr>                    
                    <th>Product Name</th>
                    <th>Username</th>
                    <th>Serial Number</th>
                    <th>Purchase Date</th>
                    
                 </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                   	    <td><c:out value="${row.productname}"/></td>
                        <td><c:out value="${row.username}"/></td>                        
                        <td><c:out value="${row.serialnumber}"/></td>
                        <td><c:out value="${row.purchasedate}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        
        <a href="AdminMainPage.jsp">Go Admin Page</a>
   </div>
</body>
</html>