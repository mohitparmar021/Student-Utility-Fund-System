<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Dashboard</title>

<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<script src="assets/libraryfile/jquery-3.4.1.min.js"></script>

<style type="text/css">
ul li a {
	font-size: 25px;
	margin-left: 10px;
}

.navbar-brand {
	font-size: 35px;
}

.headline {
	font-size: 50px;
}

.btn {
	border-radius: 0px;
	padding: 20px;
}
</style>
</head>
<body>

<%@include file="view/navbar.jsp"%>

	<div class="container mt-5 mb-5">
		<%
		  //  HttpSession ses=request.getSession();
		   String email=(String)session.getAttribute("username");
		%>
		<div class="jumbotron">
			<h1 class="text-center">Welcome to</h1>
			<h1 class="text-center text-success mt-3 headline">
				Supplementary Grant For Student
			</h1>
			 <p class="text-center">For Project and Academic Activity</p>
			<h2 class="text-center mt-3"><%=email %></h2>
		</div>

		<div class="mt-5 text-center">
			<a href="apply-rebate.jsp?email=<%=email%>" class="btn btn-lg btn-success mt-2">Apply
				for a new Rebate</a>
				 <a href="confirm-grant.jsp?email=<%=email%>" class="btn btn-lg btn-success mt-2 ml-2">View
				Grant History</a> 
				 <a href="cancel-appl.jsp?email=<%=email%>" class="btn btn-lg btn-success mt-2 ml-2">View
				Cancel History</a> 
				<a href="pending-grants.jsp?email=<%=email%>" class="btn btn-lg btn-success mt-2 ml-2">Check
				Status of Pending Rebate</a>
		</div>


	</div>


	
</body>
</html>