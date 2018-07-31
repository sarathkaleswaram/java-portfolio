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

<title>Allocated Tasks</title>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<!-- AngularJS End  -->

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>


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
	width: 20%;
	float: left;
}

#second {
	padding-left: 2%;
	width: 30%;
	float: left;
}

#third {
	float: right;
}
</style>





<!-- AngularJS style sheet -->

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
	width: 45%;
}

.modal-body {
	margin: 1% 10%;
}
</style>
<!-- AngularJS style sheet end-->



</head>

<body class="" ng-app="emp" ng-controller="empController">
	<jsp:include page="../header.jsp"></jsp:include>
	<jsp:include page="../sideBar.jsp"></jsp:include>
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- MAIN PANEL -->
	<div id="main" role="main" ng-init="load()">

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
				<li>Allocated Tasks</li>
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
				<div class="row">
					<!-- NEW WIDGET START -->
					<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-10"
							data-widget-editbutton="false">
							<header>
								<span class="widget-icon"> <i class="fa fa-table"></i>
								</span>
								<h2>Jobs</h2>
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
												<th colspan="8"><div id="first">
														<label for="cli_pm">Select Project Name to Filter</label>
														<select ng-model="project_search" class="form-control">
															<option value="">All</option>
															<option ng-repeat="row in projectlist"
																value="{{row.projectName}}">{{row.projectName}}</option>
														</select>
													</div>
													<div id="second">
														<label for="cli_pm">Global Search</label><input
															type="text" class="form-control" ng-model="global_search"
															placeholder="Search...">
													</div>
													<div id="third">
														<label for="cli_pm">Page Size</label> <select
															ng-model="pageSize" id="pageSize" class="form-control"
															ng-init="pageSize='10'">
															<option value="10">10</option>
															<option value="20">20</option>
															<option value="50">50</option>
															<option value="100">100</option>
															<option value="500">500</option>
															<option value="1000">1000</option>
														</select>
													</div></th>
											</tr>
											<tr>
												<th><a href="#"
													ng-click="orderByField='$index'; reverseSort = !reverseSort">
														Sl No <span ng-show="orderByField == '$index'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='project'; reverseSort = !reverseSort">
														Project Name <span ng-show="orderByField == 'project'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='jobNo'; reverseSort = !reverseSort">
														Job Id <span ng-show="orderByField == 'jobNo'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='jobName'; reverseSort = !reverseSort">
														Job Name<span ng-show="orderByField == 'jobName'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='assignedDate'; reverseSort = !reverseSort">
														Assigned Date<span
														ng-show="orderByField == 'assignedDate'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='jobStage'; reverseSort = !reverseSort">
														Job Stage<span ng-show="orderByField == 'jobStage'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='jobStatus'; reverseSort = !reverseSort">
														Job Status<span ng-show="orderByField == 'jobStatus'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#">Actions</a></th>
											</tr>
											<tbody>
												<tr
													ng-repeat="list in jobAssList | filter:{'project':  project_search}: filter2 | filter: global_search | startFrom:currentPage*pageSize | limitTo:pageSize | orderBy:orderByField:reverseSort">
													<td style="text-align: center;">{{ ($index + 1) +
														(currentPage) * pageSize}}</td>
													<td>{{list.project}}</td>
													<td>{{list.jobNo}}</td>
													<td>{{list.jobName}}</td>
													<td>{{list.assignedDate}}</td>
													<td>{{list.jobStage}}</td>
													<td>{{list.jobStatus}}</td>
													<td><a ng-click="show(list.projectId,list.jobId)"
														href="" id="{{$index}}" data-toggle="modal"
														data-target="#myModal"><span
															class="glyphicon glyphicon-edit"></span></a> &nbsp; &nbsp;</td>
												</tr>
											</tbody>
										</table>
										<!-- Pagination Next Previous Buttons -->
										<div id="pageButtons" align="center">
											<button type="button" ng-disabled="currentPage == 0"
												class="btn btn-info" ng-click="currentPage=currentPage-1">Previous</button>
											&nbsp;&nbsp; <strong>{{currentPage+1}}/{{numberOfPages()}}</strong>&nbsp;&nbsp;
											<button type="button"
												ng-disabled="currentPage >= getData().length/pageSize - 1"
												class="btn btn-info" ng-click="currentPage=currentPage+1">Next</button>
										</div>
										<br>
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



				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">My Task</h4>
							</div>


							<div class="modal-body">
								<div class="main-content">
									<form ng-submit="onSubmit(theForm.$valid)" name="theForm"
										novalidate="novalidate">

										<div class="form-group row">

											<div class="col-lg-6">
												<label for="emp_name">Employee Name</label> <input
													type="text" class="form-control"
													value="${sessionScope.sessionobject.resource.firstName}"
													id="emp_name" ng-disabled="true">
											</div>
											<div class="col-lg-6">
												<label for="job_id">Job ID</label> <input type="text"
													class="form-control" ng-model="formModel.job_id"
													id="job_id" ng-disabled="true">
											</div>
										</div>

										<div class="form-group row">

											<div class="col-lg-6">
												<label for="project_manager">Project Manager</label> <input
													type="text" class="form-control"
													ng-model="formModel.project_manager" id="project_manager"
													ng-disabled="true">
											</div>
											<div class="col-lg-6">
												<label for="team_lead">Team Lead</label> <input type="text"
													class="form-control" ng-model="formModel.team_lead"
													id="team_lead" ng-disabled="true">
											</div>
										</div>
										<div class="form-group row">

											<div class="col-lg-6">
												<label for="job_assigned_date">Job Assigned Date</label> <input
													type="text" class="form-control"
													ng-model="formModel.job_assigned_date"
													id="job_assigned_date" ng-disabled="true">
											</div>
											<div class="col-lg-6">
												<label for="job_expected_delivery">Expected Delivery</label>
												<input type="text" class="form-control"
													ng-model="formModel.job_expected_delivery"
													id="job_expected_delivery" ng-disabled="true">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<label for="job_stage">Job Stage</label> <input type="text"
													class="form-control" ng-model="formModeljobs.jobStage"
													id="job_stage" ng-disabled="true">
											</div>
											<div class="col-lg-6">
												<label for="job_status">Job Status</label> <select
													name="job_status" id="job_status" class="form-control"
													ng-model="formModeljobs.jobStatus"
													ng-click="showUOMWaring(formModeljobs.jobStatus)">
													<option value="YTS" ng-show="jobStatusRest">YTS</option>
													<option value="WIP" ng-show="jobStatusWIP">WIP</option>
													<option value="Pause" ng-show="jobStatusRest">Pause</option>
													<option value="Hold" ng-show="jobStatusRest">Hold</option>
													<option value="Query" ng-show="jobStatusRest">Query</option>
													<option value="Completed" ng-show="jobStatusRest">Completed</option>
												</select>
											</div>
										</div>
										<div ng-show="uomCheck" class="alert alert-danger">
											<strong>Please Enter UOM value before Delivering the
												Job.</strong>
										</div>
										<div ng-if="flag==1">
											<div ng-repeat="uomstored in uomstoredlist track by $index">
												<div class="form-group row">
													<div class="col-lg-4">
														<label for="uom">UOM</label> <input
															value="{{uomstored.uom}}" type="text"
															class="form-control" id="uom" required="required"
															ng-disabled="true">
													</div>
													<div class="col-lg-3">
														<label for="uom_val">Quantity</label> <input type="number"
															ng-change="checkForUomValue(formModel.uom_val[$index])"
															class="form-control" ng-model="formModel.uom_val[$index]"
															id="uom_val" required="required" ng-disabled="false">
													</div>
												</div>
											</div>
										</div>
										<div ng-if="flag==2">
											<div ng-repeat="uomstored in uomByJob track by $index">
												<div class="form-group row">
													<div class="col-lg-2">
														<label for="uom">UOM</label> <input
															value="{{uomstored.uomName}}" type="text"
															class="form-control" id="uom" required="required"
															ng-disabled="true">
													</div>
													<div class="col-lg-2">
														<label for="uom">Quantity</label><input
															value="{{uomstored.value}}" type="text"
															class="form-control" id="uom" required="required"
															ng-disabled="true">
													</div>
													<div class="col-lg-3">
														<label for="uom_val">Change Quantity</label> <input
															type="number" class="form-control"
															ng-model="formModel.uom_val[$index]" id="uom_val"
															required="required" ng-disabled="false"
															ng-change="hello()">
													</div>
												</div>
											</div>
										</div>

										<!-- <div class="form-group row">
											<div class="col-lg-3">
												<label for="cli_pro_code">UOM-1</label> <input type="text"
													class="form-control" ng-model="formModel.uom1" id="uom1"
													required="required" ng-disabled="true">
											</div>
											<div class="col-lg-2">
												<label for="project_code"></label>Value <input type="text"
													class="form-control" ng-model="formModel.value1"
													id="project_code" required="required" ng-disabled="false">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-3">
												<label for="cli_pro_code">UOM-2</label> <input type="text"
													class="form-control" ng-model="formModel.uom2" id="uom2"
													required="required" ng-disabled="true">
											</div>
											<div class="col-lg-2">
												<label for="project_code"></label>Value <input type="text"
													class="form-control" ng-model="formModel.formModel.value2"
													id="project_code" required="required" ng-disabled="false">
											</div>
										</div> -->
										<div class="form-group row">
											<div class="col-lg-6">
												<label for="est_hours">Estimated Hours</label> <input
													type="text" class="form-control"
													ng-model="formModel.hoursEstimated" id="est_hours"
													ng-disabled="true">
											</div>
											<div class="col-lg-6">
												<label for="hours_spent">Hours Spent</label> <input
													type="text" class="form-control"
													ng-model="formModel.hoursSpent" id="hours_spent"
													ng-disabled="true">
											</div>
											<div class="col-lg-12">
												<br> <label for="remarks">Remarks</label>
												<textarea class="form-control"
													ng-model="formModeljobs.remarks" id="remarks"
													ng-disabled="false"></textarea>
											</div>

										</div>
										<br>
										<!-- ng-disabled="theForm.$invalid" -->
										<div align="center">
											<div class="form-group row">
												<button class="btn btn-primary btn-lg" type="submit"
													ng-disabled="uomCheck" ng-click="addTask()"
													onClick="window.location.reload()">Submit</button>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-default btn-lg"
													data-dismiss="modal">Cancel</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- end widget grid -->

		</div>
		<!-- END MAIN CONTENT -->

	</div>
	<!-- END MAIN PANEL -->

	<script>
		var app = angular.module('emp', []);
		app
				.controller(
						'empController',
						function($scope, $http, $filter) {
							/* 	$http
										.get(
												'${pageContext.request.contextPath}/getJobsByUser')
										.then(function(response) {
											$scope.jobAssList = response.data;
										}); */
							$http
									.get(
											'${pageContext.request.contextPath}/projectList')
									.then(function(response) {
										$scope.projectlist = response.data;
									});

							$scope.filter2 = function(field1, field2) {
								if (field2 === "" || field2 === null)
									return true;
								return field1 === field2;
							};

							/* Sort */

							$scope.orderByField = '$index';
							$scope.reverseSort = false;

							/* Sort End */

							/* Pagination */

							$scope.currentPage = 0;
							$scope.pageSize = 10;
							$scope.global_search = '';
							$scope.project_search = '';
							$scope.getData = function() {
								return $filter('filter')($scope.jobAssList,
										$scope.project_search);
							};
							$scope.numberOfPages = function() {
								return Math.ceil($scope.getData().length
										/ $scope.pageSize);
							};
							$scope.$watch('global_search', function(newValue,
									oldValue) {
								if (oldValue != newValue) {
									$scope.currentPage = 0;
								}
							}, true);
							$scope.$watch('project_search', function(newValue,
									oldValue) {
								if (oldValue != newValue) {
									$scope.currentPage = 0;
								}
							}, true);

							/* Pagination End */

							/* Show and hide of the Options in JobStatus Dropdown Start */

							$scope.jobStatusRest = true;
							$scope.jobStatusWIP = true;
							
							/* Show and hide of the Options in JobStatus Dropdown End */

							$scope.productionAlloJobId;
							$scope.allocatedList = [];
							/*	$scope.resourceId = $
								{
									sessionScope.sessionobject.resource.resourceId
								}
								; */

							$scope.checkForUomValue = function(uomValue) {
								if (uomValue > -1) {
									$scope.uomCheck = false;
								} else {
									$scope.uomCheck = true;
								}

							};
							$scope.load = function() {
								$http
										.get(
												'${pageContext.request.contextPath}/getJobsByUser')
										.then(function(response) {
											$scope.jobAssList = response.data;
										});
								/* $http
										.get(
												'${pageContext.request.contextPath}/resourceAllocationList')
										.then(
												function(response) {
													$scope.resourceAllocationList = response.data;
													$scope.listShow();
												}); */

							}
							/* $scope.listShow = function() {
								for (var i = 0; i < $scope.resourceAllocationList.length; i++) {
									if ($scope.resourceAllocationList[i].resourceByProductionAllocatedId == $scope.resourceId) {
										$scope.productionAlloJobId = $scope.resourceAllocationList[i].job;
										$scope.allocatedList[i] = $scope.resourceAllocationList[i].job;
									}
								}
							};
							$scope.uomId = function(uomid) {
								$scope.uomEditId = uomid;
							};
							$scope.projectId;
							$scope.jobId;
							$scope.uomEditId; */
							$scope.hoursConvert = function(hours) {
								d = Number(+hours * 60 * 60);
								var h = Math.floor(d / 3600);
								var m = Math.floor(d % 3600 / 60);
								var s = Math.floor(d % 3600 % 60);
								h = h <= 9 ? "0" + h : h;
								m = m <= 9 ? "0" + m : m;
								s = s <= 9 ? "0" + s : s;

								/* var hDisplay = h > 0 ? h
										+ (h == 1 ? " hour, " : " hours, ")
										: "";
								var mDisplay = m > 0 ? m
										+ (m == 1 ? " minute, " : " minutes, ")
										: "";
								var sDisplay = s > 0 ? s
										+ (s == 1 ? " second" : " seconds")
										: ""; */
								return h + ":" + m + ":" +s;
								/* var decimalTimeString = hours;
								var n = new Date(0, 0);
								n.setSeconds(+decimalTimeString * 60 * 60);
								alert(decimalTimeString * 60 * 60);
								return n.toTimeString().slice(0, 8); */
							};
							$scope.hello = function() {
								$scope.uomDeleteFlag = true;
							};
							$scope.hoursEstimated = function() {
								for (var i = 0; i < $scope.jobStageList.length; i++) {
									if ($scope.formModeljobs.jobStage == $scope.jobStageList[i].jobStage) {
										$scope.formModel.hoursEstimated = $scope
												.hoursConvert($scope.jobStageList[i].hoursEstimated);
										$scope.formModel.hoursSpent = $scope
												.hoursConvert($scope.jobStageList[i].hoursSpent);
										$scope.formModel.jobStageId = $scope.jobStageList[i].jobStageId;
									}
								}
							};
							$scope.uomCheck = false;
							$scope.uomDeleteFlag = false;
							$scope.flag = 1;
							$scope.showUOMWaring = function(showDiv) {
								if ($scope.formModeljobs.jobStage == "Delivery"
										&& showDiv == "Completed") {
									if ($scope.flag == 1) {
										$scope.uomCheck = true;
									} else {
										$scope.uomCheck = false;
									}
								} else {
									$scope.uomCheck = false;
								}
							};

							$scope.autoFillUomValues = function() {
								if ($scope.uomByJob == "") {
									$scope.flag = 1;
									$scope.jobUomId = 0;
								} else {
									$scope.flag = 2;
									$scope.jobUomId = $scope.uomByJob[0].jobUomId;
								}
							};
							$scope.show = function(project_id, job_id) {
								$scope.uomCheck = false;
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/jobUom/byJobId/' + job_id)
										.then(function(response) {
											$scope.uomByJob = response.data;
											$scope.autoFillUomValues();
										});

								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/getJobStageByJobId/'
														+ job_id)
										.then(
												function(response) {
													$scope.jobStageList = response.data;
													$scope.hoursEstimated();
												});

								$scope.projectId = project_id;
								$scope.jobId = job_id;
								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/projectUom/byProjectId/'
														+ project_id)
										.then(
												function(response) {
													$scope.uomstoredlist = response.data;
												});

								for (var i = 0; i < $scope.projectlist.length; i++) {
									if ($scope.projectlist[i].projectId == project_id) {
										$scope.formModel.project_manager = $scope.projectlist[i].offshorePm;
										$scope.formModel.team_lead = $scope.projectlist[i].resource;
									}
								}
								for (var i = 0; i < $scope.jobAssList.length; i++) {
									if ($scope.jobAssList[i].jobId == job_id) {
										$scope.formModel.job_id = $scope.jobAssList[i].jobNo;
										$scope.formModel.job_assigned_date = $scope.jobAssList[i].assignedDate;
										$scope.formModel.job_expected_delivery = $scope.jobAssList[i].expectedDelivery;
										$scope.formModeljobs.jobStage = $scope.jobAssList[i].jobStage;
										$scope.formModeljobs.remarks = $scope.jobAssList[i].remarks;
										$scope.formModeljobs.jobStatus = $scope.jobAssList[i].jobStatus;
										document.getElementById("job_status").value = $scope.jobAssList[i].jobStatus;
									}
								}
								if ($scope.formModeljobs.jobStatus == "YTS"
										|| $scope.formModeljobs.jobStatus == "Pause"
										|| $scope.formModeljobs.jobStatus == "Hold"
										|| $scope.formModeljobs.jobStatus == "Query") {
									$scope.jobStatusWIP = true;
									$scope.jobStatusRest = false;
								} else {
									$scope.jobStatusWIP = true;
									$scope.jobStatusRest = true;
								}

							};
							// 							$scope.formModel.uom_val[0] = "undefined";

							$scope.addTask = function() {
								if (document.getElementById("uom_val").value == "") {
									$scope.formModel.uom_val = null;
								} else {
									for (var i = 0; i < 10; i++) {
										if ($scope.formModel.uom_val[i] != null) {

											$scope.uomVal[i] = $scope.formModel.uom_val[i];
										}
									}
									$scope.formModeljobs.value = $scope.uomVal;
								}
								$scope.jobsjson = JSON
										.stringify($scope.formModeljobs);
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/mytask/update/'
												+ $scope.projectId + '/'
												+ $scope.jobId + '/'
												+ $scope.jobsjson + '/'
												+ $scope.formModel.jobStageId
												+ '/' + $scope.jobUomId).then(
										function(data) {
											console.log(data);
										});
							};
							$scope.formModel = {};
							$scope.formModeljobs = {};
							$scope.uomVal = [];
							$scope.onSubmit = function(valid) {
								if (valid) {
									console.log("hey ");
									console.log($scope.formModel);
								} else {
									console.log("Invalid");
								}
							};
						});
		app.filter('startFrom', function() {
			return function(input, start) {
				start = +start; //parse to int
				return input.slice(start);
			}
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






	<%-- <!-- PAGE RELATED PLUGIN(S) -->
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