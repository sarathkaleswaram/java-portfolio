<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>


<html lang="en-us" ng-app="changePassword">
<head>
<title>Change Password</title>

<script src="jQuery/jquery-3.1.1.min.js" type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<script type="application/x-javascript">
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>


<style>
@import
	url(https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900);

* {
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
	width: 100%;
	font-family: "Lato";
	overflow-x: hidden;
}

.preload * {
	-webkit-transition: none !important;
	-moz-transition: none !important;
	-ms-transition: none !important;
	-o-transition: none !important;
	transition: none !important;
	-webkit-animation: none !important;
	-moz-animation: none !important;
	-ms-animation: none !important;
	-o-animation: none !important;
	animation: none !important;
}

#hero {
	height: 350px;
	/* background: #1CB0EC; */
	background:
		url('${pageContext.request.contextPath}/resources/img/logos/security.jpeg');
	font-family: "Times New Roman", Times, serif;
	position: relative;
	overflow: hidden;
}

#hero figure {
	position: absolute;
	right: 80px;
	top: 100px;
	color: #fff;
}

#hero figure blockquote {
	font-weight: 100;
}

#hero h1 {
	font-weight: 100;
	color: #fff;
	font-size: 88px;
	padding-top: 60px;
	padding-left: 80px;
}

#hero span {
	position: absolute;
	bottom: -50px;
	width: 250px;
	left: 0;
	right: 0;
	margin: 0 auto;
	z-index: 10;
}

#hero .img_holder.password .left_arm img {
	left: 78px;
	bottom: 47px;
}

#hero .img_holder.password .right_arm img {
	right: 86px;
	bottom: 47px;
}

#hero .img_holder.password:before {
	left: 78px;
	bottom: 105px;
}

#hero .img_holder.password:after {
	right: 85px;
	bottom: 105px;
}

#hero .img_holder img.dr-glue-little {
	width: 250px;
	z-index: 10;
}

#hero .img_holder:before {
	content: '';
	position: absolute;
	height: 20px;
	width: 40px;
	background: #E9C09B;
	left: 10px;
	bottom: 40px;
	z-index: 999;
	border-radius: 100%;
	transition: 1s;
	-webkit-transition: 1s;
	-moz-transition: 1s;
}

#hero .img_holder:after {
	content: '';
	position: absolute;
	height: 20px;
	width: 40px;
	background: #E9C09B;
	right: 10px;
	bottom: 40px;
	z-index: 999;
	border-radius: 100%;
	transition: 1s;
	-webkit-transition: 1s;
	-moz-transition: 1s;
}

#hero .img_holder .left_arm img, #hero .img_holder .right_arm img {
	position: absolute;
	transition: 1s;
	-webkit-transition: 1s;
	-moz-transition: 1s;
	z-index: 9999;
	width: 45px;
}

#hero .img_holder .left_arm img {
	left: 9px;
	bottom: -22px;
}

#hero .img_holder .right_arm img {
	right: 7px;
	bottom: -22px;
}

form {
	position: relative;
	width: 400px;
	height: 280px;
	margin: 0 auto;
	z-index: 999999999;
}
/* Select_holder style starts here  */
form .select_holder {
	position: relative;
	width: 280px;
	margin: 0 auto;
	display: block;
	width: 280px;
	margin: 0 auto;
	background: #fafafa;
	border: 0;
	outline: 0;
	/*   margin: 10px 0; */
	padding: 10px;
	text-indent: 30px;
	font-weight: 300;
}
/* form .select_holder:nth-of-type(1) {
  margin-top: 40px;
} */
/* form .select_holder:nth-of-type(2) {
  margin-top: 20px;
  margin-bottom: 20px; */
}
/* form .select_holder span {
  position: absolute;
  left: 10px;
  top: 8px; */
}
/* form .select_holder span:after {
  content: '';
  position: absolute;
  width: 1px;
  height: 20px;
  background: #ccc;
  left: 21px;
  top: 0;
} */
/* form .select_holder input {
  display: block;
  width: 300px;
  margin: 0 auto;
  background: #fafafa;
  border: 0;
  outline: 0;
  margin: 10px 0;
  padding: 10px;
  text-indent: 30px;
  font-weight: 300;
} */
form .select_holder input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px #fafafa inset;
}

/* Select_holder style ends here  */
form .input_holder {
	position: relative;
	width: 300px;
	margin: 0 auto;
}

form .input_holder:nth-of-type(1) {
	margin-top: 40px;
}

