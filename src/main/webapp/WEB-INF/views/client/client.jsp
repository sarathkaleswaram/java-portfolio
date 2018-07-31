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

<title>Clients</title>
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
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
 -->
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
				<li>Client</li>
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
						Add Client <span &nbsp; class="fa fa-plus-circle"></span>
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
								<h2>Client List</h2>
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

												<th>ClientName</th>
												<th>ClientVertical</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="list in result">
												<td style="text-align: center;">{{$index+1}}</td>
												<td>{{list.clientName}}</td>
												<td>{{list.clientVertical}}</td>
												<td><a
													ng-click="show($index,list.clientId,list.clientVertical)"
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
					<h4 class="modal-title">Client Information</h4>
				</div>
				<div class="modal-body">
					<div class="container main-content">
						<form ng-submit="onSubmit(theForm.$valid)" name="theForm"
							novalidate="novalidate">


							<div class="form-group">
								<label for="client_name"><span class="asterisc">*</span>Client
									Name</label> <input type="text" class="form-control"
									ng-model="formModel.client_name"
									ng-change="Check(formModel.client_name)" id="client_name"
									required="required" ng-disabled="false" style="width: 40%;">
									<p ng-show="test">The Special Character not accept.</p>
							</div>
							<div class="form-group">
								<label for="cli_pro_code"><span class="asterisc">*</span>Client
									Vertical</label> <select name="cli_vertical" id="cli_vertical"
									ng-model="formModel.client_vertical" class="form-control"
									path="ClientVertical.Clientid" style="width: 40%;"
									required="required">

									<option value="" disabled selected hidden>Select
										Client Vertical</option>

									<option ng-repeat="vert in vertical"
										ng-selected="formModel.client_vertical == vert.verticalId"
										value="{{vert.verticalId}}">{{vert.verticalName}}</option>

								</select>
							</div>
						</form>
						<div>
							<button class="btn btn-primary btn-lg" value="Submit"
								ng-disabled="theForm.$invalid" ng-click="addTask()"
								onClick="window.location.reload()">Submit</button>
							<button type="button" class="btn btn-default btn-lg"
								data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 

	<script type="text/javascript">
		var myapp = angular.module('client', []);
		myapp
				.controller(
						'MinMaxCtrl',
						function($scope, $http) {
							$scope.formModel = {};
							$scope.onSubmit = function(valid) {
								if (valid) {
									console.log("hey ");
									console.log($scope.formModel);
								} else {
									console.log("Invalid");
								}
							};
							$http
									.get(
											'${pageContext.request.contextPath}/verticalList')
									.then(function(response) {
										$scope.vertical = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/clientsList')
									.then(function(response) {
										$scope.result = response.data;
									});
						
							$scope.flag = 1;
							var clientId;
							$scope.show = function(num, cid, vert) {

								$scope.flag = 2;
								clientId = cid;
								$scope.formModel.client_name = $scope.result[num].clientName;
								for (var i = 0; i < $scope.vertical.length; i++) {
									if ($scope.vertical[i].verticalName == vert) {
										$scope.formModel.client_vertical = $scope.vertical[i].verticalId;
									}
								}
							};
							$scope.addTask = function() {
								if ($scope.flag == 2) {
									$http
											.put(
													'${pageContext.request.contextPath}'
															+ '/tasks/edit/'
															+ clientId
															+ '/'
															+ $scope.formModel.client_name
															+ '/'
															+ $scope.formModel.client_vertical)
											.then(function(data) {
												alert(data);
											});
								} else {
									$http
											.post(
													'${pageContext.request.contextPath}'
															+ '/tasks/insert/'
															+ $scope.formModel.client_name
															+ '/'
															+ $scope.formModel.client_vertical)
											.then(function(data) {
												alert(data);
											});

								}
							};
							$scope.addFunction = function() {
								$scope.formModel.client_vertical = -1;
								$scope.formModel = {};
								$scope.flag = 1;
							};
							$scope.Check = function(x) {
								var reg = /^[^`~!@#$%\^&*()_+={}|[\]\\:';"<>?,./]*$/;

								if (!x.match(reg)) {
									$scope.formModel.client_name = x
											.substring(0, x.length - 1);
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


	<!-- PAGE RELATED PLUGIN(S) -->
	<%-- 	<script
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
												dateFormat : 'dd/mm/yy',
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
												dateFormat : 'dd/mm/yy',
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