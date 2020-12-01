<%@page import="java.sql.ResultSet"%>
<%@page import="com.hesg.model.DaoClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pending Grants</title>
<link rel="stylesheet" type="text/css" href="assets/libraryfile/bootstrap.min.css">
  
     <style type="text/css">
    	ul li a
    	{
    		font-size: 25px;
    		margin-left: 10px;
    	}
        .navbar-brand{
        	font-size: 35px;
        }
       
	.btn1
	{
	  padding: 7px;
	  border-radius: 5px;
	}
	.field
	{
		height: 50px;
		border-radius: 0px;
		border-top: 0px;
		border-left: 0px;
		border-right: 0px;
		margin-left: 20px;
		background-color: #f1f1f1;
	}
	.pending{
	   border-radius:5px;
	   padding:8px;
	   background-color:green;
	   color:white;
	}
   </style>
</head>
<body>
<%@include file="view/navbar.jsp"%>
<div class="container mt-5 mb-5">
		<%
		 
		   String email=request.getParameter("email");
		%>

		<div class="">
			<h1 class="text-center">Pending Grants Details</h1>
			
			<table class="table-responsive-lg table-striped mb-3 mt-4"
							cellpadding="10px" style="width: 100%" border="1px">
							<thead>
								<tr class="bg-success text-white">
									<th>Reference Number </th>
									<th>Name</th>
									<th>Transaction Id</th>
									<th>Project Name</th>
									<th>Rebate Value</th>
									<th>Bank Name</th>
									<th>Status</th>
									
								</tr>
							</thead>
							<tbody>
								<%
								     DaoClass obj=new DaoClass();
								     ResultSet rs=obj.viewPendingGrant(email);
								     while(rs.next())
								     {
								%>
								<tr>
									<td><%=rs.getInt(1)%></td>
									<td><%=rs.getString(2)%></td>
									<td><%=rs.getString(3)%></td>
									<td><%=rs.getString(4) %></td>
									<td><%=rs.getString(5)%></td>
									<td><%=rs.getString(6)%></td>
									<td><span class="pending"><%=rs.getString(7)%></span></td>
									
								</tr>
								<%
									}
								%>

							</tbody>
							

						</table>			
		</div>


	</div>

</body>
</html>