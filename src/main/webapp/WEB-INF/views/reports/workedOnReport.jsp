<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<title>Project Delivery Status Report</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
	alt="ProjectMatrix" type="image/png" />

<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- angular js script -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<!-- angular js script end -->


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

#first {
	width: 30%;
	float: left;
}

#from {
	padding-left: 2%;
	width: 20%;
	float: left;
}

#buttonSearch {
	padding-top: 1%;
}

#search {
	width: 20%;
	float: left;
}
</style>

<!-- angular js style -->

<style>
/* input.ng-invalid.ng-touched, textarea.ng-invalid.ng-touched {
	border: 1px solid red;
}
 */
input[disabled="disabled"] {
	opacity: 0.4;
	cursor: not-allowed !important;
}

.content {
	margin: 0 300px;
}

.modal-dialog {
	width: 40%;
}

.modal-body {
	margin: 1% 10%;
}

.asterisc {
	display: block;
	color: red;
	margin: -19px -9px;
}

@media ( min-width : 1200px) {
	.seven-cols .col-md-1, .seven-cols .col-sm-1, .seven-cols .col-lg-1 {
		width: 20%;
		*width: 14.285714285714285714285714285714%;
	}
}
</style>

<!-- angular js style end-->



</head>

<body class="" ng-app="jobs" ng-controller="JobController">

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
				<li>Report</li>
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
						<button class="close" data-dismiss="alert">�</button>
						<i class="fa-fw fa fa-times"></i> <strong>Error!</strong>
						${message }
					</div>
				</c:if>
				<br>
				<div align="left" class="form-group row">
					<!-- <div class="col-lg-3">
						<label for="cli_pm"><span class="asterisc"
							style="color: red">*</span> Worked On </label> <select
							class="form-control" ng-model="workedOn" ng-change="manditoryWorkedOn=false" path="SubDept.subDeptId">
							<option disabled selected hidden value="">---Please
								Select---</option>
							<option value="All">All</option>
							<option value="In Training">In Training</option>
							<option value="On Bench">On Bench</option>
							<option value="Project Management">Project Management</option>
							<option value="Others">Others</option>
						</select>
					</div> -->
					<div class="col-lg-2">
						<label for="res_fb"><span class="asterisc"
							style="color: red">*</span>From Date</label> <input type="text"
							class="form-control" name="date" id="startDate"
							ng-blur="manditoryFromDate=false" />
					</div>
					<div class="col-lg-2">
						<label for="res_fb"><span class="asterisc"
							style="color: red">*</span>To Date</label> <input type="text"
							class="form-control" name="date" id="endDate"
							ng-blur="manditoryToDate=false" />
					</div>
					<div id="buttonSearch" class="col-lg-2">
						<button type="button" class="btn btn-info btn-lg" id="load"
							data-loading-text="<i class='fa fa-spinner fa-spin '></i> Loading.."
							ng-disabled="manditoryFromDate || manditoryToDate"
							ng-click="searchWithDates()">Search</button>
					</div>
				</div>
				<br>

				<div class="row">

					<!-- NEW WIDGET START -->
					<article class="col-lg-12">
						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-10"
							data-widget-editbutton="false">
							<header>
								<span class="widget-icon"> <i class="fa fa-table"></i>
								</span>
								<h2>My Task List</h2>
							</header>
							<!-- widget div-->
							<div>
								<!-- widget content -->
								<div class="widget-body no-padding">
									<div style="border: 1px solid black; overflow: auto">
										<table id="datatable_tabletools"
											class="table table-striped table-bordered table-hover"
											width="100%">
											<tr>
												<th colspan="11">
													<div id="search">
														<label for="cli_pm">Global Search</label><input
															type="text" class="form-control"
															ng-model="search.firstname" placeholder="Search...">
													</div>
												</th>
											</tr>
											<tr>
												<th width="10%"><a href="#"
													ng-click="orderByField='$index'; reverseSort = !reverseSort">
														Sl No <span ng-show="orderByField == '$index'"><span
															ng-show="!reverseSort">^</span><span
															ng-show="reverseSort">v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='resource'; reverseSort = !reverseSort">
														Employee <span ng-show="orderByField == 'resource'"><span
															ng-show="!reverseSort">^</span><span
															ng-show="reverseSort">v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='doc'; reverseSort = !reverseSort">
														Date <span ng-show="orderByField == 'doc'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='spentTime'; reverseSort = !reverseSort">
														On Jobs <span ng-show="orderByField == 'spentTime'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='inTraining'; reverseSort = !reverseSort">
														In Training <span ng-show="orderByField == 'inTraining'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='onBench'; reverseSort = !reverseSort">
														On Bench <span ng-show="orderByField == 'onBench'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='pm'; reverseSort = !reverseSort">
														Project Management<span ng-show="orderByField == 'pm'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='workedOn'; reverseSort = !reverseSort">
														Worked on Others<span ng-show="orderByField == 'workedOn'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='others'; reverseSort = !reverseSort">
														Time Spent on Others<span
														ng-show="orderByField == 'others'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>

												<th><a href="#"
													ng-click="orderByField='total'; reverseSort = !reverseSort">
														Total<span ng-show="orderByField == 'total'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='remarks'; reverseSort = !reverseSort">
														Remarks<span ng-show="orderByField == 'remarks'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>

											</tr>
											<tbody>
												<tr
													ng-repeat="job in resourceList | filter: search.firstname | orderBy:orderByField:reverseSort">
													<td style="text-align: center;">{{$index+1}}</td>
													<td>{{job.resource}}</td>
													<td>{{job.doc}}</td>
													<td><a href="#" data-toggle="modal" data-target="#myModal"
														ng-click="show(job.workBenchId)">{{job.spentTime}} </a></td>
													<td>{{job.inTraining}}</td>
													<td>{{job.onBench}}</td>
													<td>{{job.pm}}</td>
													<td>{{job.workedOn}}</td>
													<td>{{job.others}}</td>
													<td>{{job.total}}</td>
													<td>{{job.remarks}}</td>


												</tr>
												<!-- 	<tr>
														<td></td>
														<td><b>Total:</b></td>
														<td></td>
														<td><b>{{onJobTotal}}</b></td>
														<td><b>{{inTrainingTotal}}</b></td>
														<td><b>{{onBenchTotal}}</b></td>
														<td><b>{{pmTotal}}</b></td>
														<td></td>
														<td><b>{{othersTotal}}</b></td>
														<td>{{totalTotal}}</td>
														<td></td>
													</tr> -->


											</tbody>
										</table>
									</div>
									<%-- &nbsp;&nbsp;<a href="<c:url value="/login/welcome"/>" class="btn btn-default">Cancel</a> <a class="btn btn-primary"
										href="${pageContext.request.contextPath}/user/create">Create</a><br> <br> --%>
								</div>
								<!-- end widget content -->
							</div>
							<!-- end widget div -->
						</div>
						<!-- end widget -->
					</article>
					<!-- WIDGET END -->
				</div>

			</section>
			<!-- end widget grid -->

		</div>
		<!-- END MAIN CONTENT -->

	</div>
	<!-- END MAIN PANEL -->

	<!-- Trigger the modal with a button -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Jobs Information</h4>
				</div>
				<div class="modal-body">
					<div class="contianer main-content">
						<table class="table">
							<thead>
								<tr>
									<th><a href="#"
										ng-click="orderByField='job'; popUpSort = !popUpSort">
											Job ID<span ng-show="orderByField == 'job'"><span
												ng-show="!popUpSort"> ^</span><span ng-show="popUpSort">
													v</span></span>
									</a></th>
									<th><a href="#"
										ng-click="orderByField='jobStage'; popUpSort = !popUpSort">
											Job Stage<span ng-show="orderByField == 'jobStage'"><span
												ng-show="!popUpSort"> ^</span><span ng-show="popUpSort">
													v</span></span>
									</a></th>
									<th><a href="#"
										ng-click="orderByField='spentTimeOnJob'; popUpSort = !popUpSort">
											Spent Time<span ng-show="orderByField == 'spentTimeOnJob'"><span
												ng-show="!popUpSort"> ^</span><span ng-show="popUpSort">
													v</span></span>
									</a></th>
								</tr>
							</thead>
							<tbody
								ng-repeat="job in jobSpentTime | orderBy:orderByField:popUpSort">
								<tr>
									<td>{{job.job}}</td>
									<td>{{job.jobStage}}</td>
									<td>{{job.spentTimeOnJob}}</td>
								<tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		$(function() {
			$('#reciveddate1').datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		$(function() {
			$('#reciveddate2').datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		$(function() {
			$('#reciveddate3').datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		$(function() {
			$('#reciveddate4').datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
	</script>
	<!-- angular js script -->
	<script>
		var app = angular.module('jobs', []);
		app.controller('JobController', function($scope, $http) {
			$scope.manditoryWorkedOn = true;
			$scope.manditoryFromDate = true;
			$scope.manditoryToDate = true;
			$scope.orderByField = '$index';
			$scope.reverseSort = false;
			$scope.popUpSort = false;
			
			$scope.formModel = {};
			/* $http.get('${pageContext.request.contextPath}/projectList').then(
					function(response) {
						$scope.projectlist = response.data;
					});
			 */

			$scope.show = function(workbenchId) {
				$scope.jobSpentTime = {};
				$http.post(
						'${pageContext.request.contextPath}' + '/workBenchjob/'
								+ workbenchId).then(function(response) {
					$scope.jobSpentTime = response.data;
				});
			};

			$('#load').on(
					'click',
					function() {
						var $this = $(this);
						$this.button('loading');
						$scope.fromDate = $('#startDate').val();
						$scope.toDate = $('#endDate').val();
						$http
								.post(
										'${pageContext.request.contextPath}'
												+ '/getByDatesAndWorkedOn/'
												+ $scope.fromDate + '/'
												+ $scope.toDate)
								.then(function(response) {
									$scope.resourceList = response.data;

									$this.button('reset');
								});
					});

			/* start total of the vertical values in the table */
			/* 	 $scope.calSum = function() {
						for (var i = 0; i < $scope.resourceList.length; i++) {
							$scope.onJobTotal += $scope.projectDashboard[i].spentTime;
							$scope.inTrainingTotal += $scope.projectDashboard[i].noOfJobs;
							$scope.onBenchTotal += $scope.projectDashboard[i].remainingHours;
							$scope.pmTotal += $scope.projectDashboard[i].requiredMenDays;
							$scope.othersTotal += $scope.projectDashboard[i].noOfJobs;
							$scope.totalTotal += $scope.projectDashboard[i].noOfJobs;
						}
					}; */
			/* total of the vertical values in the table End */

			/* 		$scope.searchWithDates = function() {
						$scope.formModel.receivedDate = $('#reciveddate1').val();
						$scope.formModel.toDate = $('#reciveddate2').val();
						$scope.deliveryReportJson = JSON.stringify($scope.formModel);
						$http.post(
								'${pageContext.request.contextPath}'
										+ '/jobsCountByDates/'
										+ $scope.deliveryReportJson).then(
								function(response) {
									$scope.jobsList = response.data;
								});

					};
			 */
		});
	</script>

	<!-- angular js script end -->
</body>
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
<script src="${pageContext.request.contextPath}/resources/js/app.min.js"></script>




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
											onSelect : function(selectedDate) {
												selectedDate = $('#startDate')
														.datepicker('getDate');
												selectedDate
														.setDate(selectedDate
																.getDate());
												$('#endDate').datepicker(
														'option', 'minDate',
														selectedDate);
											}
										});

						$('#endDate')
								.datepicker(
										{
											dateFormat : 'dd-mm-yy',
											prevText : '<i class="fa fa-chevron-left"></i>',
											nextText : '<i class="fa fa-chevron-right"></i>',
											onSelect : function(selectedDate) {
												selectedDate = $('#endDate')
														.datepicker('getDate');
												selectedDate
														.setDate(selectedDate
																.getDate());
												$('#startDate').datepicker(
														'option', 'maxDate',
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
											"drawCallback" : function(oSettings) {
												responsiveHelper_datatable_tabletools
														.respond();
											}
										});

						/* END TABLETOOLS */

					})
</script>


</body>

</html>