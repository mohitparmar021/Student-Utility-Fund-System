<%@page import="com.hesg.model.DaoClass"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" type="text/css" href="assets/libraryfile/bootstrap.min.css">
<style>
ul li a
    	{
    		font-size: 25px;
    		margin-left: 10px;
    	}
        .navbar-brand{
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

		<form action="" method="post">
			<%
				String emailUser =request.getParameter("email");
			
			    DaoClass obj=new DaoClass();    
		    	ResultSet rs=obj.displayUserDetail(emailUser);
		    	while(rs.next()){
			%>
			<div class="personalDetail">
				<h2 class="ml-3">Personal Details</h2>
				
			 <input type="email" name="email" value="<%=emailUser%>"
					autocomplete="off" readonly="" placeholder="Enter Your Email"
					class="form-control mt-4 field"> 
					
			<input type="text" name="name" value="<%=rs.getString(3) %>" readonly class="form-control mt-4 field">
					
				
				<%
				     String gender=rs.getString(4);
				     if(gender.equals("male")){
				   %>
				   <select class="form-control  mt-4 field" name="gender">
				   <option value="null">Select Gender</option>
					<option value="male" selected>Male</option>
					<option value="female">Female</option>
				</select> 
				   <%
				     }
				     else
				     {
				    	  %>
						   <select class="form-control  mt-4 field" name="gender">
						   <option value="null">Select Gender</option>
							<option value="male" >Male</option>
							<option value="female" selected>Female</option>
						  </select> 
						   <% 
				     }
				 %>
					
				
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
				<input type="date" name="start" value="<%=rs.getString(11) %>" class="form-control mt-4 field"><span class="text-sm ml-4 text-danger">**Graduation starting Date**</span> 
				<input type="date" name="expect" value="<%=rs.getString(12) %>" readonly class="form-control mt-4 field"><span class="text-sm ml-4 text-danger">**Graduation Completion
					Date**</span><br> <br>
			</div>	
		<%
		    	}
		%>
		</form>

	</div>
</body>
</html>