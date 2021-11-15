package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title,content;
		int  id= Integer.parseInt(request.getParameter("note_id"));
		title=request.getParameter("title");
		content=request.getParameter("content");
		
		Session session= FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		
		Note note=session.get(Note.class, id);
		
		note.setContent(content);
		note.setTitle(title);
		
		tx.commit();
		session.close();
		response.sendRedirect("all_notes.jsp");
		
	}

}
