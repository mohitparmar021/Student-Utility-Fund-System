<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/style.css">
<style>
.text-size{
   font-size:23px;
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
					<li class="breadcrumb-item active">Overview</li>
				</ol>



				<div class="row">
					<div class="col-xl-3 col-sm-6 mb-3 ">
						<div class="card text-white bg-danger o-hidden h-100 ">
							<div class="card-body">
								<div class="card-body-icon">
									<i class="fas fa-fw fa-comments"></i>
								</div>
								<div class="hd-text">
									<%
										int count = 0;
										DaoClass object12 = new DaoClass();
										count = object12.getStudentCount();
									%>
									<h3 class=""><%=count%></h3>
									<p class="text-size">Total Number of Student Enrolled</p>
									
									
								</div>

							</div>
						</div>
					</div>

					<div class="col-xl-3 col-sm-6 mb-3">
						<div class="card text-white bg-primary o-hidden h-100">
							<div class="card-body">
								<div class="card-body-icon ">
									<i class="fas fa-fw fa-list"></i>
								</div>
								<div class="hd-text">
									<%
										int countGrant = 0;
										DaoClass objGrant = new DaoClass();
										countGrant = objGrant.getGrantCount();
									%>
									<h3 class=""><%=countGrant%></h3>
									<p class="text-size">Number of Granted Application</p>
									
								</div>
							</div>
						</div>
                      </div>
                      
					  <div class="col-xl-3 col-sm-6 mb-3 ">
							<div class="card text-white bg-warning o-hidden h-100">
								<div class="card-body">
									<div class="card-body-icon ">
										<i class="fas fa-fw fa-shopping-cart"></i>
									</div>
									<div class="hd-text">
										<%
											int amount = 0;
											DaoClass objAmount = new DaoClass();
											amount = objAmount.getAmountDetails();
										%>
												<h3 class="">Rs. <%=amount%></h3>
												<p class="text-size">Amount Granted to Student</p>

										</div>
									</div>

								</div>
						</div>
							
				    	<div class="col-xl-3 col-sm-6 mb-3">
								<div class="card text-white bg-info o-hidden h-100">
									<div class="card-body">
										<div class="card-body-icon ">
											<i class="fas fa-fw fa-list"></i>
										</div>
										<div class="hd-text">
											<%
												int countCancel = 0;
												DaoClass objCancel = new DaoClass();
												countCancel = objCancel.getCancelCount();
											%>
											<h3 class=""><%=countCancel%></h3>
								        	<p class="text-size">Number of Rejected Application</p>
									

										</div>
									</div>

								</div>
							</div>
                         

						</div>

					</div>

					<!-- Sticky Footer -->
					<%@include file="view/footer.jsp"%>

				</div>

			</div>
</body>
</html>