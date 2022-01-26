package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note n = new Note(title , content , new Date());
			
			Session sess = FactoryProvider.getFactory().openSession();
			Transaction tx = sess.beginTransaction();
			sess.save(n);
			tx.commit();
		
			sess.close();
			
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<h1>Note Added Successfully</h1>");
			out.println("<a href='show_notes.jsp'><h1>View All Notes</h1></a>");
			out.println("<a href='add_notes.jsp'><h1>Add Notes</h1></a>");
			
		}catch(Exception e) {
			
			System.out.println(e);
		}
				
	
		
		
	}

}
