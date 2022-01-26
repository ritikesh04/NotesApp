<%@page import="com.helper.FactoryProvider"%>
<%@ page import="com.entities.*"%>
<%@ page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Notes</title>
<%@ include file="style.jsp" %> 
</head>
<body>
<%@ include file="navbar.jsp" %>
	<div class="container">
		<br>
		<h1>Update Notes</h1>
		
		<%
		int note = Integer.parseInt(request.getParameter("note_id").trim());
		Session sess = FactoryProvider.getFactory().openSession();
		Note n = sess.get(Note.class,note);
		%>
		
		<form action="UpdateServlet" method="post">
		<div>
			<br>
			  <div class="mb-3">
			  	<input value=<%= n.getId() %> name="id" type="hidden">
			  	
			  	
			  	
			    <label for="title" class="form-label">Note Title</label>
			    <input 
			     type = "text"
			     name = "title"
			     class="form-control" 
			     id="title"
			     required="required"
			     placeholder="Enter the title" 
			     aria-describedby="emailHelp"
			     value=<%= n.getTitle() %>>
			     
			     			    
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
			   	<%= n.getContent() %>
			    </textarea>
			  </div>
			  
			  <div class="container text-center">
			  <button type="submit" class="btn btn-primary">Update</button>
				</div>
			</div>
		</form>
		
	</div>
</body>
</html>