<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<p>
		Welcome to Home Page!!!
	</p>
	<hr>
	
	User: <security:authentication property="principal.username"/>
	<br><br>
	Role(s)/Authorities: <security:authentication property="principal.authorities"/>
		
		
		<!-- Show link only to authorized role -->
	<security:authorize access="hasRole('MANAGER')">
		<!-- Link to managers -->
		<p>
			<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
		</p>
	</security:authorize>
	
	
		
		
		
	<security:authorize access="hasRole('ADMIN')">
		<!-- Link to systems ... this is for admin's -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
		</p>
	</security:authorize>		
		
	
	
	<hr>
	<form:form action="${pageContext.request.contextPath}/logout"  
				method="POST">						<!-- logout is default, must match exactly -->
			
			<input type="submit" value="Logout" />
				
	</form:form>

<p>

</body>
</html>