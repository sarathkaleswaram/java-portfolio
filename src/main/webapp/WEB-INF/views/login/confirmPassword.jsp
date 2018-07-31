<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Centillion Login</title>
<!-- metatags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Magnificent login form a Flat Responsive Widget,Login form widgets, Sign up Web 	forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript">
	
	
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 







</script>

<!-- Meta tag Keywords -->
<link href="resources/css/newLoginCss/style.css" rel="stylesheet"
	type="text/css" media="all" />
<!--stylesheet-css-->
<link rel="stylesheet" href="css/font-awesome.css">
<!--fontawesome-->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<!--online fonts-->
<link href="//fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<!--online fonts-->


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	background-image:
		url("${pageContext.request.contextPath}/resources/img/loginBG.jpg");
	background-size: cover;
	background-attachment: fixed;
}

h1 {
	font-family: "Times New Roman", Times, serif;
	color: white;
	text-shadow: 8px 8px 4px #000000;
}

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
.fa-arrow-circle-o-left {
	color: white;
    font-size: 75px;
    position: absolute;
}
</style>

</head>
<body>
<a href="${pageContext.request.contextPath}/confirmSecurityQuestion" ><span class="fa-fw fa fa-arrow-circle-o-left"></span></a> 
	<div class="w3ls-main">
		<div class="wthree-heading">
			<h1>
				<!-- Centillion Login -->
			</h1>
			<div id="title">
				<h1 align="center" style="color: white;">
					Centillion Smart Tracker<span
						style="font-size: 10px; vertical-align: 200%;">TM</span>
				</h1>
			</div>
		</div>
		<div class="wthree-container">
			<div class="wthree-form">
				<form:form method="POST" commandName="confirmPassword">
					<form:errors path="*" class="alert alert-danger" />
					<c:if test="${not empty success}">
						<br>
						<div class="alert alert-success fade in">
							 ${success}

							<script>
								setTimeout(
										function() {
											document.location = "${pageContext.request.contextPath}/centillion";
										}, 1000); // <-- this is the delay in milliseconds
							</script>

						</div>
					</c:if>
					<c:if test="${not empty error}">
						<br>
						<div class="alert alert-danger">
							<!-- <button class="close" data-dismiss="alert">×</button> -->
							<i class="fa-fw fa fa-times"></i> ${error}

							<script>
								setTimeout(
										function() {
											document.location = "${pageContext.request.contextPath}/centillion";
										}, 1000); // <-- this is the delay in milliseconds
							</script>

						</div>
					</c:if>
					<div class="w3-user">
						<span><i class="fa fa-key" aria-hidden="true"></i></span>
						<form:input path="password" type="password" id="password"
							placeholder="Enter Password" required="required" />
					</div>
					<div class="w3-user">
						<span><i class="fa fa-key" aria-hidden="true"></i></span>
						<form:input path="ReEnterPassword" type="password"
							id="confirm_password" placeholder="Re-enter Password"
							required="required" />
					</div>

					<div class="w3l-submit">
						<input type="submit" value="Submit">
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<div class="agileits-footer">
		<p>&copy 2017 All rights reserved | CentillionNetworks Pvt Ltd.</p>
	</div>
	<script type="text/javascript">
		/* Confirm Password Validation start */

		var password = document.getElementById("password"), confirm_password = document
				.getElementById("confirm_password");

		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Passwords Don't Match");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;

		/* Confirm Password Validation  end */
	</script>
</body>
</html>