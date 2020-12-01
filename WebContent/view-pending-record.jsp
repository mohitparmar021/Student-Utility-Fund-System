<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Pending Record</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets\FontAwesome\css\all.css">
<link rel="stylesheet" type="text/css" href="assets/style.css">
<style>
body{
background-color:#1c652d
}

card {
	padding: 10px;
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
					<li class="breadcrumb-item active">Pending Application</li>
				</ol>

			
				<div class="card">
					<div class="mt-2">

	<form action="updateStatus" method="post" onsubmit="return validate()">
			<%
			
         String refid=(String)request.getParameter("ref_id");
         int id=Integer.parseInt(refid);
         DaoClass objPending=new DaoClass();
         ResultSet rs=objPending.viewPendingRecord(id);
         
         
         
         if(rs.next())
         {
%>
			<div class="personalDetail">
				<h2 class="ml-3">Transaction Details</h2>
		    <input type="text" name="refid" value="<%=refid%>" readonly
					class="form-control mt-4 field"> <span
					class="text-sm ml-4 text-danger">**Reference Id**</span>
			 <input type="email" name="email" value="<%=rs.getString(2)%>"
					autocomplete="off" readonly="" placeholder="Enter Your Email"
					class="form-control mt-4 field"> 
					
			<input type="text" name="name" value="<%=rs.getString(9) %>" readonly class="form-control mt-4 field">
		    <input type="text" name="transaction_id" value="<%=rs.getString(3) %>" readonly class="form-control mt-4 field">	<span
					class="text-sm ml-4 text-danger">**Transaction Id**</span>
				
			<input type="date" name="dob" readonly value="<%=rs.getString(5)%>" class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Date of Transaction**</span> 
					
			 <input	type="text" name="retailername" readonly  value="<%=rs.getString(4) %>" class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Retailer Name**</span>
					
			 <input type="text" readonly value="<%=rs.getString(6) %>" name="category" class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Project Name**</span>
					
		    
				<textarea rows="5" cols="5" name="projectDescription" readonly class="form-control mt-4 field"><%=rs.getString(14) %></textarea>
	
					
					 <input type="text" readonly value="<%=rs.getString(7) %>" name="category" class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Rebate Amount**</span>
					
		</div>

			<div class="education mt-5">
				<h2 class="ml-3">Bank Details</h2>

				<input type="text" name="bankname" value="<%=rs.getString(10) %>" readonly class="form-control mt-4 field"> 
				<input type="number" name="accountnumber" value="<%=rs.getString(11) %>" readonly class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Account Number**</span> 				
					
			</div>	
			
				<a href="view-receipt.jsp?ref=<%=id %>" class="btn btn-success ml-4 mt-4 btn-lg">View Receipt</a>	
			
			<div>
			      <select class="form-control mt-4 field" name="status" id="status">
			              <option value="null">- Please - Select -Application - Status-</option>
			              <option value="Pending">Pending</option>
			              <option value="Cancel">Cancel</option>
			              <option value="Confirm">Confirm</option>
			      </select>   
			     <input type="text" name="remark" required placeholder="Please Add Remark" class="form-control mt-4 mb-5 field"> 
			</div>
			
			<input type="submit" value="Submit Application" class="btn btn-success ml-4 mb-5 btn-lg">
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