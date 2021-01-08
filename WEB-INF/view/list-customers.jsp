<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List customer</title>

<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id ="wrapper">
		<div id = "header">
			<h2> CRM - CUSTOMER RELATIONSHIP MANAGER</h2>
		</div>
	</div>
	
	<div id = "container">
		<div id="container">
		
		<input type ="button" value = "Add Customer"
			onClick = "window.location.href='showFormForAdd'; return false;"
			class = "add-button"
		
		/>
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email id</th>
					<th>Action</th>
				</tr>
					
				<c:forEach var="tempCustomer" items="${customers}">
				
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name = "customerId" value = "${tempCustomer.id}"/>
				</c:url>
				
				<c:url var="deleteLink" value="/customer/delete">

					<c:param name = "customerId" value = "${tempCustomer.id}"/>
				</c:url>
				
				 
				 <tr>
				 	<td>${tempCustomer.firstname}</td>
				 	<td>${tempCustomer.lastname}</td>
				 	<td>${tempCustomer.email}</td>
				 	<td>
				 		<a href="${updateLink}">update</a>
				 		|
				 		<a href="${deleteLink}"
				 		onclick = "if (!confirm('Are you sure  you want to delete this customer?')))return false">delete</a>
				 	</td>
				 	
				 </tr>
				 
				</c:forEach>
			
			</table>
		</div>
	
	</div>
</body>
</html>