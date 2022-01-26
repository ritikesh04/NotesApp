<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Query"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Notes</title>
<%@ include file="style.jsp" %> 
</head>
<body>
<%@ include file="navbar.jsp" %>
	<div class="container">
	<br>
	<h1>Your Notes</h1>
	
	
	<div class="row">
		<div class="col-12">
			
		<%
		
		Session sess = FactoryProvider.getFactory().openSession();
		String hql = "from Note";
		Query query = sess.createQuery(hql);
		List<Note> result = query.list();
		
		for(Note note : result){
				
		%>
		
		<div class="card mt-3">
		<img src="images/notepad.png" style="max-width:100px; height:150px;" class="card-img-top m-4" alt="...">
		  <div class="card-body">
		    <h5 class="card-title"><%= note.getTitle()%></h5>
		    <p class="card-text"><%= note.getContent() %></p>
		    <p class="card-text">Date Created : <%= note.getDate() %></p>
		    
		    <a href="edit_notes.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
		    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
		  </div>
		</div>
				
		
		<%
		}
		 sess.close();
		%>
		</div>
	</div>

	</div>
</body>
</html>