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

<title>Projects</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
	alt="ProjectMatrix" type="image/png" />

<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- AngularJS Scripts -->


<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>


 -->
<script
	src="${pageContext.request.contextPath}/resources/js/angular.min.js"></script>


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

/* table search filter css */
#first {
	width: 25%;
	float: left;
}

#second {
	padding-left: 2%;
	width: 30%;
	float: left;
}

#third {
	padding-top: 1%;
	float: right;
}

#fourth {
	width: 6%;
	float: right;
}

#pageButtons {
	padding-right: 3%;
}
</style>




<!-- AngularJS style sheet -->
<style>
/* input.ng-invalid.ng-touched, textarea.ng-invalid.ng-touched {
	border: 1px solid red;
} */
input[disabled="disabled"] {
	opacity: 0.4;
	cursor: not-allowed !important;
}

.content {
	margin: 0 300px;
}

.modal-dialog {
	width: 80%;
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
		width: 14.285714285714285714285714285714%;
		*width: 14.285714285714285714285714285714%;
	}
}
</style>


<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/bootstrap-duallistbox/bootstrap-duallistbox.css">

<!-- AngularJS style sheet end-->


</head>

<body class="" ng-app="projects" ng-controller="projectController">
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
				<li>projects</li>
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
		<!-- Widget ID (each widget will need unique ID)-->



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
						ng-click="addFunction()" id="addPro">
						Add Project <span &nbsp; class="fa fa-plus-circle"></span>
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
								<h2>Project List</h2>
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
												<th colspan="9">
													<div id="first">
														<label>Global Search</label><input type="text"
															class="form-control" ng-model="global_search"
															placeholder="Search...">
													</div>
													<div id="fourth">
														<label>Page Size</label> <select ng-model="pageSize"
															id="pageSize" class="form-control"
															ng-init="pageSize='10'">
															<option value="10">10</option>
															<option value="20">20</option>
															<option value="50">50</option>
															<option value="100">100</option>
														</select>
													</div>
												</th>
											</tr>
											<tr>
												<th><a href="#"
													ng-click="orderByField='$index'; reverseSort = !reverseSort">Sl
														No <span ng-show="orderByField == '$index'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='projectName'; reverseSort = !reverseSort">Project
														Name <span ng-show="orderByField == 'projectName'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='projectCode'; reverseSort = !reverseSort">Project
														Code <span ng-show="orderByField == 'projectCode'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='centProjectCode'; reverseSort = !reverseSort">Centillion
														Project Code <span
														ng-show="orderByField == 'centProjectCode'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='clientPm'; reverseSort = !reverseSort">Project
														Manager <span ng-show="orderByField == 'clientPm'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='resource'; reverseSort = !reverseSort">Team
														Lead<span ng-show="orderByField == 'resource'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='startDate'; reverseSort = !reverseSort">Project
														Start Date<span ng-show="orderByField == 'startDate'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#">Actions</a></th>
											</tr>
											<tbody>
												<tr
													ng-repeat="project in projectlist | filter: global_search | startFrom:currentPage*pageSize | limitTo:pageSize | orderBy:orderByField:reverseSort">
													<td style="text-align: center;">{{ ($index + 1) +
														(currentPage) * pageSize}}</td>
													<td>{{project.projectName}}</td>
													<td>{{project.projectCode}}</td>
													<td>{{project.centProjectCode}}</td>
													<td>{{project.clientPm}}</td>
													<td>{{project.resource}}</td>
													<td>{{project.startDate}}</td>
													<td style="text-align: center;"><a href="#"
														ng-click="projectEdit(project.projectId)" id="{{x.num}}"
														data-toggle="modal" data-target="#myModal"><span
															class="glyphicon glyphicon-edit "></span></a> &nbsp; &nbsp; <a
														href="#"
														ng-click="projectDelete(project.projectId,project.projectName)"><span
															ng-show="deleteShow"
															class="glyphicon glyphicon-trash "></span></a></td>
												</tr>
											</tbody>
										</table>
										<!-- Pagination Next Previous Buttons starts here -->
										<div id="pageButtons" align="center">
											<button type="button" ng-disabled="currentPage == 0"
												class="btn btn-info" ng-click="currentPage=currentPage-1">Previous</button>
											&nbsp;&nbsp; <strong>{{currentPage+1}}/{{numberOfPages()}}</strong>&nbsp;&nbsp;
											<button type="button"
												ng-disabled="currentPage >= getData().length/pageSize - 1"
												class="btn btn-info" ng-click="currentPage=currentPage+1">Next</button>
										</div>
										<!-- Pagination Next Previous Buttons ends here -->
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
				<div class="modal fade" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Project Information</h4>
							</div>
							<div class="modal-body">
								<div class="main-content">
									<form ng-submit="onSubmit(theForm.$valid)" name="theForm"
										novalidate="novalidate">
										<div class="form-group row">
											<div class="col-lg-6">
												<label><span class="asterisc">*</span>Client Name</label> <select
													id="client_name" ng-model="formModel.clientId"
													class="form-control" required="required">
													<option value="" disabled selected hidden></option>
													<option ng-repeat="client in clients"
														ng-selected="formModel.clientId == client.clientId"
														value="{{client.clientId}}">{{client.clientName}}</option>
												</select>
											</div>
											<div class="col-lg-6">
												<label>End Customer</label> <input type="text" id="lname"
													class="form-control" ng-model="formModel.endCustomer"
													ng-change="Check(formModel.endCustomer,1)">
												<p ng-show="test1">The Special Character not accept.</p>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<label>Operation Region</label> <input type="text"
													id="lname" class="form-control"
													ng-model="formModel.operationRegion"
													ng-change="Check(formModel.operationRegion,2)">
												<p ng-show="test2">The Special Character not accept.</p>
											</div>
											<div class="col-lg-6">
												<label>Work Region</label> <input type="text" id="lname"
													class="form-control" ng-model="formModel.workRegion"
													ng-change="Check(formModel.workRegion,3)">
												<p ng-show="test3">The Special Character not accept.</p>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<label>Client Project Manager</label> <input type="text"
													id="lname" class="form-control"
													ng-model="formModel.clientPm"
													ng-change="Check(formModel.clientPm,4)">
												<p ng-show="test4">The Special Character not accept.</p>
											</div>
											<div class="col-lg-6">
												<label>Project Code</label> <input type="text" id="lname"
													class="form-control" ng-model="formModel.projectCode"
													ng-change="Check(formModel.projectCode,5)">
												<p ng-show="test5">The Special Character not accept.</p>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<label><span class="asterisc">*</span>Centillion
													Project Code</label> <input type="text" id="lname"
													class="form-control" ng-model="formModel.centProjectCode"
													ng-change="Check(formModel.centProjectCode,6)"
													required="required">
												<p ng-show="test6">The Special Character not accept.</p>
											</div>
											<div class="col-lg-6">
												<label>Project Name</label> <input type="text" id="lname"
													class="form-control" ng-model="formModel.projectName"
													ng-change="Check(formModel.projectName,7)">
												<p ng-show="test7">The Special Character not accept.</p>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<label>Project Scope</label> <select id="project_scope"
													ng-model="formModel.projectScope" class="form-control">
													<option value="" disabled selected hidden></option>
													<option value="Designing">Designing</option>
													<option value="Planning">Planning</option>
													<option value="Field_Survey">Field Survey</option>
													<option value="AsBuilt">AsBuilt</option>
												</select>
											</div>
											<div class="col-lg-6">
												<label>Cost Center</label> <input type="text" id="lname"
													class="form-control" ng-model="formModel.costCenter"
													ng-change="Check(formModel.costCenter,8)">
												<p ng-show="test8">The Special Character not accept.</p>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<label>Offshore Project Manager<br></label> <select
													id="off_pm" class="form-control"
													ng-model="formModel.offshorePm">
													<option value="" disabled selected hidden></option>
													<option ng-repeat="pm in pmList"
														ng-selected="formModel.offshorePm == pm.firstName"
														value="{{pm.firstName}} {{pm.lastName}}">{{pm.firstName}}
														{{pm.lastName}}</option>
												</select>

												<p ng-show="test9">The Special Character not accept.</p>
											</div>
											<div class="col-lg-6">
												<label>Team Lead<br></label> <select id="team_lead"
													class="form-control" ng-model="formModel.tlId">
													<option value="" disabled selected hidden></option>
													<option ng-repeat="teamlead in teamLeadList"
														ng-selected="formModel.tlId == teamlead.resourceId"
														value="{{teamlead.resourceId}}">{{teamlead.firstName}}
														{{teamlead.lastName}}</option>
												</select>
											</div>
										</div>
										
										<div class="form-group row">
											<h5 align="center">Team Members</h5>
											<div class="col-lg-5">
												<input type="text" ng-model="resource.firstName"
													class="form-control" placeholder="Search"> <select
													size="7" multiple ng-model="available"
													ng-options="tm as tm.firstName + ' ' + tm.lastName for tm in resourcelist | filter:resource"
													class="form-control"
													ng-click="moveItem(available[0], resourcelist ,selectedResource, true)"></select>
											</div>

											<div class="col-lg-2" align="center">
												<br> <br>
												<button class="btn btn-default" id="moverightall"
													ng-click="moveAll(resourcelist ,selectedResource, true)">
													Add All <span class="glyphicon glyphicon-chevron-right"></span>
												</button>
												<br> <br>

												<button class="btn btn-default" id="moveleftall"
													ng-click="moveAll(selectedResource, resourcelist, false)">
													Remove All <span class="glyphicon glyphicon-chevron-left"></span>
												</button>
											</div>

											<div class="col-lg-5">
												<input type="text" ng-model="resourc.firstName"
													class="form-control" placeholder="Search"> <select
													size="7" multiple ng-model="selected"
													ng-options="tm as tm.firstName + ' ' + tm.lastName for tm in selectedResource | filter:resourc"
													class="form-control"
													ng-click="moveItem(selected[0], selectedResource, resourcelist, false )"></select>
											</div>

										</div>

										<br>
										<div class="form-group row">
											<div class="col-lg-6" ng-show="resourceHide">
												<label>Key Resource</label> <select id="key_r"
													class="form-control" ng-model="formModel.keyResource">
													<option value="" disabled selected hidden></option>
													<option ng-repeat="kr in selectedResource"
														ng-selected="formModel.keyResource == kr.resourceId"
														value="{{kr.resourceId}}">{{kr.firstName}}
														{{kr.lastName}}</option>
												</select>
											</div>
											<div ng-show="resourceShow">
												<div class="col-lg-3">
													<label>Allocated Key Resource</label> <input type="text"
														class="form-control" ng-model="key_r_name" id="allo_pro"
														ng-disabled="true">
												</div>
												<div class="col-lg-3">
													<label>Key Resource</label> <select id="key_r"
														class="form-control" ng-model="formModel.keyResource">
														<option value="" disabled selected hidden></option>
														<option ng-repeat="kr in selectedResource"
															ng-selected="formModel.keyResource == kr.resourceId"
															value="{{kr.resourceId}}">{{kr.firstName}}
															{{kr.lastName}}</option>
													</select>
												</div>
											</div>
											<div class="col-lg-3">
												<label>Project Start Date</label> <input type="text"
													class="form-control" id="startDate"
													ng-model="formModel.startDate" />
											</div>
											<div class="col-lg-3">
												<label>Project End Date</label> <input type="text"
													class="form-control" id="endDate"
													ng-model="formModel.endDate" />
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-12">
												<label>Unit of Measurement</label><br> <span
													ng-repeat="uom in uomList"> <input type="checkbox"
													id="{{uom.uomId}}" checklist-model="uomSelected"
													checklist-value="uom.uomId" /> <label for="{{uom.uomId}}">{{uom.uomName}}
												</label> &nbsp; &nbsp; &nbsp;
												</span>
											</div>
										</div>
										<div id="estimated_hours" class="form-group row">
											<!-- seven-cols -->
											<h5 align="center">Enter Estimated hours. Split by 100%
												( Count: {{ formModel.productionPercentage +
												formModel.qcPercentage + formModel.qaPercentage +
												formModel.feedbackPercentage }}%)</h5>
											<!--<div class="col-lg-3">
												 <label>Input Validation</label> <input type="number"
													class="form-control"
													ng-model="formModel.inputValidationPercentage"
													ng-change="updateTotal()" id="inputValidationPercentage">
											</div> -->
											<div class="col-lg-3">
												<label>Production</label> <input type="number"
													class="form-control"
													ng-model="formModel.productionPercentage"
													ng-change="updateTotal()" id="productionPercentage">
											</div>
											<div class="col-lg-3">
												<label>QC</label> <input type="number" class="form-control"
													ng-model="formModel.qcPercentage" ng-change="updateTotal()"
													id="qcPercentage">
											</div>
											<div class="col-lg-3">
												<label>QA</label> <input type="number" class="form-control"
													ng-model="formModel.qaPercentage" ng-change="updateTotal()"
													id="qaPercentage">
											</div>
											<!-- <div class="col-lg-1 col-md-3 col-sm-4 col-xs-6">
												<label>Delivery</label> <input type="number"
													class="form-control" ng-model="formModel.deliveryPercentage"
													ng-change="updateTotal()" id="deliveryPercentage">
											</div> -->
											<div class="col-lg-3">
												<label>Delivered</label> <input type="number"
													class="form-control"
													ng-model="formModel.feedbackPercentage"
													id="feedbackPercentage" ng-change="updateTotal()">
											</div>
											<!-- 	<div class="col-lg-1 col-md-3 col-sm-4 col-xs-6">
												<label>Redelivery</label> <input type="number"
													class="form-control"
													ng-model="formModel.redeliveryPercentage"
													ng-change="updateTotal()" id="redeliveryPercentage">
											</div> -->
										</div>
										<p>Enter 0 if no Percentage is needed.</p>
										<br>
										<div ng-show="totalTrue">
											<div class="alert alert-success">
												<strong>100% </strong> Is Satisfied
											</div>
										</div>
										<div ng-show="totalFalse">
											<div class="alert alert-danger">
												<strong>100%</strong> Is Not Satisfied
											</div>
										</div>
										<!-- 	<div class="form-group row">
											<div class="col-lg-4">
												<label>QA</label> <input type="number"
													class="form-control" ng-model="" id="qa">
											</div>
											<div class="col-lg-4">
												<label>Delivery</label> <input type="number"
													class="form-control" ng-model="" id="delivery">
											</div>
											<div class="col-lg-3">
												<label>Feed Back</label> <input type="number"
													class="form-control" ng-model="" id="feedback">
											</div>
											<div class="col-lg-4">
												<label>Redelivery</label> <input type="number"
													class="form-control" ng-model="" id="redelivery">
											</div>
										</div><br> -->
										<div class="modal-footer">
											<div align="center">
												<button class="btn btn-primary btn-lg" type="submit"
													ng-disabled="!deleteShow || theForm.$invalid"
													ng-click="addTask()" onClick="window.location.reload()">Submit</button>
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


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>



	<script
		src="${pageContext.request.contextPath}/resources/bootstrap-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>



	<script>	
	$('#addPro').hide();
	
		var app = angular.module('projects', ["checklist-model"]);
		app
				.controller(
						'projectController',
						function($scope, $http, $filter) {
							var resourceId= [];
							$scope.i = 0;
							$scope.i = resourceId.length;
							var u= 0;
							
							/* Sort */

							$scope.orderByField = '$index';
							$scope.reverseSort = false;

							/* Sort End */

							/* Pagination */

							$scope.currentPage = 0;
							$scope.pageSize = 10;
							$scope.global_search = '';
							$scope.getData = function() {
								return $filter('filter')($scope.projectlist,
										$scope.global_search);
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

							/* Pagination End */
							
							
							/*  code for hidding Add Project Button starts here */
								$scope.deleteShow = false;
							
								if (role == "Manager" || role == "Admin" || role == "Super Admin") {
									$('#addPro').show();
									$scope.deleteShow = true;
								}
							/*  code for hidding Add Project Button ends here */
								
						/* Team Members DualListBox Starts */
						$scope.moveItem = function(item, from, to, flag) {
							if (flag){
								resourceId[$scope.i] =item.resourceId;
								$scope.i++;
							} else {
								for(var j = 0 ; j<resourceId.length;j++){
									if(resourceId[j]==item.resourceId){
										resourceId.splice(j, 1);										
										$scope.i--;
									}
								}
							}
							//Here from is returned as blank and to as undefined
							var idx = from.indexOf(item);
							if (idx != -1) {
								from.splice(idx, 1);
								to.push(item);
							}
						};
						$scope.moveAll = function(from, to, flag) {
							if(flag){
								for(var i =0;i<$scope.resourcelist.length;i++){
									resourceId[i]=$scope.resourcelist[i].resourceId;
								}
							} else {
								resourceId = [];
							}
							//Here from is returned as blank and to as undefined

							angular.forEach(from, function(item) {
								to.push(item);
							});
							from.length = 0;
						};
						/* Team Members DualListBox Ends */
						
						
						/* Estimated Hours Split Count Starts */
						$scope.totalTrue = false;
						$scope.totalFalse = false;
						$scope.updateTotal = function(){
							$scope.total = ( $scope.formModel.productionPercentage + $scope.formModel.qcPercentage + $scope.formModel.qaPercentage + $scope.formModel.feedbackPercentage )||0;
							if($scope.total == 100){
								$scope.totalTrue = true;
								$scope.totalFalse = false;
							} else {
								$scope.totalTrue = false;
								$scope.totalFalse = true;
							}
						};
						/* Estimated Hours Split Count Ends */
						
						
						/* Deleting project Start */
						$scope.projectDelete = function(projectId,projectName) {
							 var r = confirm("Are you sure? \nDo you want to delete Project "+projectName+"?");
							    if (r == true) {
							    	$http
									.delete(
											'${pageContext.request.contextPath}'
													+ '/project/delete/'
													+ projectId)
									.then(
											function(response) {
												$scope.deleteAlert = response.data;
												alert($scope.deleteAlert.clientName);
										    	window.location.reload();
												console.log($scope.deleteAlert);
											});
							    } 
						};
						/* Deleting project Ends */

						$scope.formModel = {};
						$scope.resourceShow = true;
						$scope.resourceHide = true;
						$scope.selectedResource = [];
						$scope.uomSelected = [];
					    $scope.flag = 1;
						$scope.key_r;
						
							$http
									.get(
											'${pageContext.request.contextPath}/clientsList')
									.then(function(response) {
										$scope.clients = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/resourceList')
									.then(function(response) {
										$scope.resourcelist = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/projectList')
									.then(function(response) {
										$scope.projectlist = response.data;
									});
							$http
							.get(
									'${pageContext.request.contextPath}/offPMList')
							.then(function(response) {
								$scope.pmList = response.data;
						});
							$http
								.get(
										'${pageContext.request.contextPath}/teamLeadList')
								.then(function(response) {
									$scope.teamLeadList = response.data;
							});
							
							
							$http
							.get(
									'${pageContext.request.contextPath}/teamMembersList')
							.then(function(response) {
								$scope.teamMembersList = response.data;
						});
							$http
							.get(
									'${pageContext.request.contextPath}/uomList')
							.then(function(response) {
								$scope.uomList = response.data;
						});
							
							/* Submit Button Starts */
							
							$scope.addTask = function() {
								$scope.formModel.uomIdSorted = $scope.uomSelected.sort(function (a, b) {  return a - b;  });
								$scope.formModel.tmResourcesIdSorted = resourceId.sort(function (a, b) {  return a - b;  });
								$scope.formModel.startDate = $('#startDate').val();
								$scope.formModel.endDate = $('#endDate').val();
								$scope.projectJson = JSON.stringify($scope.formModel);
// 								alert($scope.projectJson);
								if($scope.flag == 2){/* 
									alert(resourceId);
									alert($scope.formModel.keyResource);
									alert($scope.formModel.uomIdSorted);
									alert($scope.formModel.projectId);  */
									$http
									.put(
											'${pageContext.request.contextPath}'
													+ '/project/edit/'
													+ $scope.projectJson).then(function(data) {
														console.log(data);
													});	
									/* $http
									.put(
											'${pageContext.request.contextPath}'
													+ '/project/edit/'
													+ $scope.selectedProjectId
													+ '/'
													+ $scope.formModel.clientId
													+ '/'
													+ $scope.formModel.endCustomer
													+ '/'
													+ $scope.formModel.operationRegion
													+ '/'
													+ $scope.formModel.workRegion
													+ '/'
													+ $scope.formModel.clientPm
													+ '/'
													+ $scope.formModel.projectCode
													+ '/'
													+ $scope.formModel.centProjectCode
													+ '/'
													+ $scope.formModel.projectName
													+ '/'
													+ $scope.formModel.projectScope
													+ '/'
													+ $scope.formModel.costCenter
													+ '/'
													+ $scope.formModel.offshorePm
													+ '/'
													+ $scope.formModel.tlId
													+ '/'
													+ $scope.formModel.tmResourcesIdSorted
													+ '/'
													+ $scope.formModel.keyResource
													+ '/'
													+ $scope.formModel.startDate
													+ '/'
													+ $scope.formModel.endDate
													+ '/'
													+ $scope.formModel.uomIdSorted
													+ '/'
													+ $scope.projectHoursjson)
									.then(function(data) {
										alert(data);
									});	 */
								} else {
									$http
									.post(
											'${pageContext.request.contextPath}'
													+ '/project/insert/'
													+ $scope.projectJson).then(function(data) {
														console.log(data);
													});	
									/* $http
									.post(
											'${pageContext.request.contextPath}'
													+ '/project/insert/'
													+ $scope.formModel.clientId
													+ '/'
													+ $scope.formModel.endCustomer
													+ '/'
													+ $scope.formModel.operationRegion
													+ '/'
													+ $scope.formModel.workRegion
													+ '/'
													+ $scope.formModel.clientPm
													+ '/'
													+ $scope.formModel.projectCode
													+ '/'
													+ $scope.formModel.centProjectCode
													+ '/'
													+ $scope.formModel.projectName
													+ '/'
													+ $scope.formModel.projectScope
													+ '/'
													+ $scope.formModel.costCenter
													+ '/'
													+ $scope.formModel.offshorePm
													+ '/'
													+ $scope.formModel.tlId
													+ '/'
													+ $scope.formModel.tmResourcesIdSorted
													+ '/'
													+ $scope.formModel.keyResource
													+ '/'
													+ $scope.formModel.startDate
													+ '/'
													+ $scope.formModel.endDate
													+ '/'
													+ $scope.formModel.uomIdSorted
													+ '/'
													+ $scope.projectHoursjson)
									.then(function(data) {
										alert(data);
									});	 */
								}							
							};
							/* Submit Button Ends */
							
							$scope.totalAutoFill = function(){
								$scope.formModel.clientId =  $scope.projectbyId.clientId;
								$scope.formModel.endCustomer = $scope.projectbyId.endCustomer;
								$scope.formModel.operationRegion = $scope.projectbyId.operationRegion;
								$scope.formModel.workRegion = $scope.projectbyId.workRegion;
								$scope.formModel.clientPm = $scope.projectbyId.clientPm;
								$scope.formModel.projectCode = $scope.projectbyId.projectCode;
								$scope.formModel.centProjectCode = $scope.projectbyId.centProjectCode;
								$scope.formModel.projectName = $scope.projectbyId.projectName;
								$scope.formModel.projectScope = $scope.projectbyId.projectScope;
								document.getElementById("project_scope").value = $scope.projectbyId.projectScope;
								$scope.formModel.costCenter = $scope.projectbyId.costCenter;
								$scope.formModel.offshorePm = $scope.projectbyId.offshorePm;
								$('#startDate').val($scope.projectbyId.startDate);
								$('#endDate').val($scope.projectbyId.endDate);
								$scope.formModel.tlId= $scope.projectbyId.tlId;
//									$scope.formModel.inputValidationPercentage = $scope.projectbyId.inputValidationPercentage;
								$scope.formModel.productionPercentage = $scope.projectbyId.productionPercentage;
								$scope.formModel.qcPercentage = $scope.projectbyId.qcPercentage;
								$scope.formModel.qaPercentage =$scope.projectbyId.qaPercentage;
//									$scope.formModel.deliveryPercentage =$scope.projectbyId.deliveryPercentage;
								$scope.formModel.feedbackPercentage=$scope.projectbyId.feedbackPercentage;
//									$scope.formModel.redeliveryPercentage=$scope.projectbyId.redeliveryPercentage;
								$scope.updateTotal();
							};
							var r = 0;
							$scope.tmAllocatedAutoFill=function(){
								$scope.selectedResource = [];
								$scope.key_r_name = "";
								r=0;
								for(var i=0;i<$scope.tmAllocated.length;i++){
									$scope.selectedResource.push($scope.tmAllocated[i]);
									resourceId[r]=$scope.tmAllocated[i].resourceId;r++;								
									if($scope.tmAllocated[i].keyResourceIndication=="Y"){	
										$scope.formModel.keyResource = $scope.tmAllocated[i].resourceId;
										$scope.key_r_name = $scope.tmAllocated[i].firstName;
									}
								}
								$scope.i = resourceId.length;
							
							};
							
		/* 				Auto Fill Script */
							$scope.projectEdit = function(id) {
								$scope.resourceShow = true;
								$scope.resourceHide = false;
								$scope.formModel.projectId = id;
								$scope.flag = 2;
								$scope.uomSelected.splice(0, $scope.uomSelected.length);
// 								$scope.getResourceListFunc();
								$http
								.post(
										'${pageContext.request.contextPath}'
												+ '/projectUom/byProjectId/'
												+ id)
								.then(
										function(response) {
											$scope.uomstoredlist = response.data;
											$scope.checkboxautoFill();
										});
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/projectById/' + id)
										.then(function(response) {
											$scope.projectbyId = response.data;
											$scope.totalAutoFill();
										});
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/teamMembersAllocatedByProjectId/' + id)
										.then(function(response) {
											$scope.tmAllocated = response.data;
											$scope.tmAllocatedAutoFill();
										});
															
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/getNonTeamMemberByProject/' + id)
										.then(function(response) {
											$scope.resourcelist = response.data;
										});
								
							/* 	for (var i = 0; i < 2; i++) {
									if ($scope.projectlist[i].projectId == id) {										
										for (var j = 0; j < $scope.clients.length; j++) {
											if ($scope.clients[j].clientName == $scope.projectlist[i].client) {	
												$scope.formModel.clientId=$scope.clients[j].clientId;
											}
										} 
										 $scope.formModel.endCustomer = $scope.projectlist[i].endCustomer;
										$scope.formModel.operationRegion = $scope.projectlist[i].operationRegion;
										$scope.formModel.workRegion = $scope.projectlist[i].workRegion;
										$scope.formModel.clientPm = $scope.projectlist[i].clientPm;
										$scope.formModel.projectCode = $scope.projectlist[i].projectCode;
										$scope.formModel.centProjectCode = $scope.projectlist[i].centProjectCode;
										$scope.formModel.projectName = $scope.projectlist[i].projectName;
										$scope.formModel.projectScope = $scope.projectlist[i].projectScope;
										document.getElementById("project_scope").value = $scope.projectlist[i].projectScope;
										$scope.formModel.costCenter = $scope.projectlist[i].costCenter;
										$scope.formModel.offshorePm = $scope.projectlist[i].offshorePm;
										$('#startDate').val($scope.projectlist[i].startDate);
 										$('#endDate').val($scope.projectlist[i].endDate);	 
										for (var j = 0; j < $scope.teamLeadList.length; j++) {
											if ($scope.teamLeadList[j].firstName == $scope.projectlist[i].resource) {
												 $scope.formModel.tlId= $scope.teamLeadList[j].resourceId;
											}
										} 
										var r = 0;
										for(var j = 0; j<$scope.teamMembersList.length;j++){
											if($scope.teamMembersList[j].project==id){
												 $scope.selectedResource.push($scope.teamMembersList[j]);
												resourceId[r]=$scope.teamMembersList[j].resourceId;r++; 
												for(var k = 0;k<$scope.resourcelist.length;k++){
													if($scope.resourcelist[k].resourceId==$scope.teamMembersList[j].resourceId){
														var idx1 = $scope.resourcelist.indexOf($scope.resourcelist[k]);
														$scope.resourcelist.splice(idx1,1);														
													}
												}
											}
										} 
										
									
										$scope.i = resourceId.length;
										  for(var j = 0; j<$scope.teamMembersList.length;j++){
											if($scope.teamMembersList[j].project==id){											
												if($scope.teamMembersList[j].keyResourceIndication=="Y"){
  													$scope.formModel.keyResource = $scope.teamMembersList[j].resourceId;
  													$scope.key_r_name = $scope.teamMembersList[j].firstName;
												}												
											}
										} 
  										$scope.project.inputValidationPercentage = $scope.projectlist[i].inputValidationPercentage;
										$scope.project.productionPercentage = $scope.projectlist[i].productionPercentage;
										$scope.project.qcPercentage = $scope.projectlist[i].qcPercentage;
										$scope.project.qaPercentage =$scope.projectlist[i].qaPercentage;
 										$scope.project.deliveryPercentage =$scope.projectlist[i].deliveryPercentage;
										$scope.project.feedbackPercentage=$scope.projectlist[i].feedbackPercentage;
 										$scope.project.redeliveryPercentage=$scope.projectlist[i].redeliveryPercentage;
										$scope.updateTotal(); 
									}
								} */
							};
							$scope.checkboxautoFill = function(){
								for(var j=0;j<$scope.uomstoredlist.length;j++){
									$scope.uomSelected[j]=$scope.uomstoredlist[j].uomId;
								}
								/*for(var j = 0 ;j<$scope.uomList.length;j++){
									for(var k = 0;k<$scope.uomstoredlist.length;k++){	
										if($scope.uomstoredlist[k].uomId==$scope.uomList[j].uomId){
										 	$scope.uomSelected[k]=$scope.uomList[j].uomId;
										}
									}
								} */
							};
							$scope.getResourceListFunc = function(){
								$http
								.get(
										'${pageContext.request.contextPath}/resourceList')
								.then(function(response) {
									$scope.resourcelist = response.data;
								});
							};
							$scope.addFunction = function() {
								$scope.resourceShow = false;
								$scope.resourceHide = true;
								$scope.totalTrue = false;
								$scope.totalFalse = false;
							    $scope.flag = 1;
								$scope.formModel={};
								$scope.selectedResource = [];
								resourceId = [];
								$scope.uomSelected.splice(0, $scope.uomSelected.length);
								$scope.getResourceListFunc();
								$('#startDate').val("");
								$('#endDate').val("");
								document.getElementById("project_scope").value = -1;
								document.getElementById("key_r").value = -1;
								document.getElementById("client_name").value = -1;
								document.getElementById("team_lead").value = -1;
							}
							$scope.onSubmit = function(valid) {
								if (valid) {
									console.log("hey ");
									console.log($scope.formModel);
								} else {
									console.log("Invalid");
								}
							};
							$scope.Check= function(x,num) {
					              var reg = /^[^`~!@#$%\^&*()_+={}|[\]\\:';"<>?,./]*$/;

					                    if (!x.match(reg)) {
					                     if(num==1){
					                      $scope.formModel.endCustomer = x.substring(0, x.length-1);
					                      $scope.test1=true;
					                     }
					                     if(num==2){
					                      $scope.formModel.operationRegion = x.substring(0, x.length-1);
					                      $scope.test2=true;
					                     }
					                     if(num==3){
					                      $scope.formModel.workRegion = x.substring(0, x.length-1);
					                      $scope.test3=true;
					                     }
					                     if(num==4){
					                      $scope.formModel.clientPm = x.substring(0, x.length-1);
					                      $scope.test4=true;
					                     }
					                     
					                     if(num==5){
					                      $scope.formModel.projectCode = x.substring(0, x.length-1);
					                      $scope.test5=true;
					                     }
					                     if(num==6){
						                      $scope.formModel.centProjectCode = x.substring(0, x.length-1);
						                      $scope.test6=true;
						                 }
						                 if(num==7){
						                      $scope.formModel.projectName = x.substring(0, x.length-1);
						                      $scope.test7=true;
						                  }
						                  if(num==8){
						                      $scope.formModel.costCenter = x.substring(0, x.length-1);
						                      $scope.test8=true;
						                  }
						                  if(num==9){
							                      $scope.formModel.offshorePm = x.substring(0, x.length-1);
							                      $scope.test9=true;
							               }

					                    }
					                    else
					                    {
					                     $scope.test1=false;
					                     $scope.test2=false;
					                     $scope.test3=false;
					                     $scope.test4=false;
					                     $scope.test5=false;
					                     $scope.test6=false;
					                     $scope.test7=false;
					                     $scope.test8=false;
					                     $scope.test9=false;					                     
					                    }
					            };
						});
		
		
		
		
		
		
		/**
		 * Checklist-model
		 * AngularJS directive for list of checkboxes
		 * https://github.com/vitalets/checklist-model
		 * License: MIT http://opensource.org/licenses/MIT
		 */

		angular.module('checklist-model', [])
		.directive('checklistModel', ['$parse', '$compile', function($parse, $compile) {
		  // contains
		  function contains(arr, item, comparator) {
		    if (angular.isArray(arr)) {
		      for (var i = arr.length; i--;) {
		        if (comparator(arr[i], item)) {
		          return true;
		        }
		      }
		    }
		    return false;
		  }

		  // add
		  function add(arr, item, comparator) {
		    arr = angular.isArray(arr) ? arr : [];
		      if(!contains(arr, item, comparator)) {
		          arr.push(item);
		      }
		    return arr;
		  }  

		  // remove
		  function remove(arr, item, comparator) {
		    if (angular.isArray(arr)) {
		      for (var i = arr.length; i--;) {
		        if (comparator(arr[i], item)) {
		          arr.splice(i, 1);
		          break;
		        }
		      }
		    }
		    return arr;
		  }

		  // http://stackoverflow.com/a/19228302/1458162
		  function postLinkFn(scope, elem, attrs) {
		     // exclude recursion, but still keep the model
		    var checklistModel = attrs.checklistModel;
		    attrs.$set("checklistModel", null);
		    // compile with `ng-model` pointing to `checked`
		    $compile(elem)(scope);
		    attrs.$set("checklistModel", checklistModel);

		    // getter / setter for original model
		    var getter = $parse(checklistModel);
		    var setter = getter.assign;
		    var checklistChange = $parse(attrs.checklistChange);
		    var checklistBeforeChange = $parse(attrs.checklistBeforeChange);

		    // value added to list
		    var value = attrs.checklistValue ? $parse(attrs.checklistValue)(scope.$parent) : attrs.value;


		    var comparator = angular.equals;

		    if (attrs.hasOwnProperty('checklistComparator')){
		      if (attrs.checklistComparator[0] == '.') {
		        var comparatorExpression = attrs.checklistComparator.substring(1);
		        comparator = function (a, b) {
		          return a[comparatorExpression] === b[comparatorExpression];
		        };
		        
		      } else {
		        comparator = $parse(attrs.checklistComparator)(scope.$parent);
		      }
		    }

		    // watch UI checked change
		    scope.$watch(attrs.ngModel, function(newValue, oldValue) {
		      if (newValue === oldValue) { 
		        return;
		      } 

		      if (checklistBeforeChange && (checklistBeforeChange(scope) === false)) {
		        scope[attrs.ngModel] = contains(getter(scope.$parent), value, comparator);
		        return;
		      }

		      setValueInChecklistModel(value, newValue);

		      if (checklistChange) {
		        checklistChange(scope);
		      }
		    });

		    function setValueInChecklistModel(value, checked) {
		      var current = getter(scope.$parent);
		      if (angular.isFunction(setter)) {
		        if (checked === true) {
		          setter(scope.$parent, add(current, value, comparator));
		        } else {
		          setter(scope.$parent, remove(current, value, comparator));
		        }
		      }
		      
		    }

		    // declare one function to be used for both $watch functions
		    function setChecked(newArr, oldArr) {
		      if (checklistBeforeChange && (checklistBeforeChange(scope) === false)) {
		        setValueInChecklistModel(value, scope[attrs.ngModel]);
		        return;
		      }
		      scope[attrs.ngModel] = contains(newArr, value, comparator);
		    }

		    // watch original model change
		    // use the faster $watchCollection method if it's available
		    if (angular.isFunction(scope.$parent.$watchCollection)) {
		        scope.$parent.$watchCollection(checklistModel, setChecked);
		    } else {
		        scope.$parent.$watch(checklistModel, setChecked, true);
		    }
		  }

		  return {
		    restrict: 'A',
		    priority: 1000,
		    terminal: true,
		    scope: true,
		    compile: function(tElement, tAttrs) {
		      if ((tElement[0].tagName !== 'INPUT' || tAttrs.type !== 'checkbox') && (tElement[0].tagName !== 'MD-CHECKBOX') && (!tAttrs.btnCheckbox)) {
		        throw 'checklist-model should be applied to `input[type="checkbox"]` or `md-checkbox`.';
		      }

		      if (!tAttrs.checklistValue && !tAttrs.value) {
		        throw 'You should provide `value` or `checklist-value`.';
		      }

		      // by default ngModel is 'checked', so we set it if not specified
		      if (!tAttrs.ngModel) {
		        // local scope var storing individual checkbox model
		        tAttrs.$set("ngModel", "checked");
		      }

		      return postLinkFn;
		    }
		  };
		}]);

		
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

	<!-- PAGE RELATED PLUGIN(S) -->
	<%-- <script
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


	<script type="text/javascript">

/*! SmartAdmin - v1.5 - 2014-09-27 */!function(a,b,c,d){function e(b,c){this.element=a(b),this.settings=a.extend({},v,c),this._defaults=v,this._name=u,this.init()}function f(a){a.element.trigger("change")}function g(b){b.element.find("option").each(function(c,d){var e=a(d);"undefined"==typeof e.data("original-index")&&e.data("original-index",b.elementCount++),"undefined"==typeof e.data("_selected")&&e.data("_selected",!1)})}function h(b,c,d){b.element.find("option").each(function(b,e){var f=a(e);f.data("original-index")===c&&f.prop("selected",d)})}function i(a,b){return a.replace(/\{(\d+)\}/g,function(a,c){return"undefined"!=typeof b[c]?b[c]:a})}function j(a){if(a.settings.infoText){var b=a.elements.select1.find("option").length,c=a.elements.select2.find("option").length,d=a.element.find("option").length-a.selectedElements,e=a.selectedElements,f="";f=0===d?a.settings.infoTextEmpty:b===d?i(a.settings.infoText,[b,d]):i(a.settings.infoTextFiltered,[b,d]),a.elements.info1.html(f),a.elements.box1.toggleClass("filtered",!(b===d||0===d)),f=0===e?a.settings.infoTextEmpty:c===e?i(a.settings.infoText,[c,e]):i(a.settings.infoTextFiltered,[c,e]),a.elements.info2.html(f),a.elements.box2.toggleClass("filtered",!(c===e||0===e))}}function k(b){b.selectedElements=0,b.elements.select1.empty(),b.elements.select2.empty(),b.element.find("option").each(function(c,d){var e=a(d);e.prop("selected")?(b.selectedElements++,b.elements.select2.append(e.clone(!0).prop("selected",e.data("_selected")))):b.elements.select1.append(e.clone(!0).prop("selected",e.data("_selected")))}),b.settings.showFilterInputs&&(l(b,1),l(b,2)),j(b)}function l(b,c){if(b.settings.showFilterInputs){m(b,c),b.elements["select"+c].empty().scrollTop(0);var d=new RegExp(a.trim(b.elements["filterInput"+c].val()),"gi"),e=b.element;e=1===c?e.find("option").not(":selected"):e.find("option:selected"),e.each(function(e,f){var g=a(f),h=!0;(f.text.match(d)||b.settings.filterOnValues&&g.attr("value").match(d))&&(h=!1,b.elements["select"+c].append(g.clone(!0).prop("selected",g.data("_selected")))),b.element.find("option").eq(g.data("original-index")).data("filtered"+c,h)}),j(b)}}function m(b,c){b.elements["select"+c].find("option").each(function(c,d){var e=a(d);b.element.find("option").eq(e.data("original-index")).data("_selected",e.prop("selected"))})}function n(b){b.find("option").sort(function(b,c){return a(b).data("original-index")>a(c).data("original-index")?1:-1}).appendTo(b)}function o(a){a.elements.select1.find("option").each(function(){a.element.find("option").data("_selected",!1)})}function p(b){"all"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect?"moved"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect||m(b,1):(m(b,1),m(b,2)),b.elements.select1.find("option:selected").each(function(c,d){var e=a(d);e.data("filtered1")||h(b,e.data("original-index"),!0)}),k(b),f(b),n(b.elements.select2)}function q(b){"all"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect?"moved"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect||m(b,2):(m(b,1),m(b,2)),b.elements.select2.find("option:selected").each(function(c,d){var e=a(d);e.data("filtered2")||h(b,e.data("original-index"),!1)}),k(b),f(b),n(b.elements.select1)}function r(b){"all"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect?"moved"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect||m(b,1):(m(b,1),m(b,2)),b.element.find("option").each(function(b,c){var d=a(c);d.data("filtered1")||d.prop("selected",!0)}),k(b),f(b)}function s(b){"all"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect?"moved"!==b.settings.preserveSelectionOnMove||b.settings.moveOnSelect||m(b,2):(m(b,1),m(b,2)),b.element.find("option").each(function(b,c){var d=a(c);d.data("filtered2")||d.prop("selected",!1)}),k(b),f(b)}function t(a){a.elements.form.submit(function(b){a.elements.filterInput1.is(":focus")?(b.preventDefault(),a.elements.filterInput1.focusout()):a.elements.filterInput2.is(":focus")&&(b.preventDefault(),a.elements.filterInput2.focusout())}),a.element.on("bootstrapDualListbox.refresh",function(b,c){a.refresh(c)}),a.elements.filterClear1.on("click",function(){a.setNonSelectedFilter("",!0)}),a.elements.filterClear2.on("click",function(){a.setSelectedFilter("",!0)}),a.elements.moveButton.on("click",function(){p(a)}),a.elements.moveAllButton.on("click",function(){r(a)}),a.elements.removeButton.on("click",function(){q(a)}),a.elements.removeAllButton.on("click",function(){s(a)}),a.elements.filterInput1.on("change keyup",function(){l(a,1)}),a.elements.filterInput2.on("change keyup",function(){l(a,2)})}var u="bootstrapDualListbox",v={"bootstrap2Compatible":!1,"filterTextClear":"show all","filterPlaceHolder":"Filter","moveSelectedLabel":"Move selected","moveAllLabel":"Move all","removeSelectedLabel":"Remove selected","removeAllLabel":"Remove all","moveOnSelect":!0,"preserveSelectionOnMove":!1,"selectedListLabel":!1,"nonSelectedListLabel":!1,"helperSelectNamePostfix":"_helper","selectorMinimalHeight":100,"showFilterInputs":!0,"nonSelectedFilter":"","selectedFilter":"","infoText":"Showing all {0}","infoTextFiltered":'<span class="label label-warning">Filtered</span> {0} from {1}',"infoTextEmpty":"Empty list","filterOnValues":!1},w=/android/i.test(navigator.userAgent.toLowerCase());e.prototype={"init":function(){this.container=a('<div class="bootstrap-duallistbox-container"> <div class="box1">   <label></label>   <span class="info-container">     <span class="info"></span>     <button type="button" class="btn clear1 pull-right"></button>   </span>   <input class="filter" type="text">   <div class="btn-group buttons">     <button type="button" class="btn moveall">       <i></i>       <i></i>     </button>     <button type="button" class="btn move">       <i></i>     </button>   </div>   <select multiple="multiple"></select> </div> <div class="box2">   <label></label>   <span class="info-container">     <span class="info"></span>     <button type="button" class="btn clear2 pull-right"></button>   </span>   <input class="filter" type="text">   <div class="btn-group buttons">     <button type="button" class="btn remove">       <i></i>     </button>     <button type="button" class="btn removeall">       <i></i>       <i></i>     </button>   </div>   <select multiple="multiple"></select> </div></div>').insertBefore(this.element),this.elements={"originalSelect":this.element,"box1":a(".box1",this.container),"box2":a(".box2",this.container),"filterInput1":a(".box1 .filter",this.container),"filterInput2":a(".box2 .filter",this.container),"filterClear1":a(".box1 .clear1",this.container),"filterClear2":a(".box2 .clear2",this.container),"label1":a(".box1 > label",this.container),"label2":a(".box2 > label",this.container),"info1":a(".box1 .info",this.container),"info2":a(".box2 .info",this.container),"select1":a(".box1 select",this.container),"select2":a(".box2 select",this.container),"moveButton":a(".box1 .move",this.container),"removeButton":a(".box2 .remove",this.container),"moveAllButton":a(".box1 .moveall",this.container),"removeAllButton":a(".box2 .removeall",this.container),"form":a(a(".box1 .filter",this.container)[0].form)},this.originalSelectName=this.element.attr("name")||"";var b="bootstrap-duallistbox-nonselected-list_"+this.originalSelectName,c="bootstrap-duallistbox-selected-list_"+this.originalSelectName;return this.elements.select1.attr("id",b),this.elements.select2.attr("id",c),this.elements.label1.attr("for",b),this.elements.label2.attr("for",c),this.selectedElements=0,this.elementCount=0,this.setBootstrap2Compatible(this.settings.bootstrap2Compatible),this.setFilterTextClear(this.settings.filterTextClear),this.setFilterPlaceHolder(this.settings.filterPlaceHolder),this.setMoveSelectedLabel(this.settings.moveSelectedLabel),this.setMoveAllLabel(this.settings.moveAllLabel),this.setRemoveSelectedLabel(this.settings.removeSelectedLabel),this.setRemoveAllLabel(this.settings.removeAllLabel),this.setMoveOnSelect(this.settings.moveOnSelect),this.setPreserveSelectionOnMove(this.settings.preserveSelectionOnMove),this.setSelectedListLabel(this.settings.selectedListLabel),this.setNonSelectedListLabel(this.settings.nonSelectedListLabel),this.setHelperSelectNamePostfix(this.settings.helperSelectNamePostfix),this.setSelectOrMinimalHeight(this.settings.selectorMinimalHeight),g(this),this.setShowFilterInputs(this.settings.showFilterInputs),this.setNonSelectedFilter(this.settings.nonSelectedFilter),this.setSelectedFilter(this.settings.selectedFilter),this.setInfoText(this.settings.infoText),this.setInfoTextFiltered(this.settings.infoTextFiltered),this.setInfoTextEmpty(this.settings.infoTextEmpty),this.setFilterOnValues(this.settings.filterOnValues),this.element.hide(),t(this),k(this),this.element},"setBootstrap2Compatible":function(a,b){return this.settings.bootstrap2Compatible=a,a?(this.container.removeClass("row").addClass("row-fluid bs2compatible"),this.container.find(".box1, .box2").removeClass("col-md-6").addClass("span6"),this.container.find(".clear1, .clear2").removeClass("btn-default btn-xs").addClass("btn-mini"),this.container.find("input, select").removeClass("form-control"),this.container.find(".btn").removeClass("btn-default"),this.container.find(".moveall > i, .move > i").removeClass("glyphicon glyphicon-arrow-right").addClass("icon-arrow-right"),this.container.find(".removeall > i, .remove > i").removeClass("glyphicon glyphicon-arrow-left").addClass("icon-arrow-left")):(this.container.removeClass("row-fluid bs2compatible").addClass("row"),this.container.find(".box1, .box2").removeClass("span6").addClass("col-md-6"),this.container.find(".clear1, .clear2").removeClass("btn-mini").addClass("btn-default btn-xs"),this.container.find("input, select").addClass("form-control"),this.container.find(".btn").addClass("btn-default"),this.container.find(".moveall > i, .move > i").removeClass("icon-arrow-right").addClass("glyphicon glyphicon-arrow-right"),this.container.find(".removeall > i, .remove > i").removeClass("icon-arrow-left").addClass("glyphicon glyphicon-arrow-left")),b&&k(this),this.element},"setFilterTextClear":function(a,b){return this.settings.filterTextClear=a,this.elements.filterClear1.html(a),this.elements.filterClear2.html(a),b&&k(this),this.element},"setFilterPlaceHolder":function(a,b){return this.settings.filterPlaceHolder=a,this.elements.filterInput1.attr("placeholder",a),this.elements.filterInput2.attr("placeholder",a),b&&k(this),this.element},"setMoveSelectedLabel":function(a,b){return this.settings.moveSelectedLabel=a,this.elements.moveButton.attr("title",a),b&&k(this),this.element},"setMoveAllLabel":function(a,b){return this.settings.moveAllLabel=a,this.elements.moveAllButton.attr("title",a),b&&k(this),this.element},"setRemoveSelectedLabel":function(a,b){return this.settings.removeSelectedLabel=a,this.elements.removeButton.attr("title",a),b&&k(this),this.element},"setRemoveAllLabel":function(a,b){return this.settings.removeAllLabel=a,this.elements.removeAllButton.attr("title",a),b&&k(this),this.element},"setMoveOnSelect":function(a,b){if(w&&(a=!0),this.settings.moveOnSelect=a,this.settings.moveOnSelect){this.container.addClass("moveonselect");var c=this;this.elements.select1.on("change",function(){p(c)}),this.elements.select2.on("change",function(){q(c)})}else this.container.removeClass("moveonselect"),this.elements.select1.off("change"),this.elements.select2.off("change");return b&&k(this),this.element},"setPreserveSelectionOnMove":function(a,b){return w&&(a=!1),this.settings.preserveSelectionOnMove=a,b&&k(this),this.element},"setSelectedListLabel":function(a,b){return this.settings.selectedListLabel=a,a?this.elements.label2.show().html(a):this.elements.label2.hide().html(a),b&&k(this),this.element},"setNonSelectedListLabel":function(a,b){return this.settings.nonSelectedListLabel=a,a?this.elements.label1.show().html(a):this.elements.label1.hide().html(a),b&&k(this),this.element},"setHelperSelectNamePostfix":function(a,b){return this.settings.helperSelectNamePostfix=a,a?(this.elements.select1.attr("name",this.originalSelectName+a+"1"),this.elements.select2.attr("name",this.originalSelectName+a+"2")):(this.elements.select1.removeAttr("name"),this.elements.select2.removeAttr("name")),b&&k(this),this.element},"setSelectOrMinimalHeight":function(a,b){this.settings.selectorMinimalHeight=a;var c=this.element.height();return this.element.height()<a&&(c=a),this.elements.select1.height(c),this.elements.select2.height(c),b&&k(this),this.element},"setShowFilterInputs":function(a,b){return a?(this.elements.filterInput1.show(),this.elements.filterInput2.show()):(this.setNonSelectedFilter(""),this.setSelectedFilter(""),k(this),this.elements.filterInput1.hide(),this.elements.filterInput2.hide()),this.settings.showFilterInputs=a,b&&k(this),this.element},"setNonSelectedFilter":function(a,b){return this.settings.showFilterInputs?(this.settings.nonSelectedFilter=a,this.elements.filterInput1.val(a),b&&k(this),this.element):void 0},"setSelectedFilter":function(a,b){return this.settings.showFilterInputs?(this.settings.selectedFilter=a,this.elements.filterInput2.val(a),b&&k(this),this.element):void 0},"setInfoText":function(a,b){return this.settings.infoText=a,b&&k(this),this.element},"setInfoTextFiltered":function(a,b){return this.settings.infoTextFiltered=a,b&&k(this),this.element},"setInfoTextEmpty":function(a,b){return this.settings.infoTextEmpty=a,b&&k(this),this.element},"setFilterOnValues":function(a,b){return this.settings.filterOnValues=a,b&&k(this),this.element},"getContainer":function(){return this.container},"refresh":function(a){g(this),a?o(this):(m(this,1),m(this,2)),k(this)},"destroy":function(){return this.container.remove(),this.element.show(),a.data(this,"plugin_"+u,null),this.element}},a.fn[u]=function(b){var c=arguments;if(b===d||"object"==typeof b)return this.each(function(){a(this).is("select")?a.data(this,"plugin_"+u)||a.data(this,"plugin_"+u,new e(this,b)):a(this).find("select").each(function(c,d){a(d).bootstrapDualListbox(b)})});if("string"==typeof b&&"_"!==b[0]&&"init"!==b){var f;return this.each(function(){var d=a.data(this,"plugin_"+u);d instanceof e&&"function"==typeof d[b]&&(f=d[b].apply(d,Array.prototype.slice.call(c,1)))}),f!==d?f:this}}}(jQuery,window,document);



</script>

</body>

</html>