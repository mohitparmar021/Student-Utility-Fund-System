<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<link rel="stylesheet" type="text/css"
	href="assets/libraryfile/bootstrap.min.css">
<script src="assets/libraryfile/jquery-3.4.1.min.js"></script>

<style type="text/css">
.jumbotron {
	border-radius: 0px;
}

p {
	font-size: 30px;
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

	<div class="jumbotron bg-success">

		<h1 class="text-white text-center">Congrats... Your have Register
			Successfully...</h1>
		<p class="text-white text-center mt-3">Please Update Your
			Profile...</p>
	</div>

	<div class="container">

		<form action="User_info" method="post" onsubmit="return validate()">
			<%
				String email = (String) request.getAttribute("username");
			%>
			<div class="personalDetail">
				<h2 class="ml-3">Personal Details</h2>
				<input type="email" name="email" value="<%=email%>"
					autocomplete="off" readonly="" placeholder="Enter Your Email"
					class="form-control mt-4 field"> <input type="text"
					name="name" autocomplete="off" required
					placeholder="Enter Your Name" class="form-control mt-4 field">
				<select class="form-control required mt-4 field" name="gender">
					<option value="null">Select Gender</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
				</select> <input type="date" name="dob" autocomplete="off" required
					placeholder="Enter Your D.O.B" class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Date of Birth**</span> <input
					type="number" name="mobile" autocomplete="off" required
					placeholder="Enter Your Mobile Number"
					class="form-control mt-4 field"> <input type="text"
					name="address" autocomplete="off" required
					placeholder="Enter Your Address" class="form-control mt-4 field">
			</div>

			<div class="education mt-5">
				<h2 class="ml-3">Education Details</h2>

				<input type="text" name="university" autocomplete="off" required
					placeholder="Enter Your University Name"
					class="form-control mt-4 field"> <input type="text"
					name="college" autocomplete="off" required
					placeholder="Enter Your College Name"
					class="form-control mt-4 field"> <input type="text"
					name="course" autocomplete="off" required
					placeholder="Enter Your Course Name"
					class="form-control mt-4 field"> <input type="date"
					name="start" autocomplete="off" required
					class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Graduation starting
					Date**</span> <input type="date" name="expect" autocomplete="off" required
					class="form-control mt-4 field"><span
					class="text-sm ml-4 text-danger">**Graduation Completion
					Date**</span><br> <br>
			</div>

			<input type="submit" name="" value="Update Profile"
				class="btn btn-lg btn-success ml-3 mt-3  mb-4">
		</form>

	</div>
<script type="text/javascript">

function validate()
{ 
	  alert("Your Registration is Successfully Completed...Please Login..");
	   return true;
}

</script>


</body>
</html>