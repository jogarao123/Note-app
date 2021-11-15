<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
/
<%@ include file='all_js_css_jsp.jsp'%>
<title>Add notes</title>

</head>
<body>
	<div class="container">
		<%@ include file='navbar.jsp'%>
		<br>
		<h1>Please fill your notes details</h1>
		
<!-- 		this is add form -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input
					type="title" class="form-control" id="title" required
					aria-describedby="emailHelp" placeholder="Enter title" name="title"> 
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea  id="content" name="content" placeholder="Enter your content here"
				require="true"
				class="form-control"
				style="height:200px"
				>
				
				</textarea>		
			</div>
			<div class="container text-center">
				<button type="submit"  class="btn btn-primary">ADD</button>
			</div>
		</form>
	</div>
</body>
</html>