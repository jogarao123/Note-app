package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		int note_id=Integer.parseInt(request.getParameter("note_id"));
		PrintWriter out=response.getWriter();
		Note note=s.get(Note.class, note_id);
//		out.println(note.getId()+": "+note.getContent());
		s.delete(note);
		tx.commit();
		s.close();
		response.sendRedirect("all_notes.jsp");
	
		
	}


}
