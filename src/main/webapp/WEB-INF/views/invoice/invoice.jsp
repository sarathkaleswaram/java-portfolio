<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en-us" ng-app="client">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<title>Invoice</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
	alt="ProjectMatrix" type="image/png" />

<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- AngularJS Scripts -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>




<!-- AngularJS End  -->



<!-- Basic Styles -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin-skins.min.css">

<!-- SmartAdmin RTL Support -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin-rtl.min.css">

<!-- GOOGLE FONT -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

<!--  top menu component -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/component.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin_custom.css">
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>

<style type="text/css">
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
</style>

<!-- AngularJS style sheet -->
<style>
input.ng-invalid.ng-touched, textarea.ng-invalid.ng-touched {
	border: 1px solid red;
}

input[disabled="disabled"] {
	opacity: 0.4;
	cursor: not-allowed !important;
}

.content {
	margin: 0 300px;
}
</style>
<!-- AngularJS style sheet end-->



</head>

<body class="">
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../sideBar.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- MAIN PANEL -->
	<div id="main" role="main">

		<!-- RIBBON -->
		<div id="ribbon">

			<span class="ribbon-button-alignment"> <span id="refresh"
				class="btn btn-ribbon" data-action="resetWidgets"
				data-title="refresh" rel="tooltip" data-placement="bottom"
				data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings."
				data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>
			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Invoice</li>
			</ol>
			<!-- end breadcrumb -->
			<%-- <span class="ribbon-button-alignment pull-right"
				style="padding-top: 0px;"> <a
				href="${pageContext.request.contextPath}/callManager/searchPhNo"><img
					class="btn " style="padding-top: 5px; width: 54px;"
					src="${pageContext.request.contextPath}/resources/img/apsfl/phone.png"
					title="New Call" alt="Submit"> </a> <a
				href="${pageContext.request.contextPath}/callSummary/view"><img
					class="btn " style="padding-top: 5px; width: 54px;"
					src="${pageContext.request.contextPath}/resources/img/apsfl/Charts-Combo-icon.png"
					title="Call Summary" alt="Submit"> </a></span> --%>
		</div>
		<!-- END RIBBON -->

		<br />
		<br />
		<div class="container main-content" ng-controller="MinMaxCtrl">
			<form ng-submit="onSubmit(theForm.$valid)" name="theForm"
				novalidate="novalidate">

				<div class="form-group">
					<div class="col-lg-5">
						<label for="cli_pro_code">Client Name</label> <select
							name="cli_pro_code" id="cli_pro_code" class="form-control"
							ng-model="formModel.cli_pro_code">
							<option value="">====select===</option>
							<option value="code1">COMCAST</option>
							<option value="code2">COX FTTH</option>
							<option value="code3">HFC(Australia)</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-5">
						<label for="res_fb">Invoice Date</label>
						<div class="input-group input-append date" id="">
							<input type="text" class="form-control" name="date" /> <span
								class="input-group-addon add-on"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-5">
						<label for="invoice_no">Invoice No</label> <input type="text"
							class="form-control" ng-model="formModel.invoice_no"
							id="invoice_no" required="required" ng-disabled="false"
							minlength="1">
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-5">
						<label for="job_completed">Jobs Completed</label> <select
							name="job_completed" id="job_completed" class="form-control"
							ng-model="formModel.job_completed">
							<option value="">Please Choose</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-5">
						<label for="project_code">Project Code</label> <input type="text"
							class="form-control" ng-model="formModel.project_code"
							id="project_code" required="required" ng-disabled="false">
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-5">
						<label for="res_fb">Approval Date(by Client)</label>
						<div class="date">
							<div class="input-group input-append date" id="">
								<input type="text" class="form-control" name="date" /> <span
									class="input-group-addon add-on"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-5">
						<label for="invoice_amt">Invoice Amount</label> <input type="text"
							class="form-control" ng-model="formModel.invoice_amt"
							id="invoice_amt" required="required" ng-disabled="false">
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-5">
						<label for="res_fb">Received Date</label>
						<div class="input-group input-append date" id="">
							<input type="text" class="form-control" name="date" /> <span
								class="input-group-addon add-on"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-5">
						<label for="rcvd_amt">Received Amount</label> <input type="text"
							class="form-control" ng-model="formModel.rcvd_amt" id="username"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-5">
						<label for="bal_amt">Balance Amount</label> <input type="text"
							class="form-control" ng-model="formModel.bal_amt" id="username"
							required="required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-5">
						<label for="job_id">Remarks</label><br>
						<textarea ng-model="myTextarea" textarea rows="3" cols="60"></textarea>
					</div>
				</div>

				<div class="col-lg-8">
					<button class="btn btn-primary" type="submit" ng-click="onSubmit()">Submit</button>
				</div>
			</form>
		</div>







		<script>
			$(document).ready(function() {
				$('#datePicker1').datepicker({
					format : 'mm/dd/yyyy'
				}).on('changeDate', function(e) {
					// Revalidate the date field
					$('#eventForm').formValidation('revalidateField', 'date');
				});
				$('#datePicker2').datepicker({
					format : 'mm/dd/yyyy'
				}).on('changeDate', function(e) {
					// Revalidate the date field
					$('#eventForm').formValidation('revalidateField', 'date');
				});
				$('#datePicker3').datepicker({
					format : 'mm/dd/yyyy'
				}).on('changeDate', function(e) {
					// Revalidate the date field
					$('#eventForm').formValidation('revalidateField', 'date');
				});
				$('#datePicker4').datepicker({
					format : 'mm/dd/yyyy'
				}).on('changeDate', function(e) {
					// Revalidate the date field
					$('#eventForm').formValidation('revalidateField', 'date');
				});

				$('#eventForm').formValidation({
					framework : 'bootstrap',
					icon : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						name : {
							validators : {
								notEmpty : {
									message : 'The name is required'
								}
							}
						},
						date : {
							validators : {
								notEmpty : {
									message : 'The date is required'
								},
								date : {
									format : 'MM/DD/YYYY',
									message : 'The date is not a valid'
								}
							}
						}
					}
				});
			});

			var app=angular.module('client',[]);
			app.controller('MinMaxCtrl', function($scope, $http){
			$scope.formModel={};
			$scope.onSubmit=function(valid){
			if(valid) { 
			console.log("hey ");
			console.log($scope.formModel);
			}else{
			console.log("Invalid");
			}
			};
			});
		</script>



		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }'
			src="${pageContext.request.contextPath}/resources/js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script>
			if (!window.jQuery) {
				document
						.write('<script src="${pageContext.request.contextPath}/resources/js/libs/jquery-2.1.1.min.js"><\/script>');
			}
		</script>

		<script
			src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document
						.write('<script src="${pageContext.request.contextPath}/resources/js/libs/jquery-ui-1.10.3.min.js"><\/script>');
			}
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script
			src="${pageContext.request.contextPath}/resources/js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>

		<!-- BOOTSTRAP JS -->
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script
			src="${pageContext.request.contextPath}/resources/js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script
			src="${pageContext.request.contextPath}/resources/js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- SPARKLINES -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script
			src="${pageContext.request.contextPath}/resources/js/plugin/fastclick/fastclick.min.js"></script>

		<!--[if IE 8]>

		<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

		<![endif]-->


		<!-- MAIN APP JS FILE -->
		<script
			src="${pageContext.request.contextPath}/resources/js/app.min.js"></script>
</body>

</html>