form .input_holder:nth-of-type(2) {
	margin-top: 20px;
	margin-bottom: 20px;
}

form .input_holder span {
	position: absolute;
	left: 10px;
	top: 8px;
}

form .input_holder span:after {
	content: '';
	position: absolute;
	width: 1px;
	height: 20px;
	background: #ccc;
	left: 21px;
	top: 0;
}

form .input_holder input {
	display: block;
	width: 300px;
	font-family: "Times New Roman", Times, serif;
	margin: 0 auto;
	background: #fafafa;
	border: 0;
	outline: 0;
	margin: 10px 0;
	padding: 10px;
	text-indent: 30px;
	font-weight: 300;
}

form .input_holder input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px #fafafa inset;
}

form .input_holder select {
	display: block;
	width: 300px;
	font-family: "Times New Roman", Times, serif;
	margin: 0 auto;
	background: #fafafa;
	border: 0;
	outline: 0;
	margin: 10px 0;
	padding: 10px;
	text-indent: 30px;
	font-weight: 300;
}

form .input_holder select:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px #fafafa inset;
}

form .submit_button {
	width: 320px;
	height: 36px;
	border: 0;
	color: #fff;
	position: relative;
	margin-left: 50px;
	margin-bottom: 2%;
	cursor: pointer;
	background: #1CB0EC;
	border-bottom: 4px solid #1091c5;
}

form .submit_button:active {
	outline: 0;
	border-bottom: none;
}

#footer {
	color: #000;
	text-align: center;
}

#footer p {
	font-size: 16px;
}

#footer p a {
	text-decoration: none;
	color: #1CB0EC;
	position: relative;
	transition: .5s;
	-webkit-transition: .5s;
}

#footer p a:hover {
	color: #4bc0f0;
}

#footer p a:before, #footer p a:after {
	content: '';
	position: absolute;
	background: #1CB0EC;
	height: 2px;
	left: 0;
	right: 0;
	opacity: 0;
	transition: .5s;
	-webkit-transition: .5s;
}

#footer p a:before {
	top: -10px;
}

#footer p a:after {
	bottom: -10px;
}

#footer p a:hover:before, #footer p a:hover:after {
	opacity: 1;
}

#footer p a:hover:before {
	top: -3px;
}

#footer p a:hover:after {
	bottom: -5px;
}

.myprimary {
	color: #3276b1;
	background-color: rgba(255, 255, 255, .15);
	border-color: rgba(255, 255, 255, .15);
}

.mydanger {
	color: #a90329;
	background-color: rgba(255, 255, 255, .15);
	border-color: rgba(255, 255, 255, .15);
}

.white, .white a {
	color: #fff;
	padding-top: 0.3%;
	padding-left: 0.3%;
	height: 1.2em;
	width: 1.2em;
	border-radius: 50%;
	border: 3px solid #fff;
}
</style>


