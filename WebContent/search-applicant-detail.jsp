<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Record</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/style.css">
<style>
.btn {
	border-radius: 0px;
	width: 25%;
}
body{
background-color:#1c652d
}

.field {
	height: 50px;
	border-radius: 0px;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	margin-left: 20px;
	background-color: #f1f1f1;
	width:97%;
}
</style>

</head>
<body>

	<%@include file="view/admin-navbar.jsp"%>

	<div id="wrapper">
		<%@include file="view/sidebar.jsp"%>

		<div id="content-wrapper" class="bg-white">

			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item "><i
						class="fas fa-fw fa-tachometer-alt"></i> <a href="#">Dashboard</a>
					</li>
					<li class="breadcrumb-item active">Student Detail</li>
				</ol>


				<div class="card">
					<div class="mt-2">

						<form action="" method="post">
			<%

          ResultSet rs=(ResultSet)request.getAttribute("rs");
         while(rs.next())
         {

%>
			<div class="personalDetail">
				<h2 class="ml-3">Personal Details</h2>
				
			 <input type="email" name="email" value="<%=rs.getString(2)%>"
					autocomplete="off" readonly="" placeholder="Enter Your Email"
					class="form-control mt-4 field"> 
					
			<input type="text" name="name" value="<%=rs.getString(3) %>" readonly class="form-control mt-4 field">
		    <input type="text" name="gender" value="<%=rs.getString(4) %>" readonly class="form-control mt-4 field">	
				
			<input type="date" name="dob" readonly value="<%=rs.getString(5)%>" class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Date of Birth**</span> 
					
			 <input	type="number" name="mobile" readonly  value="<%=rs.getString(6) %>" class="form-control mt-4 field">
					
			 <input type="text" readonly value="<%=rs.getString(7) %>" name="address" class="form-control mt-4 field">
		</div>

			<div class="education mt-5">
				<h2 class="ml-3">Education Details</h2>

				<input type="text" name="university" value="<%=rs.getString(8) %>" readonly class="form-control mt-4 field"> 
				<input type="text" name="college" value="<%=rs.getString(9) %>" readonly class="form-control mt-4 field"> 
				<input type="text" name="course" value="<%=rs.getString(10) %>" readonly class="form-control mt-4 field"> 
				<input type="date" name="start" readonly value="<%=rs.getString(11) %>" class="form-control mt-4 field"><span class="text-sm ml-4 text-danger">**Graduation starting Date**</span> 
				<input type="date" name="expect" value="<%=rs.getString(12) %>" readonly class="form-control mt-4 field"><span class="text-sm ml-4 text-danger">**Graduation Completion
					Date**</span><br> <br>
			</div>	
		<%
		    	}
		%>
		</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>