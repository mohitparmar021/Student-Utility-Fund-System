<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submission Confirm</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">

<style type="text/css">
ul li a {
	font-size: 25px;
	margin-left: 10px;
}

.navbar-brand {
	font-size: 35px;
}

.btn {
	border-radius: 0px;
	width: 25%;
}

.field {
	height: 50px;
	border-radius: 0px;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	margin-left: 20px;
	background-color: #f1f1f1;
}
</style>
</head>
<body>

	<%@include file="view/navbar.jsp"%>

	<div class="container mt-5">
<%

DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
LocalDateTime now = LocalDateTime.now();  
String date=dtf.format(now);  

%>
		<div>
			<h1 class="text-center">Submission Confirmation</h1>
			<p class="text-center">You have successfully submitted your
				rebate application. It is now pending approval.</p>

			<div class="Detail">
				<label class="ml-4" id="date-submission">Date and Time of Submission</label>
				<input type="text" id="date-submission" value="<%=date %>"  readonly name="date"
					autocomplete="off"   class="form-control field">
				<span class="text-danger ml-4">
			</div>

			<a href="user-dashboard.jsp" class="btn btn-lg btn-success ml-3 mt-5 text-center  mb-4">
				Return to Home</a>
		</div>

	</div>


</body>
</html>