</head>
<body class="" ng-controller="changePasswordForm">
	<%-- <header style="padding-top: 0px; padding-bottom: 0px;">
		<img
			src="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
			height="60" width="150" alt="CentillionNetworks" id="img1"
			style="width: 120px; height: 55px;">
	</header> --%>
	<div id="hero">
		<div id="background_animate"></div>

		<h1>
			<a class='my-tool-tip' data-toggle="tooltip" data-placement="left"
				title="Go back to Dashboard"
				href="${pageContext.request.contextPath}/dashboard.htm"><i
				class="glyphicon glyphicon-menu-left white"></i></a>&nbsp;&nbsp;Change
			Password ?
		</h1>
		<!-- <span class="img_holder"> <img class="dr-glue-little"
			src="http://www.rentginie.com/vector/confused-man.png"
			alt="Dr Glue Little">

			<div class="left_arm">
				<img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/left-arm.png"
					alt="Left Arm">
			</div>
			<div class="right_arm">
				<img
					src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/right-arm.png"
					alt="Right Arm">
			</div>
		</span> -->
	</div>


	<form:form method="POST" commandName="changePasswordForm"
		class="form-signin">

		<%-- 		<form:errors path="*" class="alert alert-danger" element="div" /> --%>


		<c:if test="${not empty success}">
			<br>
			<div class="alert alert-success fade in">
				<!-- <button class="close" data-dismiss="alert">×</button> -->
				<i class="fa-fw fa fa-times"></i> ${success}

				<script>
					setTimeout(
							function() {
								document.location = "${pageContext.request.contextPath}/dashboard.htm";
							}, 1500); // <-- this is the delay in milliseconds
				</script>

			</div>
		</c:if>

		<div class="input_holder">
			<span><i class="fa fa-user"></i></span>
			<form:input type="text" name="userid" path="oldPassword"
				required="required" ng-model="oldpassword" class="Password-control"
				ng-blur="passwordCheck()" placeholder="Enter Old Password" />
			<span style="color: red;">*</span>
			<div ng-show="oldpassmatch">
				<small id="oldpass">Does Not Match With Your Old Password </small>
			</div>

		</div>

		<div class="input_holder">
			<span><i class="fa fa-user"></i></span>
			<form:select required="required" path="securiyQuestion" id="question"
				ng-model="question">
				<form:option value="">--- Please Select Security Question ---</form:option>
				<form:option value="In which city you were born?"
					label="In which city you were born?" />
				<form:option value="What is your mother's maiden name?"
					label="What is your mother's maiden name?" />
				<form:option value="What is your pet's name?"
					label="What is your pet's name?" />
				<form:option
					value="In which city did you meet your spouse/significant other?"
					label="In which city did you meet your spouse/significant other?" />
				<form:option
					value="What is the name of your favorite childhood friend?"
					label="What is the name of your favorite childhood friend?" />
				<form:option value="what was the location of your first job?"
					label="what was the location of your first job?" />
			</form:select>
			<span style="color: red;">*</span>
		</div>

		<div class="input_holder">
			<span style="color: red;"><i class="fa fa-user"></i></span>
			<form:input type="text" name="security_answer" path="answer"
				required="required" ng-model="answer"
				placeholder="Enter your answer" />
			<span style="color: red;">*</span>
		</div>

		<div class="input_holder">
			<span><i class="fa fa-user"></i></span>
			<form:input type="password" name="new_password" path="password"
				required="required" id="password" placeholder="Enter New Password" />
			<span style="color: red;">*</span>
		</div>

		<div class="input_holder">
			<span><i class="fa fa-lock"></i></span>
			<form:input type="password" name="confirm_password"
				required="required" path="ReEnterPassword" id="confirm_password"
				placeholder="Re-enter your password" />
			<span style="color: red;">*</span>

			<!-- 				<div ng-show="cnfrmPassword"> <small style="color: red;" id="cnfrmPassword">Passwords Don't Match</small> </div> -->
		</div>
		<br>


		<input type="submit" ng-disabled="oldpassmatch" class="submit_button"
			value="Submit">
		<br>
		<%-- <input type="button" onclick="location.href='${pageContext.request.contextPath}/dashboard.htm'" class="submit_button" value="Back" /> --%>


	</form:form>
	<script type="text/javascript">
		window.onload = function() {
			var p = document.getElementById("password_field");

			p.onfocus = function() {
				document.querySelector(".img_holder").className += " password";
			}

			p.onblur = function() {
				document.querySelector(".password").className = "img_holder";
			}

			document.querySelector("body").className = "";
		}

		var app = angular.module('changePassword', []);
		app
				.controller(
						'changePasswordForm',
						function($scope, $http) {
							/* $scope.sessionPassword = "${sessionScope.sessionobject.password}";
							$scope.question = "${sessionScope.sessionobject.securiyQuestion}";
							$scope.answer = "${sessionScope.sessionobject.answer}"; */

							$scope.oldpassmatch = false;

							$http.post(
									'${pageContext.request.contextPath}/data')
									.then(function(response) {
										$scope.list = response.data;
										$scope.autofillList();
									});

							$scope.autofillList = function() {
								$scope.sessionPassword = $scope.list.password;
								$scope.question = $scope.list.securiyQuestion;
								$scope.answer = $scope.list.answer;
							}

							/* old password Check Start */

							$scope.passwordCheck = function() {
								// 				alert(sessionScope.sessionobject.password);
								if ($scope.sessionPassword == $scope.oldpassword) {
									document.getElementById("oldpass").style.color = 'green';
									$scope.oldpassmatch = false;

								} else {
									document.getElementById("oldpass").style.color = "red";
									$scope.oldpassmatch = true;
								}

							};
							/* old password Check end */

							/* Confirm Password Validation start */

							var password = document.getElementById("password"), confirm_password = document
									.getElementById("confirm_password");

							function validatePassword() {
								if (password.value != confirm_password.value) {
									confirm_password
											.setCustomValidity("Passwords Don't Match");
								} else {
									confirm_password.setCustomValidity('');
								}
							}

							password.onchange = validatePassword;
							confirm_password.onkeyup = validatePassword;

							/* Confirm Password Validation  end */

						});
	</script>
</body>
</html>
