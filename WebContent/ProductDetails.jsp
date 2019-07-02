<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>Products Display</title>
        <link rel="stylesheet" type="text/css" href="Resources/CSS/Main.css">
    </head>
    <body>
    <div class = "main">
    <header>ABC Protection Plan Inc.</header>
    <a href="AdminMainPage.jsp">Go Admin Page</a>
 		<form>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/week10projectdb"
                           user="root"  password="root"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from productdetails;
        </sql:query>
    
        <form>
            <table border="1">
                <h1>Product List</h1>
                <tr>                	
                    <th>Product Name</th>
                    <th>Model	</th>
                    <th>Color</th>
                    <th>Category</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                    	
                        <td><c:out value="${row.productname}"/></td>
                        <td><c:out value="${row.model}"/></td>
                        <td><c:out value="${row.color}"/></td>
                        <td><c:out value="${row.category}"/></td>                       
                        <td><a class = "updateLink" href="UpdateProduct.jsp?productname=<c:out value="${row.productname}"/>">Update</a></td>                                            
                    </tr>
                </c:forEach>
                
            </table>
            <h2><a href="AddProduct.jsp">Add product</a></h2>
        </form>
        
        
        </div> 
   </form>
</body>
</html>