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
<title>All Notes</title>

<%@ include file='all_js_css_jsp.jsp'%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>All Notes</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();

				Query query = s.createQuery("from Note");
				List<Note> list = query.list();

				for (Note note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top m-4" style="max-width: 55px"
						src="images/note.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">
							<%=note.getTitle()%>	
						</h5>
						<p class="text-primary"><b><%=note.getAddedDate() %></b></p>
						<p class="card-text">
							<%=note.getContent()%>
						</p>
						<div class="container">
							<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a> 
							<a href="edit.jsp?note_id=<%= note.getId() %>"	class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>


	</div>

</body>
</html>