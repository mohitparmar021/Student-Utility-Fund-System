	<nav class="navbar navbar-expand-sm navbar-dark bg-success "> <a
		href="#" class="navbar-brand ml-3">IES IPS Academy</a>
	<button class="navbar-toggler" data-toggle="collapse" id="toggler-btn"
		data-target="#navbarid">
		<span class="navbar-toggler-icon"></span>
	</button>
<%
    
String useremail=(String)session.getAttribute("username");
%>
	<div class="collapse navbar-collapse" id="navbarid">
		<ul class="navbar-nav text-center ml-auto">
			<li class="nav-item"><a href="user-dashboard.jsp" class="nav-link active">Home</a>
			</li>
			<li class="nav-item"><a href="user-profile.jsp?email=<%=useremail %>" class="nav-link active">Profile</a>
			</li>

			<li class="nav-item"><a href="logout.jsp" class="nav-link active">Logout</a>
			</li>
		</ul>
	</div>
	</nav>
	
	<script type="text/javascript">
		$('document').ready(function() {

			$('#toggler-btn').click(function() {

				$('#navbarid').toggle();

			});

		});
	</script>