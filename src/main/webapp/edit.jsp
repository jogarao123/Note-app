<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit note</title>
<%@ include file='all_js_css_jsp.jsp'%>
</head>
<body>
	<div class="container">
		<%@ include file='navbar.jsp'%>
		<br>		
		<h1>Update Note</h1>
		<%
			int noteId=Integer.parseInt(request.getParameter("note_id"));
			Session ses=FactoryProvider.getFactory().openSession();
			
			Note note=ses.get(Note.class, noteId);
			
			
		%>
		<form action="UpdateServlet" method="post">
		
			
			<div class="form-group">
				<input type="hidden" value=<%= note.getId() %> name="note_id">
				<label for="title">Note Title</label> <input
					type="title" class="form-control" id="title" required
					aria-describedby="emailHelp" placeholder="Enter title" name="title" value=<%= note.getTitle()	%>> 
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea  id="content" name="content" placeholder="Enter your content here" 
				require="true"
				class="form-control"
				style="height:200px"
				>
				<%= note.getContent() %>	
				</textarea>		
			</div>
			<div class="container text-center">
				<button type="submit"  class="btn btn-success">Update</button>
			</div>
		</form>
	</div>

</body>
</html>