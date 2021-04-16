<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
if (session.getAttribute("user") != null) {
	// there is one goto the login servlet
	RequestDispatcher rd = request.getRequestDispatcher("Login");
	rd.forward(request, response);// this lands on the GET in the servlet
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>Login page</title>
<!-- Bootstrap CSS and JS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<!-- cookiealert styles -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.css">
<link href="css/style.css" rel="stylesheet">

</head>
<body>

	<main class="container login">
		<div class="d-flex justify-content-center h-100">
			<div class="card card-login">
				<header class="card-header">
					<h3>
						Sign In <span id="error"></span>
					</h3>
				</header>

				<div class="card-body">
					<form action="<%=request.getContextPath()%>/Login" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Username"
								name="username" required="required">
						</div>

						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control"
								placeholder="Password" name="password" required="required">
						</div>

						<div class="form-group btn_div">
							<input type="submit" value="Login"
								class="btn float-right login_btn">
						</div>
					</form>
					<!-- <footer id="login-footer">Christian Pilz © 2021</footer> -->
				</div>
			</div>
		</div>
	</main>
	
	<div class="alert text-center cookiealert" role="alert">
		<b>Do you like cookies?</b> &#x1F36A; We use cookies to ensure you get
		the best experience on our website.

		<button type="button" class="btn btn-primary btn-sm acceptcookies"
			id="acceptcookie">Agree</button>
		<button type="button" class="btn btn-primary btn-sm declinecookies"
			id="declinecookie">Decline</button>
	</div>

	<script src="js/cookiealert.js"></script>

</body>
</html>
