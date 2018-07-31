<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>

<!--webfonts-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700'
	rel='stylesheet' type='text/css'>
<!--//webfonts-->

<link
	href="${pageContext.request.contextPath}/resources/css/loginStyle.css"
	rel='stylesheet' type='text/css' />
<style type="text/css">
.alert {
	padding: 15px;
	margin-bottom: 18px;
	border: 1px solid transparent;
	border-radius: 2px
}

.alert h4 {
	margin-top: 0;
	color: inherit
}

.alert .alert-link {
	font-weight: 700
}

.alert>p, .alert>ul {
	margin-bottom: 0
}

.alert>p+p {
	margin-top: 5px
}

.alert-dismissable, .alert-dismissible {
	padding-right: 35px
}

.alert-dismissable .close, .alert-dismissible .close {
	position: relative;
	top: -2px;
	right: -21px;
	color: inherit
}

.alert-success {
	background-color: #dff0d8;
	border-color: #468847;
	color: #468847
}

.alert-success hr {
	border-top-color: #3d773e
}

.alert-success .alert-link {
	color: #356635
}

.alert-info {
	background-color: #d6dde7;
	border-color: #9cb4c5;
	color: #346597
}

.alert-info hr {
	border-top-color: #8ca8bc
}

.alert-info .alert-link {
	color: #274c71
}

.alert-warning {
	background-color: #fcf8e3;
	border-color: #dbab57;
	color: #c09853
}

.alert-warning hr {
	border-top-color: #d6a042
}

.alert-warning .alert-link {
	color: #a47e3c
}

.alert-danger {
	background-color: #f2dede;
	border-color: #b94a48;
	color: #b94a48
}

.alert-danger hr {
	border-top-color: #a74240
}

.alert-danger .alert-link {
	color: #953b39
}

.close {
	float: right;
	font-size: 19.5px;
	font-weight: 700;
	line-height: 1;
	color: #000;
	text-shadow: 0 1px 0 #fff;
	opacity: .2;
	filter: alpha(opacity = 20)
}

.close:focus, .close:hover {
	color: #000;
	text-decoration: none;
	cursor: pointer;
	opacity: .5;
	filter: alpha(opacity = 50)
}

button.close {
	padding: 0;
	cursor: pointer;
	background: 0 0;
	border: 0;
	-webkit-appearance: none
}

.alert-dismissable .close, .alert-dismissible .close {
	position: relative;
	top: -2px;
	right: -21px;
	color: inherit
}

body h1 {
	color: #040012;
}
</style>
<style type="text/css">
div.container {
	width: 100%;
	border: 1px solid gray;
}

header, footer {
	padding: 1em;
	color: #000000;
	background-color: #f2f2f2;
	/* clear: left; */
	/* text-align: center; */
}

header h1 {
	text-align: center;
}

nav {
	float: left;
	max-width: 160px;
	margin: 0;
	padding: 1em;
}

nav ul {
	list-style-type: none;
	padding: 0;
}

nav ul a {
	text-decoration: none;
}

article {
	margin-left: 170px;
	border-left: 1px solid gray;
	padding: 1em;
	overflow: hidden;
}
h1 {
	font-family: "Times New Roman", Times, serif;
	color: white;
	text-shadow: 8px 8px 4px #000000;
}

#loginBox {
	position: relative;
}
</style>


</head>
<body>
	<header style="padding-top: 0px;padding-bottom: 0px;">  <img src="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
		height="60" width="150" alt="CentillionNetworks" id="img1" style="width: 120px; height: 55px;"> 
	</header>
	<%-- <img src="${pageContext.request.contextPath}/resources/img/lg_logo.png"
		alt="ProjectMatrix" height="300" width="300"
		style="padding-left: 5%; padding-top: 1%; position: absolute;"> --%>
	<div id="title" style="padding-top: 5%;">
		<h1 align="center" style="color: white;">Centillion Smart Tracker<span style="font-size: 10px;vertical-align:200%;">TM</span></h1>
	</div>
	<!-- <h1>Login Form</h1> -->
	<!--/start-login-one-->
	<div id="loginBox" class="login">
		<div class="ribbon-wrapper h2 ribbon-red">
			<div class="ribbon-front">
				<h2>User Login</h2>
			</div>
			<div class="ribbon-edge-topleft2"></div>
			<div class="ribbon-edge-bottomleft"></div>
		</div>

		<form:form method="POST" commandName="loginForm" class="form-signin">
			<%-- <form:errors path="*" class="alert alert-danger"  /> --%>
			<c:if test="${not empty message}">
				<div class="alert alert-danger fade in">
					<!-- <button class="close" data-dismiss="alert">×</button> -->
					<i class="fa-fw fa fa-times"></i> <strong>Error!</strong> ${message }
				</div>
			</c:if>
			<form:input path="resource.empId" name="resource.empId" class="text"
				placeholder="User Name"
				style="padding-top: 1px; padding-bottom: 1px; border-top-width: 10px; margin-top: 15px;margin-left: 40px;padding-left: 1px;"
				required="required" />
			<i class="icon user"></i>

			<br>
			<br>
			<form:input type="password" path="password" name="password"
				class="form-control" placeholder="Password" required="required"
				style="padding-top: 1px; padding-bottom: 1px; border-top-width: 10px; margin-top: 15px;margin-left: 40px;padding-left: 1px;" />
			<i class="icon lock"></i>
			<br>
			<br>
			<div class="submit">
				<input type="submit" value="Sign in"
					style="height: 49px; padding-top: 13px;">
			</div>
		</form:form>
	</div>
	<!--start-copyright-->
	<div class="copy-right">
		<p>
			&copy 2017 All rights reserved | CentillionNetworks Pvt Ltd.</a>
		</p>
	</div>
	<!--//end-copyright-->
</body>
</html>