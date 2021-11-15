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

import com.entities.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Note note=new Note(title, content, new Date());
		
		Session session= FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		session.save(note);
		tx.commit();
		session.close();
	
		System.out.println(note.getId()+" "+note.getTitle());
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h1>Note added successfully</h1>"
				+ "<a href='all_notes.jsp'>view notes</a>");
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

}
