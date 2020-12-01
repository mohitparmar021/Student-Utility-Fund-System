<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Granted Application</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/style.css">
<style>
body{
background-color:#1c652d
}
.table {
	margin-right: 10px;
}

card {
	padding: 10px;
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
					<li class="breadcrumb-item active">Granted Application</li>
				</ol>

				<div class="card">
					<div class="container-fluid">
						<h4 class="mt-3">Granted Application</h4>
						<br>

						<table class="table-responsive-lg table-striped mb-3"
							cellpadding="6px" style="width: 100%" border="2px">
							<thead>
								<tr class="bg-success text-white">
									<th>Ref. Number</th>
									<th>Name</th>
									<th>Email Id</th>
									<th>Transaction Id</th>
									<th>Date</th>
									<th>Rebate Amount</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									DaoClass obj3 = new DaoClass();
									ResultSet rs = (ResultSet) obj3.viewGrantedApplication();
									while(rs.next()){
								%>
								<tr>
									<td><%=rs.getInt(1) %></td>
									<td><%=rs.getString(9) %></td>
									<td><%=rs.getString(2) %></td>
									<td><%=rs.getString(3) %></td>
									<td><%=rs.getString(5) %></td>
									<td><%=rs.getString(7) %></td>
									<td class="text-center"><a href="view-grant-record.jsp?ref_id=<%=rs.getInt(1) %>"
										class="btn bg-success text-white">View</a></td>
								</tr>
										
								<%		
									}
								%>
								


							</tbody>


						</table>

					</div>
				</div>
			</div>

		</div>

	</div>

</body>
</html>