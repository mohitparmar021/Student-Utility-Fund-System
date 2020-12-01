
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profile</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/style.css">
<style>
.btn-add {
	width: 17%;
	border-radius: 0px;
}

.update-btn {
	border-radius: 0px;
}
</style>
</head>
<body>

	<%@include file="view/admin-navbar.jsp"%>

	<div id="wrapper">
		<%@include file="view/sidebar.jsp"%>

		<div id="content-wrapper">

			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item "><i
						class="fas fa-fw fa-tachometer-alt"></i> <a href="#">Dashboard</a>
					</li>
					<li class="breadcrumb-item active">Profile</li>
				</ol>



				<div class="card">
					<div class="container-fluid">
						<h3 class="mt-3 mb-3">Account Information</h3>
						<table class="table-responsive-lg mb-3" cellpadding="7px"
							style="width: 100%" border="0px">

							<tbody>

								<%
									String email = (String) session.getAttribute("username");
									DaoClass ob = new DaoClass();
									ResultSet rs = ob.getAdminDetails(email);
									while(rs.next()){
								%>
								<tr>
									<td class="font-weight-bold">Id Number</td>
									<td class="font-weight-bold">:</td>
									<td><%=rs.getInt(1) %></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Name</td>
									<td class="font-weight-bold">:</td>
									<td><%=rs.getString(3) %></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Username</td>
									<td class="font-weight-bold">:</td>
									<td><%=rs.getString(2)%></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Computer Code</td>
									<td class="font-weight-bold">:</td>
									<td><%=rs.getString(4) %></td>
								</tr>
								<tr>
									<td class="font-weight-bold">Email Id</td>
									<td class="font-weight-bold">:</td>
									<td><%=rs.getString(2) %></td>
								</tr>
						<%
								}
						%>	
								<tr>
									<td class="update-btn"><a
										class="btn btn-success update-btn" href="update-admin-profile.jsp?email=<%=email%>">Update Profile</a>
									</td>
								</tr>

							</tbody>


						</table>



					</div>
				</div>

			</div>

			<!-- Sticky Footer -->


		</div>
	</div>

</body>
</html>

</body>
</html>