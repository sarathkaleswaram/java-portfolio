<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en-us" ng-app="acptApp">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<title>Action Points Tracker</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
	alt="ProjectMatrix" type="image/png" />

<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>



<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.js"></script>
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular.min.js"></script>
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular-animate.min.js"></script>
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular-resource.min.js"></script>
<script
	src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.14.3.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.css">

<script type='text/javascript'
	src="https://rawgit.com/long2know/angular-directives-general/master/src/multiselect.js"></script>


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

.asterisc {
	display: block;
	color: black;
	margin: -19px -9px;
}
</style>

<!-- AngularJS style sheet -->

<style>
/* input.ng-invalid.ng-touched, textarea.ng-invalid.ng-touched {
	border: 1px solid red;
} */
.content {
	margin: 0 300px;
}

.modal-dialog {
	width: 50%;
}

.modal-body {
	margin: 1% 10%;
}

.model-footer {
	margin: 1% 10%;
}

multiselect {
	display: block;
}

multiselect>.btn-group {
	min-width: 100%;
}

multiselect .btn {
	width: 100%;
	background-color: #FFF;
}

multiselect .dropdown-menu {
	max-height: 300px;
	min-width: 200px;
	overflow-y: auto;
}

multiselect .dropdown-menu .filter>input {
	width: 99%;
}

multiselect .dropdown-menu .filter .glyphicon {
	cursor: pointer;
	pointer-events: all;
}

multiselect .dropdown-menu {
	width: 100%;
	box-sizing: border-box;
	padding: 2px;
}

multiselect>.btn-group>button {
	padding-right: 20px;
}

multiselect>.btn-group>button>.caret {
	border-left: 4px solid transparent;
	border-right: 4px solid transparent;
	border-top: 4px solid black;
	right: 5px;
	top: 45%;
	position: absolute;
}

multiselect .dropdown-menu>li>a {
	padding: 3px 10px;
	cursor: pointer;
}

multiselect .dropdown-menu>li>a i {
	margin-right: 4px;
}

.asterisc {
	display: block;
	color: red;
	margin: -19px -9px;
}

</style>

<!-- AngularJS style sheet end-->



</head>

