<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Query"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entities.*"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<%@ include file="style.jsp" %> 
</head>
<body>
	
		<%@ include file="navbar.jsp" %>
		<div class="container">
		<br>
		<% String name = request.getParameter("search"); %>
		
		<h1 class="text-center">Search Results for <%= name %></h1>
		
		<%
		String name1 = request.getParameter("search");
		Session s = FactoryProvider.getFactory().openSession();
		String hql = "from Note as n where n.title=:x";
		Query query = s.createQuery(hql);
		query.setParameter("x", name1);
		List<Note> results = query.list();
		
		for(Note n : results){
	
		%>	
			<div class="card mt-3">
				  <div class="card-body">
				    <p class="card-text"><%= n.getContent() %></p>
				  </div>
			</div>	
			
		
		
		<%
		}
		s.close();
		
		%>
		
		
	</div>
</body>
</html>