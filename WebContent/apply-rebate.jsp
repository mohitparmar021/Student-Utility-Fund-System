<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Apply For Rebate</title>
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

	<div class="container mt-3">
		<form action="updatedetail" method="post">
			<h1 class="text-center">Apply For Rebate</h1>
			<p class="text-center">**Update Your Information**</p>
			<div class="personalDetail">
				<h4 class="ml-3">Personal Details</h4>
				<%
					String email = (String) request.getParameter("email");
					DaoClass obj = new DaoClass();

					ResultSet rs = obj.displayUserDetail(email);
					while(rs.next())
					{
				%>

				<input type="email" name="email" readonly value="<%=email%>"
					class="form-control mt-4 field"> <input type="text"
					name="name" autocomplete="off" required
					placeholder="Enter Your Name" value="<%=rs.getString(3) %>" class="form-control mt-4 field">
				<input type="text" name="address" value="<%=rs.getString(7) %>" autocomplete="off" required
					placeholder="Enter Your Address" class="form-control mt-4 field">

				<input type="number" name="mobile"  value="<%=rs.getString(6) %>" autocomplete="off" required
					placeholder="Enter Your Mobile Number"
					class="form-control mt-4 field">

			</div>

			<div class="education mt-5">
				<h4 class="ml-3">Education Details</h4>

				<input type="text" name="university" autocomplete="off" required
					placeholder="Enter Your University Name"  value="<%=rs.getString(8) %>"
					class="form-control mt-4 field"> <input type="text"
					name="college" autocomplete="off"  value="<%=rs.getString(9) %>" required
					placeholder="Enter Your College Name"
					class="form-control mt-4 field"> <input type="text"  value="<%=rs.getString(10) %>"
					name="course" autocomplete="off" required
					placeholder="Enter Your Course Name"
					class="form-control mt-4 field">
				<%
}
%>
			</div>

			<input type="submit" name="" value="Save"
				class="btn btn-lg btn-success ml-3 mt-3  mb-4">
		</form>


	</div>


</body>
</html>