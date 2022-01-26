<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Notes</title>
<%@ include file="style.jsp" %> 
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
	<br>
	<h1 class="text-center">Search Notes</h1>
	
	<br>
	<form action="SearchPage.jsp">
		<div class="mb-3">
			    <h3>Enter the title </h3>
			    <br>
			    <input 
			     type = "text"
			     name = "search"
			     class="form-control" 
			     id="search"
			     required="required"
			     
			     aria-describedby="emailHelp">
		</div>
		<br>
		<div class="container text-center">
			  <button type="submit" class="btn btn-primary">Search</button>
		</div>
	</form>
</div>
</body>
</html>