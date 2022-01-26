package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		try {
		int id = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		String hql = "Delete from Note as n where n.id=:x";
		Query query = s.createQuery(hql);
		query.setParameter("x",id);
		int res = query.executeUpdate();
		
		tx.commit();
		s.close();
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1>Note Deleted Successfully</h1>");
		out.println("<a href='show_notes.jsp'>View All Notes</a>");
		
		}catch(Exception e) {
			System.out.println(e);
		}
	}

	

}
