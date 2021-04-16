<%@page import="model.beans.FeedBean"%>
<%@page import="model.beans.UserBean"%>
<%@page import="java.sql.ResultSet"%>

<%
Cookie ck[] = request.getCookies();
%>

<%!// This method will check if there is a cookie called darkTheme and if it is true, then return classname
	public String darkTheme(Cookie[] ck) {
		for (int i = 0; i < ck.length; i++) {
			if (ck[i].getName().equals("darkTheme") && ck[i].getValue().equals("true")) {
				return "body-dark";
			}
		}
		return "";
	}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<title>Logged in</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script defer
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

<!-- My own CSS stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>

<!-- Body class will be either light or dark theme -->
<body class="<%=darkTheme(ck)%>" id="feedBody">
	<main class="d-flex justify-content-center h-100">
		<div class="feed">
			<header class="row feedCard-header">
				<div class="row">
					<%
					// Check to see if the session has a user bean.
					if (session.getAttribute("user") == null) {
						// if there is not one, goto the logout servlet
						RequestDispatcher rd = request.getRequestDispatcher("Logout");
						rd.forward(request, response);
					} else {
						// if there is a session , then all is well  
						// get the bean to unpack the user data
						UserBean userBean = (UserBean) request.getAttribute("user");
						out.print("<h5>Hi " + userBean.getUsername() + "</h5>");
					}
					%>
				</div>

				<!-- Change theme here. -->
				<div class="col">
					<button onclick="changeThemeFunction()" type="button"
						class="btn pull-right" id="bSmall">
						<i class="fas fa-adjust"></i>
					</button>
				</div>
			</header>

			<h2>Messages</h2>
			<div class="col">
				<form action="<%=request.getContextPath()%>/searchFeedController"
					method="POST">
					<input type="text" class="formSearch"
						placeholder="Search for a message or hashtag" name="searchInput"
						maxlength="25">
					<button type="submit" class="btn" id="buSmall">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>

			<div class="feeds">
				<%
				FeedBean feedBean = (FeedBean) request.getAttribute("feedBean");

				if (feedBean != null) {
					System.out.println(feedBean.getResultSet());
					ResultSet resultSet = feedBean.getResultSet();
					//Print messages
					String divClassForContainer = "container container-feed";
					String timePlacement = "time-right";
					while (resultSet.next()) {

						// Creating string variables to show which resultSet result is which.
						String feedAuthor = resultSet.getString(4);
						String feedTag = resultSet.getString(3);
						String feedPost = resultSet.getString(2);
						String feedDateTime = resultSet.getString(5);

						// Print the feed on the website.
						out.println("<div class=\"" + divClassForContainer + "\">");
						out.println("<div class=\"feed-header\"><span class=\"feedUsersName\">" + feedAuthor
						+ "</span> <span class=\"feedHashtag\">" + feedTag + "</span></div>");
						out.println("<p>" + feedPost + "</p>");
						out.println("<span class=\"" + timePlacement + "\">" + feedDateTime + "</span>");
						out.println("</div>");

						// This will print either white background with time on the right or darker background with time on left of the feed messages
						if (divClassForContainer.equals("container container-feed")) {
					divClassForContainer = "container container-feed darker";
					timePlacement = "time-left";
						} else {
					divClassForContainer = "container container-feed";
					timePlacement = "time-right";
						}
					}
				}
				%>
			</div>

			<form class="feed-form"
				action="<%=request.getContextPath()%>/feedController" method="POST">
				<textarea rows="10" cols="40" name="message" required="required"
					placeholder="Your text here" class="formMessage" maxlength="255"></textarea>
				<br> <input type="text" class="formHashTag"
					placeholder="#hashtag" name="hashTag" maxlength="25" /> <input
					type="submit" value="Send" class="btn float-right login_btn">
			</form>

			<div class="col leftbtnAlign">
				<form action="<%=request.getContextPath()%>/Logout" method="post">
					<button class="btn btn-primary " type="submit">Log out</button>
				</form>
			</div>

			<!-- <footer>Christian Pilz © 2021</footer> -->
		</div>
	</main>

	<div class="alert text-center cookiealert" role="alert">
		<b>Do you like cookies?</b> We use cookies to ensure you get the best
		experience on our website.

		<button type="button" class="btn btn-primary btn-sm acceptcookies"
			id="acceptcookie">Agree</button>
		<button type="button" class="btn btn-primary btn-sm declinecookies"
			id="declinecookie">Decline</button>
	</div>

	<script src="js/cookiealert.js"></script>
	<script>
		function changeThemeFunction() {
			var element = document.body;
			element.classList.toggle("body-dark");

			if ((document.cookie.includes("acceptCookies=true"))) {
				if (document.getElementById("feedBody").classList.item(0) == "body-dark") {
					document.cookie = "darkTheme=true";
				} else {
					document.cookie = "darkTheme=false";
				}
			}
		}
	</script>

</body>
</html>