<body class="" ng-controller="MinMaxCtrl">

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
				<li>Action Point Tracker</li>
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

		<!-- MAIN CONTENT -->
		<div id="content">
			<!-- widget grid -->
			<section id="widget-grid" class="">

				<c:if test="${not empty message}">
					<div class="alert alert-danger fade in">
						<button class="close" data-dismiss="alert">×</button>
						<i class="fa-fw fa fa-times"></i> <strong>Error!</strong>
						${message }
					</div>
				</c:if>
				<br>
				<div align="left">
					<button type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal"
						ng-click="addFunction()">
						Compose <span &nbsp; class="fa fa-plus-circle"></span>
					</button>
				</div>
				<br>

				<div class="row">

					<!-- NEW WIDGET START -->
					<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-10"
							data-widget-editbutton="false">
							<header>
								<span class="widget-icon"> <i class="fa fa-table"></i>
								</span>
								<h2>Sent List</h2>
							</header>
							<!-- widget div-->
							<div>
								<!-- widget content -->
								<div class="widget-body no-padding">
									<table id="datatable_tabletools"
										class="table table-striped table-bordered table-hover"
										width="100%">
										<thead>
											<tr>
												<th style="width: 10px">Sl.No</th>

												<th>To :</th>
												<th>Subject</th>
												<th>Start Date</th>
												<th>End Date</th>
												<th>Priority</th>
												<th>Status</th>
												<th>Remarks</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="list in aptList">
												<td style="text-align: center;">{{$index+1}}</td>
												<td>{{list.resourceByAssignedTo}}</td>
												<td>{{list.subject}}</td>
												<td>{{list.startDate}}</td>
												<td>{{list.endDate}}</td>
												<td>{{list.priority}}</td>
												<td>{{list.status}}</td>
												<td><a href="#" data-toggle="modal"
													data-target="#myModalRemark"
													ng-click="showForRemarks(list.aptId)">Remarks <i
														class="fa fa-bell" aria-hidden="true"></i></a></td>
												<td><a href="#" ng-click="show(list.aptId)"
													id="{{$index}}" data-toggle="modal" data-target="#myModal"><span
														class="glyphicon glyphicon-edit"></span></a> &nbsp; &nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<%-- &nbsp;&nbsp;<a href="<c:url value="/login/welcome"/>" class="btn btn-default">Cancel</a> <a class="btn btn-primary"
										href="${pageContext.request.contextPath}/user/create">Create</a><br> <br> --%>
							</div>
							<!-- end widget content -->
						</div>
						<!-- end widget div -->
						<!-- end widget -->
					</article>
					<!-- WIDGET END -->

				</div>

				<!-- end row -->

				<!-- end row -->

			</section>
			<!-- end widget grid -->

		</div>
		<!-- END MAIN CONTENT -->

	</div>
	<!-- END MAIN PANEL -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Action Point</h4>
				</div>
				<div class="modal-body">
					<div class="main-content">
						<form:form commandName="composeDescription" method="POST"
							name="theForm">
							<div class="form-group row">
								<div class="col-lg-6">
									<label><span class="asterisc">*</span>To : </label> <select required="required"
										ng-model="formModel.resourceByAssignedToId"
										class="form-control">
										<option value="" disabled selected hidden>---Select---</option>
										<option ng-repeat="row in toResource"
											ng-selected="formModel.resourceByAssignedToId == row.resourceId"
											value="{{row.resourceId}}">{{row.firstName}}
											{{row.lastName}}</option>
									</select>
								</div>
								<div class="col-lg-6">
									<label>Cc : </label>
									<multiselect class='input-xlarge multiselect'
										ng-model='formModel.stackHolders' header='---Select--'
										options='row.resourceId as row.firstName for row in ccResource'
										multiple='true' enable-filter='true'
										filter-placeholder='Search...'></multiselect>
								</div>
							</div>

							<div class="form-group">
								<label><span class="asterisc">*</span>Subject : </label> <input
									type="text" placeholder="Enter Subject"
									ng-model="formModel.subject" class="form-control"
									required="required">
							</div>

							<div class="form-group">
								<label>Description : </label>
								<form:textarea class="form-control" rows="10"
									ng-model="angularDescription" path="description"></form:textarea>
							</div>

							<div class="form-group row">
								<div class="col-lg-4">
									<label>Proposed Start Date</label> <input type="text"
										class="form-control" id="startDate"
										placeholder="Select Start Date" ng-model="formModel.startDate" />
								</div>
								<div class="col-lg-4">
									<label>End Date</label> <input type="text" class="form-control"
										id="endDate" ng-model="formModel.endDate"
										placeholder="Select End Date" />
								</div>
								<div class="col-lg-4">
									<label>Priority</label> <select id="priority"
										ng-model="formModel.priority" class="form-control">
										<option value="" disabled selected hidden>---Select---</option>
										<option value="High">High</option>
										<option value="Medium">Medium</option>
										<option value="Low">Low</option>
									</select>
								</div>
							</div>

							<br>
							<div class="modal-footer">
								<div class="form-group">
									<div align="center">
										<button class="btn btn-primary btn-lg" type="submit"
											ng-click="addTask()" ng-disabled="theForm.$invalid">Submit</button>
										<button type="button" class="btn btn-default btn-lg"
											data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Remarks Modal -->
	<div class="modal fade" id="myModalRemark" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Remarks</h4>
				</div>
				<div class="modal-body">
					<div class="main-content">
						<table class="table">
							<thead>
								<tr>
									<th><a href="#"
										ng-click="orderByField='createdDate'; popUpSort = !popUpSort">Date<span
											ng-show="orderByField == 'createdDate'"><span
												ng-show="!popUpSort"> ^</span><span ng-show="popUpSort">
													v</span></span>
									</a></th>
									<th><a href="#"
										ng-click="orderByField='resource'; popUpSort = !popUpSort">
											Name<span ng-show="orderByField == 'resource'"><span
												ng-show="!popUpSort"> ^</span><span ng-show="popUpSort">
													v</span></span>
									</a></th>
									<th><a href="#"
										ng-click="orderByField='remarks'; popUpSort = !popUpSort">
											Remark<span ng-show="orderByField == 'remarks'"><span
												ng-show="!popUpSort"> ^</span><span ng-show="popUpSort">
													v</span></span>
									</a></th>
								</tr>
							</thead>
							<tbody
								ng-repeat="remark in remarkslist | orderBy:orderByField:popUpSort">
								<tr>
									<td>{{remark.createdDate}}</td>
									<td>{{remark.resource}}</td>
									<td>{{remark.remarks}}</td>
								<tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="model-footer">
					<form:form commandName="composeRemarks" method="POST" name="theRemarks">
						<div class="form-group row" style="padding-left: 20%">
							<div class="col-lg-8">
								<label><span class="asterisc">*</span>Remarks : </label>
								<form:textarea rows="3" ng-model="angularRemarks" path="remarks"
									class="form-control" ng-disabled="false" required="required"></form:textarea>
								<form:input type="number" id="aptIdForRemarks"
									ng-model="aptIdForRemarks" path="actionPointTracker"
									class="form-control" ng-disabled="false"></form:input>
							</div>
							<div class="col-lg-2">
								<br> <br>
								<button class="btn btn-primary" type="submit" ng-disabled="theRemarks.$invalid">Submit</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			$("#multipleSelectExample").select2();
		});
		$('#aptIdForRemarks').hide();

		var myapp = angular.module('acptApp', [ 'long2know', 'ui.bootstrap' ]);

		myapp
				.controller(
						'MinMaxCtrl',
						function($scope, $uibModal, $http) {

							$scope.formModel = {};
							$scope.onSubmit = function(valid) {
								if (valid) {
									console.log("hey ");
									
								} else {
									console.log("Invalid");
								}
							};
							$scope.showForRemarks = function(aptId) {
								$scope.angularRemarks = "";
								$scope.aptIdForRemarks = aptId;
								$http.post(
										'${pageContext.request.contextPath}/getAptRemarksList/'
												+ aptId).then(
										function(response) {
											$scope.remarkslist = response.data;
										});
							};
							$http
									.get(
											'${pageContext.request.contextPath}/getToResource')
									.then(function(response) {
										$scope.toResource = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/getCcResource')
									.then(function(response) {
										$scope.ccResource = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/getAPTList')
									.then(function(response) {
										$scope.aptList = response.data;
									});

							$scope.flag = 1;
							$scope.show = function(aptId) {
								$scope.flag = 2;
								$scope.formModel.aptId = aptId;
								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/apt/getById/'
														+ aptId)
										.then(
												function(response) {
													$scope.getById = response.data;
													$scope.formModel.resourceByAssignedToId = $scope.getById.resourceByAssignedToId;
													$scope.formModel.subject = $scope.getById.subject;
													$scope.angularDescription = $scope.getById.description;
													$('#startDate')
															.val(
																	$scope.getById.startDate);
													$('#endDate')
															.val(
																	$scope.getById.endDate);
													$scope.formModel.priority = $scope.getById.priority;
													document
															.getElementById("priority").value = $scope.getById.priority;
													$scope.formModel.stackHolders = $scope.getById.stackHolders;
												});
							};
							$scope.addTask = function() {
								$scope.formModel.startDate = $('#startDate')
										.val();
								$scope.formModel.endDate = $('#endDate').val();
								$scope.aptjson = JSON
										.stringify($scope.formModel);
								if ($scope.flag == 2) {
									$http.put(
											'${pageContext.request.contextPath}'
													+ '/apt/edit/'
													+ $scope.aptjson).then(
											function(data) {
												console.log(data);
											});
								} else {
									$http.post(
											'${pageContext.request.contextPath}'
													+ '/apt/insert/'
													+ $scope.aptjson).then(
											function(data) {
												console.log(data);
											});

								}
								$http
										.get(
												'${pageContext.request.contextPath}/getAPTList')
										.then(function(response) {
											$scope.aptList = response.data;
										});
							};
							$scope.addFunction = function() {
								$scope.formModel = {};
								$scope.angularDescription = '';
								$scope.flag = 1;
							};
							$scope.Check = function(x) {
								var reg = /^[^`~!@#$%\^&*()_+={}|[\]\\:';"<>?,./]*$/;

								if (!x.match(reg)) {
									$scope.formModel.client_name = x.substring(
											0, x.length - 1);
									$scope.test = true;

								} else {
									$scope.test = false;

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




	<%-- 
<!-- PAGE RELATED PLUGIN(S) -->
<script
	src="${pageContext.request.contextPath}/resources/js/plugin/datatables/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugin/datatables/dataTables.colVis.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

 --%>
	<script type="text/javascript">
		// DO NOT REMOVE : GLOBAL FUNCTIONS!

		$(document)
				.ready(
						function() {

							pageSetUp();

							$('#startDate')
									.datepicker(
											{
												dateFormat : 'dd-mm-yy',
												prevText : '<i class="fa fa-chevron-left"></i>',
												nextText : '<i class="fa fa-chevron-right"></i>',
												onSelect : function(
														selectedDate) {
													selectedDate = $(
															'#startDate')
															.datepicker(
																	'getDate');
													selectedDate
															.setDate(selectedDate
																	.getDate());
													$('#endDate').datepicker(
															'option',
															'minDate',
															selectedDate);
												}
											});

							$('#endDate')
									.datepicker(
											{
												dateFormat : 'dd-mm-yy',
												prevText : '<i class="fa fa-chevron-left"></i>',
												nextText : '<i class="fa fa-chevron-right"></i>',
												onSelect : function(
														selectedDate) {
													selectedDate = $('#endDate')
															.datepicker(
																	'getDate');
													selectedDate
															.setDate(selectedDate
																	.getDate());
													$('#startDate').datepicker(
															'option',
															'maxDate',
															selectedDate);
												}
											});

							/* // DOM Position key index //
							
							l - Length changing (dropdown)
							f - Filtering input (search)
							t - The Table! (datatable)
							i - Information (records)
							p - Pagination (paging)
							r - pRocessing 
							< and > - div elements
							<"#id" and > - div with an id
							<"class" and > - div with a class
							<"#id.class" and > - div with an id and class
							
							Also see: http://legacy.datatables.net/usage/features
							 */

							/* BASIC ;*/
							var responsiveHelper_dt_basic = undefined;
							var responsiveHelper_datatable_fixed_column = undefined;
							var responsiveHelper_datatable_col_reorder = undefined;
							var responsiveHelper_datatable_tabletools = undefined;

							var breakpointDefinition = {
								tablet : 1024,
								phone : 480
							};

							/* TABLETOOLS */
							$('#datatable_tabletools')
									.dataTable(
											{
												// Tabletools options: 
												//   https://datatables.net/extensions/tabletools/button_options <'col-sm-4 col-xs-4 hidden-xs'T>
												"sDom" : "<'dt-toolbar'<'col-xs-6 col-sm-3'f>r<lT>>"
														+ "t"
														+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-sm-6 col-xs-12'p>>",
												"oTableTools" : {
													"aButtons" : [
															"copy",
															"csv",
															"xls",
															{
																"sExtends" : "pdf",
																"sTitle" : "Employee Details_PDF",
																"sPdfMessage" : "Employee Details PDF Export",
																"sPdfSize" : "letter"
															},
															{
																"sExtends" : "print",
																"sMessage" : "Generated by CentillionNetworks<i>(press Esc to close)</i>"
															} ],
													"sSwfPath" : "${pageContext.request.contextPath}/resources/js/plugin/datatables/swf/copy_csv_xls_pdf.swf"
												},
												"autoWidth" : true,
												"preDrawCallback" : function() {
													// Initialize the responsive datatables helper once.
													if (!responsiveHelper_datatable_tabletools) {
														responsiveHelper_datatable_tabletools = new ResponsiveDatatablesHelper(
																$('#datatable_tabletools'),
																breakpointDefinition);
													}
												},
												"rowCallback" : function(nRow) {
													responsiveHelper_datatable_tabletools
															.createExpandIcon(nRow);
												},
												"drawCallback" : function(
														oSettings) {
													responsiveHelper_datatable_tabletools
															.respond();
												}
											});

							/* END TABLETOOLS */

						})
	</script>


</body>

</html>