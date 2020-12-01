<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Track Rebate Application</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/style.css">
<style>
.field {
	height: 50px;
	border-radius: 0px;
	border-top: 0px;
	border-left: 0px;
	border-right: 0px;
	background-color: #f1f1f1;
}
.btn{
 border-radius:0px;
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
					<li class="breadcrumb-item active">Track Rebate Application of Applicants</li>
				</ol>

				<div class="card">
					<div class="container-fluid">
						<h4 class="mt-3">Track Rebate Application</h4>
						<br>
						 <form action="trackApplication" method="post">
						       <input type="email" name="trackApplication" required placeholder="Enter Email Address to Track Rebate Application" class="field form-control mb-3">
				
						         <input type="submit" value="Track Application" class="btn btn-lg btn-success mb-5">
						 </form>
                    
					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>