<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<title>Header</title>
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--  top menu component -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/component.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin_custom.css">
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>
</head>

<body class="">


	<!-- HEADER -->
	<header id="header" style="height: 55px;">

		<div id="logo-group">
			<!-- PLACE YOUR LOGO HERE -->
			<span id="logo"> <img
				src="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
				alt="ProjectMatrix">
			</span>
		</div>

		<!-- pulled right: nav area -->
		<div class="pull-right">
			<!-- collapse menu button -->
			<div id="hide-menu" class="btn-header pull-right">
				<span> <a href="javascript:void(0);" data-action="toggleMenu"
					title="Collapse Menu"><i class="fa fa-reorder"></i></a>
				</span>
			</div>
			<!-- end collapse menu -->
			<!-- #MOBILE -->
			<!-- Top menu profile link : this shows only when top menu is active -->
			<ul id="mobile-profile-img"
				class="header-dropdown-list hidden-xs padding-5">
				<li class=""><a href="#"
					class="dropdown-toggle no-margin userdropdown"
					data-toggle="dropdown"> <img src="img/avatars/sunny.png"
						alt="John Doe" class="online" />
				</a>
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:void(0);"
							class="padding-10 padding-top-0 padding-bottom-0"><i
								class="fa fa-cog"></i> Setting</a></li>
						<li class="divider"></li>
						<li><a href="profile.html"
							class="padding-10 padding-top-0 padding-bottom-0"> <i
								class="fa fa-user"></i> <u>P</u>rofile
						</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0);"
							class="padding-10 padding-top-0 padding-bottom-0"
							data-action="toggleShortcut"><i class="fa fa-arrow-down"></i>
								<u>S</u>hortcut</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0);"
							class="padding-10 padding-top-0 padding-bottom-0"
							data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i>
								Full <u>S</u>creen</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/logout"
							class="padding-10 padding-top-5 padding-bottom-5"
							data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i>
								<strong><u>L</u>ogout</strong></a></li>
					</ul></li>
			</ul>


			<!-- search mobile button (this is hidden till mobile view port) -->
			<div id="search-mobile" class="btn-header transparent pull-right">
				<span> <a href="javascript:void(0)" title="Search"><i
						class="fa fa-search"></i></a>
				</span>
			</div>
			<!-- end search mobile button -->

			<!-- input: search field -->
			<!-- <form action="search.html" class="header-search pull-right"> -->
			<div class="header-search pull-right">
				<input id="search-fld" type="text" name="param"
					placeholder="Find reports and more"
					data-autocomplete='[
					"ActionScript",
					"AppleScript",
					"Asp",
					"BASIC",
					"C",
					"C++",
					"Clojure",
					"COBOL",
					"ColdFusion",
					"Erlang",
					"Fortran",
					"Groovy",
					"Haskell",
					"Java",
					"JavaScript",
					"Lisp",
					"Perl",
					"PHP",
					"Python",
					"Ruby",
					"Scala",
					"Scheme"]'>
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
				<a href="javascript:void(0);" id="cancel-search-js"
					title="Cancel Search"><i class="fa fa-times"></i></a>
			</div>
			<!-- </form> -->
			<!-- end input: search field -->

			<!-- logout button -->
			<div id="logout" class="btn-header transparent pull-right">
				<div class="dropdown">
				Project Matrix v3.0
					<button class="btn dropdown-toggle" type="button"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true"
						style="background: url('${pageContext.request.contextPath}/resources/img/logos/user.png'); background-size: cover; width: 50px; height: 50px">

					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a
							href="${pageContext.request.contextPath}/changePassword">Change
								Password</a></li>
						<li><a href="${pageContext.request.contextPath}/logout"
							title="Sign Out" data-action="userLogout"
							data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i
								class="fa fa-sign-out"></i> Log Out </a></li>
					</ul>
				</div>

			</div>
			<!-- end logout button --><!-- 
			fullscreen button
			<div id="fullscreen" class="btn-header transparent pull-right">
				Project Matrix v2.0 <span> <a href="javascript:void(0);"
					data-action="launchFullscreen" title="Full Screen"><i
						class="fa fa-arrows-alt"></i></a>
				</span>
			</div>
			end fullscreen button -->
		</div>
		<!-- end pulled right: nav area -->
	</header>
	<!-- END HEADER -->
</body>
</html>