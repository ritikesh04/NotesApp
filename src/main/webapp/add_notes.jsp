<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@ include file="style.jsp" %> 
</head>
<body>
<%@ include file="navbar.jsp" %>
	<div class="container">
		<br>
		<h1>Add Notes Here</h1>
		
		<form action="AddServlet" method="post">
		<div>
			<br>
			  <div class="mb-3">
			    <label for="title" class="form-label">Note Title</label>
			    <input 
			     type = "text"
			     name = "title"
			     class="form-control" 
			     id="title"
			     required="required"
			     placeholder="Enter the title" 
			     aria-describedby="emailHelp">
			    
			  </div>
			  <div class="mb-3">
			    <label for="content" class="form-label">Note Content</label>
			    <textarea 
			    name="content"
			    class="form-control" 
			    required="required"
			    placeholder="Enter the content here"
			    style="height:300px"
			    id="content" >
			    </textarea>
			  </div>
			  
			  <div class="container text-center">
			  <button type="submit" class="btn btn-primary">Add</button>
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>