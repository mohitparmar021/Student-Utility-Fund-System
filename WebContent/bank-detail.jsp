<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bank Details</title>
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
         .btn {
		border-radius: 0px;
		width:25%;
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
   </style>
</head>
<body>
<%@include file="view/navbar.jsp"%>

<div class="container mt-5">
	  
	  <form action="bankdetails" method="post">
	  	    	    <h1 class="text-center">Deposit Account Details</h1>
	  	    	    <p class="text-center">Enter the details of the account you wish to have the rebate deposited into.</p>
	  	    	<%
	  	    	    String email12=(String)request.getAttribute("email");
	  	    	    String transactionid=(String)request.getAttribute("transaction_id");
	  	    	%>   
	  	    	   <div class="accountDetail">
	  	    	      	
	  	    	      	 <input type="text" name="email" autocomplete="off" readonly value="<%=email12 %>" class="form-control mt-4 field">
	  	    	   	    
                         <input type="text" name="id" autocomplete="off" readonly  value="<%=transactionid %>" class="form-control mt-4 field">
	  	    	   
	  	    	   	     <input type="text" name="name" autocomplete="off" required placeholder="Enter Account Holder Name " class="form-control mt-4 field">
	  	    	   	    
                         <input type="text" name="bankname" autocomplete="off" required  placeholder="Enter Bank Name" class="form-control mt-4 field">
	  	    	   
                    <input type="number" name="accountnumber" autocomplete="off" placeholder="Enter Account Number" required class="form-control mt-4 field">
                    <span class="text-danger ml-4">

                    
                     </div>

                   <input type="submit" name="" value="Submit" class="btn btn-lg btn-success ml-3 mt-3  mb-4">
	  	    </form>

</div>


</body>
</html>
</html>