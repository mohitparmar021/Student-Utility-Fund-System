<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Expense</title>
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

		<form action="addexpense" method="post" enctype="multipart/form-data">
			<h1 class="text-center">Add Expense</h1>

			<div class="expenseDetail">
				<%
					String email12 = (String) request.getAttribute("email");
				%>
				<input type="email" name="email" readonly value="<%=email12%>"
					class="form-control mt-4 field"> <input type="text"
					name="transaction_id" autocomplete="off" required
					placeholder="Enter Transaction Id" class="form-control mt-4 field">

				<input type="text" name="retailername" size="5" autocomplete="off"
					required placeholder="Enter Retailer Name"
					class="form-control mt-4 field"> <input type="date"
					name="date" autocomplete="off" required
					class="form-control mt-4 field"> <span
					class="text-danger ml-4">**Date of Transaction**</span> <input
					type="text" name="category" autocomplete="off" required
					placeholder="Enter Your Project Name"
					class="form-control mt-4 field">

				<textarea rows="5" cols="5" name="projectDescription" required
					placeholder="Please Provide Your Project Description along with purchase Details..."
					class="form-control mt-4 field"></textarea>

				<input type="number" name="cost" autocomplete="off" required
					placeholder="Transaction value / Cost"
					class="form-control mt-4 field"> <input type="file"
					name="uploadreceipt" class="form-control mt-4 field"><span
					class="text-danger ml-4">**Upload Receipt**</span>
			</div>

			<input type="submit" name="" value="Submit Expense"
				class="btn btn-lg btn-success ml-3 mt-3  mb-4">
		</form>

	</div>


</body>
</html>