package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


import com.entities.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title,content,new Date());
			
			
			Session sess = FactoryProvider.getFactory().openSession();
			Transaction tx = sess.beginTransaction();
			sess.save(note);
			tx.commit();
			
			sess.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note Added Successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
			out.println("<h1 style='text-align:center;'><a href='add_notes.jsp'>Add Another Note</a></h1>");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
