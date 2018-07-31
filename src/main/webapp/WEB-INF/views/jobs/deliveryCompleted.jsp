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

<title>Jobs</title>
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
/* table search filter css */
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
	padding-top: 1%;
	float: right;
}

#fourth {
	padding-right: 2%;
	width: 8%;
	float: right;
}

#pageButtons {
	padding-right: 3%;
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
				<li>Jobs</li>
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
			<!-- 	<div align="left">
					<button type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal"
						ng-click="addFunction()">
						Add Jobs <span &nbsp; class="fa fa-plus-circle"></span>
					</button>
				</div>
				<br> -->

				<div class="row">

					<!-- NEW WIDGET START -->
					<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-10"
							data-widget-editbutton="false">
							<header>
								<span class="widget-icon"> <i class="fa fa-table"></i>
								</span>
								<h2>Jobs List</h2>
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
														<button class="btn btn-link"
															ng-click="exportToExcel('#tableToExport')">
															<span class="glyphicon glyphicon-share"></span> Export to
															Excel
														</button>
													</div>
													<div id="fourth">
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
													ng-click="orderByField='assignedTo'; reverseSort = !reverseSort">
														Assigned To<span ng-show="orderByField == 'assignedTo'"><span
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
											<tbody id="tableToExport">
												<tr
													ng-repeat="job in jobslist | filter:{'project':  project_search}: filter2 | filter: global_search | startFrom:currentPage*pageSize | limitTo:pageSize | orderBy:orderByField:reverseSort">
													<td style="text-align: center;">{{ ($index + 1) +
														(currentPage) * pageSize}}</td>
													<td>{{job.project}}</td>
													<td>{{job.jobNo}}</td>
													<td>{{job.jobName}}</td>
													<td>{{job.assignedTo}}</td>
													<td>{{job.jobStage}}</td>
													<td>{{job.jobStatus}}</td>
													<td style="text-align: center;"><a ng-click="show(job.jobId)"
														href="${pageContext.request.contextPath}/downloadPaySlip?id=${employee.id}"
														id="{{x.num}}" data-toggle="modal" data-target="#myModal"><span
															class="glyphicon glyphicon-edit "></span></a> &nbsp; &nbsp; <a
														href="#"
														ng-click="jobDelete(job.jobId,job.jobNo)"><span
															ng-show="deleteShow"
															class="glyphicon glyphicon-trash "></span></a></td>
												</tr>
											</tbody>
										</table>
										<!-- Pagination Next Previous Buttons -->
										<div id="pageButtons" align="center">
											<button type="button" ng-disabled="currentPage == 0"
												class="btn btn-info" ng-click="currentPage=0">First</button>
											<button type="button" ng-disabled="currentPage == 0"
												class="btn btn-info" ng-click="currentPage=currentPage-1">Previous</button>
											&nbsp;&nbsp; <strong>{{currentPage+1}}/{{numberOfPages()}}</strong>&nbsp;&nbsp;
											<button type="button"
												ng-disabled="currentPage >= getData().length/pageSize - 1"
												class="btn btn-info" ng-click="currentPage=currentPage+1">Next</button>
											<button type="button"
												ng-disabled="currentPage >= getData().length/pageSize - 1"
												class="btn btn-info"
												ng-click="currentPage=numberOfPages() - 1">Last</button>
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
					<div class="main-content">
						<form ng-submit="onSubmit(theForm.$valid)" name="theForm"
							novalidate="novalidate">
							<div class="form-group row">
								<div class="col-lg-4">
									<label for="cli_pro_code"><span class="asterisc">*</span>Centillion
										Project Code</label> <select name="cli_pro_code" id="cli_pro_code"
										class="form-control" ng-model="formModel.projectId" required="required"
										ng-change="change(formModel.projectId)">
										<option value="" disabled selected hidden></option>
										<option ng-repeat="project in projectlist"
											ng-selected="formModel.projectId == project.projectId"
											value="{{project.projectId}}">{{project.centProjectCode}}</option>
									</select>
								</div>
								<div class="col-lg-4">
									<label for="client_name">Client Name</label> <input type="text"
										class="form-control" ng-model="tempModel.client_name"
										id="client_name" ng-disabled="true">
								</div>
								<div class="col-lg-4">
									<label for="cli_pm">Client Project Manager</label> <input
										type="text" class="form-control" ng-model="tempModel.cli_pm"
										id="cli_pm" ng-disabled="true">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-4">
									<label for="project_name">Project Name</label> <input
										type="text" class="form-control"
										ng-model="tempModel.project_name" id="project_name"
										 ng-disabled="true">
								</div>
								<div class="col-lg-4">
									<label for="project_code">Project Code</label> <input
										type="text" class="form-control"
										ng-model="tempModel.project_code" id="project_code"
										ng-disabled="true">
								</div>
								<div class="col-lg-4">
									<label for="ofs_pm">Offshore Project Manager</label> <input
										type="text" class="form-control" ng-model="tempModel.ofs_pm"
										id="ofs_pm" ng-disabled="true">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-4">
									<label for="team_lead">Team Lead</label> <input type="text"
										class="form-control" ng-model="tempModel.team_lead"
										id="team_lead" ng-disabled="true">
								</div>
								<div class="col-lg-4">
									<label for="key_res">Key Resource</label> <input type="text"
										class="form-control" ng-model="tempModel.key_res" id="key_res"
										ng-disabled="true">
								</div>
							</div>
							<div ng-if="flag==1">
								<div class="grid row">
									<div ng-repeat="uomstored in uomstoredlist">
										<div class="form-group">
											<div class="col-lg-2">
												<label for="uom">UOM Name</label> <input
													value="{{uomstored.uom}}" type="text" class="form-control"
													id="uom" ng-disabled="true">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div ng-if="flag==2">
								<div class="grid row">
									<div ng-repeat="uomstored in uomByJob">
										<div class="form-group">
											<div class="col-lg-2">
												<label for="uom">UOM Name</label> <input
													value="{{uomstored.uomName}}" type="text"
													class="form-control" id="uom" ng-disabled="true">
											</div>
											<div class="col-lg-2">
												<label for="uom_val">Quantity</label> <input type="text"
													class="form-control" value="{{uomstored.value}}"
													id="uom_val" ng-disabled="true">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-6">
									<br> <label for="job_id">Job
										Id</label> <input type="text" class="form-control"
										ng-change="Check(formModel.jobNo,1)"
										ng-model="formModel.jobNo" id="job_id" ng-disabled="false"
										maxlength="250">
									<p ng-show="test1">The Special Character not accept.</p>
								</div>
								<div class="col-lg-6">
									<br> <label for="job_name">Job
										Name</label> <input type="text" class="form-control"
										ng-model="formModel.jobName" id="job_name" ng-disabled="false"
										maxlength="250">
									<p ng-show="test2">The Special Character not accept.</p>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-2">
									<label for="job_hours">Estimated
										Total Job Hours</label> <input type="number" class="form-control"
										ng-model="formModel.hoursEstimated" ng-blur="hourscalculate()"
										id="job_hours" ng-disabled="false" maxlength="5">
								</div>
								<div class="col-lg-5">
									<label for="job_stage">Job
										Stage</label> <select name="job_stage" id="job_stage"
										class="form-control" ng-model="formModel.jobStage"
										ng-init="formModel.jobStage='Production'"
										ng-change="approvalCheck(formModel.jobStage)">
										<option value="Production">Production</option>
										<option value="QC">QC</option>
										<option value="QA">QA</option>
										<option value="Delivery">Delivery</option>
										<option value="Approval">Approval</option>
									</select>
								</div>
								<div class="col-lg-5">
									<label for="job_status">Job
										Status</label> <select name="job_status" id="job_status"
										class="form-control" ng-disabled="resourceShow"
										ng-model="formModel.jobStatus">
										<option ng-show="approvalHide" value="YTS">YTS</option>
										<option ng-show="approvalHide" value="WIP">WIP</option>
										<option ng-show="approvalHide" value="Pause">Pause</option>
										<option ng-show="approvalHide" value="Hold">Hold</option>
										<option ng-show="approvalHide" value="Query">Query</option>
										<option ng-show="approvalHide" value="Completed">Completed</option>
										<option ng-show="approvalShow" value="Pending">Pending</option>
										<option ng-show="approvalShow" value="Approved">Approved</option>
									</select>
								</div>
							</div>
							<div class="form-group row seven-cols" ng-show="resourceShow">
								<div class="col-lg-1 ">
									<h4 style="margin-top: 10%;">Allocated Resources</h4>
								</div>
								<div class="col-lg-1">
									<label for="allo_pro">Production</label> <input type="text"
										class="form-control" ng-model="tempModel.allo_pro"
										id="allo_pro" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_qc">QC</label> <input type="text"
										class="form-control" ng-model="tempModel.allo_qc" id="allo_qc"
										ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_qa">QA</label> <input type="text"
										class="form-control" ng-model="tempModel.allo_qa" id="allo_qa"
										ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_delivery">Delivery</label> <input type="text"
										class="form-control" ng-model="tempModel.allo_delivery"
										id="allo_delivery" ng-disabled="true">
								</div>
							</div>
							<div class="form-group row seven-cols">
								<!-- style="border-bottom-style: groove" -->
								<div class="col-lg-1 ">
									<h4 id="resource_title" style="margin-top: 10%;">Select
										Resources</h4>
								</div>
								<div class="col-lg-1 ">
									<label for="res_pro">Production</label>
									<select name="res_pro" id="productionResource"
										ng-model="formModel.productionResource" class="form-control">
										<option value="" disabled selected hidden></option>
										<option ng-repeat="tm in projectTeamList"
											value="{{tm.resourceId}}">{{tm.firstName}}</option>
									</select>
								</div>
								<div class="col-lg-1 ">
									<label for="res_qc">QC</label><select
										name="res_qc" id="res_qc" ng-model="formModel.qcResource"
										class="form-control">
										<option value="" disabled selected hidden></option>
										<option ng-repeat="tm in projectTeamList"
											ng-selected="formModel.qcResource == tm.resourceId"
											value="{{tm.resourceId}}">{{tm.firstName}}</option>
									</select>
								</div>
								<div class="col-lg-1">
									<label for="res_qa">QA</label> <select
										name="res_qa" id="res_qa" ng-model="formModel.qaResource"
										class="form-control">
										<option value="" disabled selected hidden></option>
										<option ng-repeat="tm in projectTeamList"
											ng-selected="formModel.qaResource == tm.resourceId"
											value="{{tm.resourceId}}">{{tm.firstName}}</option>
									</select>
								</div>
								<div class="col-lg-1 ">
									<label for="res_delivery">Delivery</label>
									<select name="res_delivery" id="res_delivery"
										ng-model="formModel.deliveryResource" class="form-control">
										<option value="" disabled selected hidden></option>
										<option ng-repeat="tm in projectTeamList"
											ng-selected="formModel.deliveryResource == tm.resourceId"
											value="{{tm.resourceId}}">{{tm.firstName}}</option>
									</select>
								</div>
							</div>
							<div class="form-group row seven-cols">
								<div class="col-lg-1">
									<h4 style="margin-top: 10%;">Hours Estimated</h4>
								</div>
								<div class="col-lg-1">
									<label for="allo_pro">Production</label> <input type="text"
										class="form-control" ng-model="tempModel.estimate_pro"
										id="estimate_pro" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_qc">QC</label> <input type="text"
										class="form-control" ng-model="tempModel.estimate_qc"
										id="estimate_qc" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_qa">QA</label> <input type="text"
										class="form-control" ng-model="tempModel.estimate_qa"
										id="estimate_qa" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_delivery">Delivery</label> <input type="text"
										class="form-control" ng-model="tempModel.estimate_delivery"
										id="estimate_delivery" ng-disabled="true">
								</div>
							</div>
							<div class="form-group row seven-cols" ng-show="editSpentTime">
								<div class="col-lg-1">
									<h4 style="margin-top: 10%;">Edit Hours Spent</h4>
								</div>
								<div class="col-lg-1">
									<label for="allo_pro">Production</label> <input type="number"
										class="form-control" ng-model="formModel.productionSpentHours"
										id="spent_pro"
										ng-change="productionSpentFunction(formModel.productionSpentHours)"
										ng-disabled="false">
								</div>
								<div class="col-lg-1">
									<label for="allo_qc">QC</label> <input type="number"
										class="form-control" ng-model="formModel.qcSpentHours"
										id="spent_qc"
										ng-change="qcSpentFunction(formModel.qcSpentHours)"
										ng-disabled="false">
								</div>
								<div class="col-lg-1">
									<label for="allo_qa">QA</label> <input type="number"
										class="form-control" ng-model="formModel.qaSpentHours"
										id="spent_qa"
										ng-change="qaSpentFunction(formModel.qaSpentHours)"
										ng-disabled="false">
								</div>
								<div class="col-lg-1">
									<label for="allo_delivery">Delivery</label> <input
										type="number" class="form-control"
										ng-model="formModel.deliverySpentHours" id="spent_delivery"
										ng-change="deliverySpentFunction(formModel.deliverySpentHours)"
										ng-disabled="false">
								</div>
							</div>
							<div class="form-group row seven-cols" ng-show="resourceShow">
								<div class="col-lg-1">
									<h4 style="margin-top: 10%;">
										Hours Spent - <a href="#" ng-click="editSpentTime=true">Edit</a>
									</h4>
								</div>
								<div class="col-lg-1">
									<label for="allo_pro">Production</label> <input type="text"
										class="form-control" ng-model="tempModel.spent_pro"
										id="spent_pro" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_qc">QC</label> <input type="text"
										class="form-control" ng-model="tempModel.spent_qc"
										id="spent_qc" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_qa">QA</label> <input type="text"
										class="form-control" ng-model="tempModel.spent_qa"
										id="spent_qa" ng-disabled="true">
								</div>
								<div class="col-lg-1">
									<label for="allo_delivery">Delivery</label> <input type="text"
										class="form-control" ng-model="tempModel.spent_delivery"
										id="spent_delivery" ng-disabled="true">
								</div>
							</div>
							<br>
							<div class="form-group row">
								<div class="col-lg-3">
									<label for="res_delivery">Recieved
										Date</label>
									<div class="date">
										<input type="text" class="form-control" name="date"
											id="receivedDate" ng-model="formModel.receivedDate" />
									</div>
									<!-- <div class="date">
										<div class="input-group input-append date" id="">
											<input type="text" class="form-control" name="date" /> <span
												class="input-group-addon add-on"><span
												class="glyphicon glyphicon-calendar"></span></span>
										</div>
									</div> -->
								</div>
								<div class="col-lg-3">
									<label for="res_delivery">Assigned
										Date</label>
									<div class="date">
										<input type="text" class="form-control" name="date"
											id="assignedDate" ng-model="formModel.assignedDate" />
									</div>
								</div>
								<div class="col-lg-3">
									<label for="res_delivery">Expected
										Delivery</label>
									<div class="date">
										<input type="text" class="form-control" name="date"
											id="expectedDelivery" ng-model="formModel.expectedDelivery" />
									</div>
								</div>
								<div class="col-lg-3">
									<label for="res_delivery">Delivered On</label>
									<div class="date">
										<input type="text" class="form-control" name="date"
											id="reciveddate4" ng-model="tempModel.deliveredOn"
											ng-disabled="true" />
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-4">
									<label for="job_id">Total Hours Spent</label> <input
										type="text" class="form-control"
										ng-model="tempModel.hours_spent" id="job_id"
										 ng-disabled="true">
								</div>
								<!-- 
								<div class="col-lg-4">
									<label for="last_mod">Last Modified</label> <input type="text"
										class="form-control" ng-model="tempModel.lastModified"
										id="last_mod"  ng-disabled="true">
								</div> -->
							</div>
							<div class="form-group">
								<label for="lt_mod">Job
									Criticality</label><br /> <label class="radio-inline"> <input
									type="radio" name="optradio"
									ng-model="formModel.jobCriticality" value="High">High
								</label> <label class="radio-inline"> <input type="radio"
									name="optradio" ng-model="formModel.jobCriticality"
									value="Normal">Normal
								</label>
							</div>

							<div class="form-group">
								<label for="job_id">Remarks</label>
								<textarea class="form-control" name="remarks"
									ng-model="formModel.remarks"></textarea>
								<br />
							</div>

							<div class="modal-footer">
								<div class="form-group">
									<div align="center">
										<button class="btn btn-primary btn-lg" type="submit"
											ng-disabled="theForm.$invalid" ng-click="addTask()" onClick="window.location.reload()">Submit</button>
										<button type="button" class="btn btn-default btn-lg"
											data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(function() {
			$('#receivedDate').datepicker(
					{
						dateFormat : 'dd-mm-yy',
						prevText : '<i class="fa fa-chevron-left"></i>',
						nextText : '<i class="fa fa-chevron-right"></i>',
						onSelect : function(selectedDate) {
							selectedDate = $('#receivedDate').datepicker(
									'getDate');
							selectedDate.setDate(selectedDate.getDate());
							$('#assignedDate').datepicker('option', 'minDate',
									selectedDate);
						}
					});
		});
		$(function() {
			$('#assignedDate').datepicker(
					{
						dateFormat : 'dd-mm-yy',
						prevText : '<i class="fa fa-chevron-left"></i>',
						nextText : '<i class="fa fa-chevron-right"></i>',
						onSelect : function(selectedDate) {
							selectedDate = $('#assignedDate').datepicker(
									'getDate');
							selectedDate.setDate(selectedDate.getDate());
							$('#expectedDelivery').datepicker('option',
									'minDate', selectedDate);
							$('#receivedDate').datepicker('option', 'maxDate',
									selectedDate);
						}
					});
		});
		$(function() {
			$('#expectedDelivery').datepicker(
					{
						dateFormat : 'dd-mm-yy',
						prevText : '<i class="fa fa-chevron-left"></i>',
						nextText : '<i class="fa fa-chevron-right"></i>',
						onSelect : function(selectedDate) {
							selectedDate = $('#expectedDelivery').datepicker(
									'getDate');
							selectedDate.setDate(selectedDate.getDate());
							$('#assignedDate').datepicker('option', 'maxDate',
									selectedDate);

						}
					});
		});
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
		/* 	app.filter('unique', function() {
				return function(collection, keyname) {
					var output = [], keys = [];

					angular.forEach(collection, function(item) {
						var key = item[keyname];
						if (keys.indexOf(key) === -1) {
							keys.push(key);
							output.push(item);
						}
					});
					return output;
				};
			}); */

		app
				.factory(
						'Excel',
						function($window) {
							var uri = 'data:application/vnd.ms-excel;base64,', template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>', base64 = function(
									s) {
								return $window
										.btoa(unescape(encodeURIComponent(s)));
							}, format = function(s, c) {
								return s.replace(/{(\w+)}/g, function(m, p) {
									return c[p];
								})
							};
							return {
								tableToExcel : function(tableId, worksheetName) {
									var table = $(tableId), ctx = {
										worksheet : worksheetName,
										table : table.html()
									}, href = uri
											+ base64(format(template, ctx));
									return href;
								}
							};
						});

		app
				.controller(
						'JobController',
						function(Excel, $timeout, $scope, $http, $filter) {
							$http
									.get(
											'${pageContext.request.contextPath}/jobsApprovalList')
									.then(function(response) {
										$scope.jobslist = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/projectList')
									.then(function(response) {
										$scope.projectlist = response.data;
									});

							/* Excel download Starts */
							$scope.exportToExcel = function(tableId) { // ex: '#my-table'
								var exportHref = Excel.tableToExcel(tableId,
										'WireWorkbenchDataExport');
								$timeout(function() {
									location.href = exportHref;
								}, 100); // trigger download
							};
							/* Excel download Ends */
							
							
							/*  code for hidding Delete Button starts here */
								$scope.deleteShow = false;
							
								if (role == "Manager" || role == "Admin" || role == "Super Admin") {
									$scope.deleteShow = true;
								}
							/*  code for hidding Delete Button ends here */

							/* Autofill data & team members, Uom according to Project by selecting Centillion Project Code Starts */
							$scope.change = function(projectID) {
								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/teamMembers/byProjectId/'
														+ projectID)
										.then(
												function(response) {
													$scope.projectTeamList = response.data;
													for (var j = 0; j < $scope.projectTeamList.length; j++) {
														if ($scope.projectTeamList[j].keyResourceIndication == "Y") {
															$scope.tempModel.key_res = $scope.projectTeamList[j].firstName;
														}
													}
												});
								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/projectUom/byProjectId/'
														+ projectID)
										.then(
												function(response) {
													$scope.uomstoredlist = response.data;
												});
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/projectById/' + projectID)
										.then(function(response) {
											$scope.projectbyId = response.data;
											$scope.autoFill(projectID);
											if($scope.flag == 2){
												$scope.hourscalculate();
											}
										});

							};
							/* Autofill data & team members, Uom according to Project by selecting Centillion Project Code Ends */

							/* JobStage Approval Hide & Show Start*/
							$scope.approvalShow = false;
							$scope.approvalHide = true;

							$scope.approvalCheck = function(jobStage) {
								if (jobStage == "Approval") {
									$scope.approvalShow = true;
									$scope.approvalHide = false;
									$scope.formModel.jobStatus = "Pending";
								} else {
									$scope.approvalShow = false;
									$scope.approvalHide = true;
									$scope.formModel.jobStatus = "YTS";
								}
							};
							/* JobStage Approval Hide & Show End*/

							/* Filter list by selecting project name Starts */
							$scope.filter2 = function(field1, field2) {
								if (field2 === "" || field2 === null)
									return true;
								return field1 === field2;
							};
							/* Filter list by selecting project name Ends */

							/* AutoFill of Project details Starts */
							$scope.autoFill = function(projectIdReceived) {
								$scope.tempModel.client_name = $scope.projectbyId.client;
								$scope.tempModel.cli_pm = $scope.projectbyId.clientPm;
								$scope.tempModel.project_name = $scope.projectbyId.projectName;
								$scope.tempModel.project_code = $scope.projectbyId.projectCode;
								$scope.tempModel.ofs_pm = $scope.projectbyId.offshorePm;
								$scope.tempModel.team_lead = $scope.projectbyId.resource;
								/* if (projectIdReceived == -1) {
									$scope.tempModel = {};
									$scope.tempModel.estimate_pro = "00:00:00";
									$scope.tempModel.estimate_qc = "00:00:00";
									$scope.tempModel.estimate_qa = "00:00:00";
									$scope.tempModel.estimate_delivery = "00:00:00";
								} */
							};
							/* AutoFill of Project details Ends */

							/* Convert double Hours to String 00:00:00 Start */
							$scope.hoursConvert = function(hours) {
								d = Number(+hours * 60 * 60);
								var h = Math.floor(d / 3600);
								var m = Math.floor(d % 3600 / 60);
								var s = Math.floor(d % 3600 % 60);
								h = h <= 9 ? "0" + h : h;
								m = m <= 9 ? "0" + m : m;
								s = s <= 9 ? "0" + s : s;

								return h + ":" + m + ":00";
							};
							/*  Convert double Hours to String 00:00:00 Ends */

							/* Calculate Hours Start */
							$scope.hourscalculate = function() {
								$scope.formModel.productionEstimatedHours = $scope.formModel.hoursEstimated
										* $scope.projectbyId.productionPercentage
										/ 100;
								$scope.tempModel.estimate_pro = $scope
										.hoursConvert($scope.formModel.productionEstimatedHours);
								$scope.formModel.qcEstimatedHours = $scope.formModel.hoursEstimated
										* $scope.projectbyId.qcPercentage / 100;
								$scope.tempModel.estimate_qc = $scope
										.hoursConvert($scope.formModel.qcEstimatedHours);
								$scope.formModel.qaEstimatedHours = $scope.formModel.hoursEstimated
										* $scope.projectbyId.qaPercentage / 100;
								$scope.tempModel.estimate_qa = $scope
										.hoursConvert($scope.formModel.qaEstimatedHours);
								$scope.formModel.deliveryEstimatedHours = $scope.formModel.hoursEstimated
										* $scope.projectbyId.feedbackPercentage
										/ 100;
								$scope.tempModel.estimate_delivery = $scope
										.hoursConvert($scope.formModel.deliveryEstimatedHours);
							};
							/* Calculate Hours Ends */

							/* Edit Spent Time Start */
							$scope.productionSpentFunction = function(time) {
								$scope.tempModel.spent_pro = $scope
										.hoursConvert(time);
							};
							$scope.qcSpentFunction = function(time) {
								$scope.tempModel.spent_qc = $scope
										.hoursConvert(time);
							};
							$scope.qaSpentFunction = function(time) {
								$scope.tempModel.spent_qa = $scope
										.hoursConvert(time);
							};
							$scope.deliverySpentFunction = function(time) {
								$scope.tempModel.spent_delivery = $scope
										.hoursConvert(time);
							};
							/* Edit Spent Time End */

							$scope.onSubmit = function(valid) {
								if (valid) {
									console.log("hey ");
									console.log($scope.formModel);
								} else {
									console.log("Invalid");
								}
							};

							/* Add Job Button Start */
							$scope.addFunction = function() {
								$scope.resourceShow = false;
								$scope.flag = 1;
								$scope.formModel = {};
								$scope.change(-1);
								// 								$scope.autoFill(-1);
								$scope.tempModel = {};
								$('#receivedDate').val("");
								$('#assignedDate').val("");
								$('#expectedDelivery').val("");
								$('#reciveddate4').val("");
								document.getElementById("cli_pro_code").value = -1;
								$scope.formModel.jobStage = "Production";
								$scope.formModel.jobStatus = "YTS";
							};
							/* Add Job Button Ends */

							/* Show Estimated Spend Hours on clicking Edit Starts */
							$scope.autoFillHours = function() {
								$scope.tempModel.estimate_pro = $scope
										.hoursConvert($scope.jobStageList[0].hoursEstimated);
								$scope.tempModel.estimate_qc = $scope
										.hoursConvert($scope.jobStageList[1].hoursEstimated);
								$scope.tempModel.estimate_qa = $scope
										.hoursConvert($scope.jobStageList[2].hoursEstimated);
								$scope.tempModel.estimate_delivery = $scope
										.hoursConvert($scope.jobStageList[3].hoursEstimated);

								$scope.tempModel.spent_pro = $scope
										.hoursConvert($scope.jobStageList[0].hoursSpent);
								$scope.tempModel.spent_qc = $scope
										.hoursConvert($scope.jobStageList[1].hoursSpent);
								$scope.tempModel.spent_qa = $scope
										.hoursConvert($scope.jobStageList[2].hoursSpent);
								$scope.tempModel.spent_delivery = $scope
										.hoursConvert($scope.jobStageList[3].hoursSpent);
							};
							/* Show Estimated Spend Hours on clicking Edit Ends */

							/* ResourceAllocation AutoFill on clicking Edit Starts*/
							$scope.resourceAllocationFill = function() {
								$scope.tempModel.allo_pro = $scope.resourceAllocation.resourceByProductionAllocatedName;
								$scope.tempModel.allo_qc = $scope.resourceAllocation.resourceByQcAllocatedName;
								$scope.tempModel.allo_qa = $scope.resourceAllocation.resourceByQaAllocatedName;
								$scope.tempModel.allo_delivery = $scope.resourceAllocation.resourceByFeedbackAllocatedName;
								$scope.formModel.resourceAllocatedId = $scope.resourceAllocation.resourceAllocatedId;
								$scope.formModel.productionResource = $scope.resourceAllocation.resourceByProductionAllocatedId;
								$scope.formModel.qcResource = $scope.resourceAllocation.resourceByQcAllocatedId;
								$scope.formModel.qaResource = $scope.resourceAllocation.resourceByQaAllocatedId;
								$scope.formModel.deliveryResource = $scope.resourceAllocation.resourceByFeedbackAllocatedId;
							};
							/* ResourceAllocation AutoFill on clicking Edit Ends*/

							/* Job AutoFill by clicking edit starts */
							$scope.jobAutoFill = function() {
								$scope.change($scope.jobById.projectId);
								$scope.formModel.projectId = $scope.jobById.projectId;
								$scope.formModel.jobNo = $scope.jobById.jobNo;
								$scope.formModel.jobName = $scope.jobById.jobName;
								$scope.formModel.hoursEstimated = $scope.jobById.hoursEstimated;
								$scope.formModel.jobStage = $scope.jobById.jobStage;
								$scope.formModel.jobStatus = $scope.jobById.jobStatus;
								$('#receivedDate').val(
										$scope.jobById.receivedDate);
								$('#assignedDate').val(
										$scope.jobById.assignedDate);
								$('#expectedDelivery').val(
										$scope.jobById.expectedDelivery);
								$('#reciveddate4').val(
										$scope.jobById.deliveredOn);
								$scope.tempModel.hours_spent = $scope
										.hoursConvert($scope.jobById.hoursSpent);
								//$scope.tempModel.lastModified = $scope.jobById.lastModified;
								$scope.formModel.jobCriticality = $scope.jobById.jobCriticality;
								$scope.formModel.remarks = $scope.jobById.remarks;
							};
							/* Job AutoFill by clicking edit ends */

							/* Job Edit Starts */
							$scope.show = function(jobId) {
								$scope.formModel = {};
								$scope.flag = 2;
								$scope.formModel.jobId = jobId;
								$scope.resourceShow = true;
								$scope.editSpentTime = false;
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/jobUom/byJobId/' + jobId)
										.then(function(response) {
											$scope.uomByJob = response.data;
										});
								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/getJobStageByJobId/'
														+ jobId)
										.then(
												function(response) {
													$scope.jobStageList = response.data;
													$scope.autoFillHours();
												});

								$http
										.post(
												'${pageContext.request.contextPath}'
														+ '/resourceAllocation/byJobId/'
														+ jobId)
										.then(
												function(response) {
													$scope.resourceAllocation = response.data;
													$scope
															.resourceAllocationFill();
												});
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/job/byJobId/' + jobId)
										.then(function(response) {
											$scope.jobById = response.data;
											$scope.jobAutoFill();
										});

								/* for (var i = 0; i < $scope.jobslist.length; i++) {
									if ($scope.jobslist[i].jobId == jobId) {
										$scope
												.change($scope.jobslist[i].projectId);
										$scope.formModel.projectId = $scope.jobslist[i].projectId;
										$scope.formModel.jobNo = $scope.jobslist[i].jobNo;
										$scope.formModel.jobName = $scope.jobslist[i].jobName;
										$scope.formModel.hoursEstimated = $scope.jobslist[i].hoursEstimated;
										// 										$scope.hourscalculate();
										$scope.formModel.jobStage = $scope.jobslist[i].jobStage;
										document.getElementById("job_stage").value = $scope.jobslist[i].jobStage;
										$scope.formModel.jobStatus = $scope.jobslist[i].jobStatus;
										document.getElementById("job_status").value = $scope.jobslist[i].jobStatus;
										for (var j = 0; j < $scope.resourceAllocationList.length; j++) {
											if ($scope.resourceAllocationList[j].job == jobId) {
												$scope.tempModel.allo_pro = $scope.resourceAllocationList[j].resourceByProductionAllocatedName;
												$scope.tempModel.allo_qc = $scope.resourceAllocationList[j].resourceByQcAllocatedName;
												$scope.tempModel.allo_qa = $scope.resourceAllocationList[j].resourceByQaAllocatedName;
												$scope.tempModel.allo_delivery = $scope.resourceAllocationList[j].resourceByFeedbackAllocatedName;
												$scope.formModel.res_allo_id = $scope.resourceAllocationList[j].resourceAllocatedId;
												$scope.formModel.productionResource = $scope.resourceAllocationList[j].resourceByProductionAllocatedId;
												$scope.formModel.qcResource = $scope.resourceAllocationList[j].resourceByQcAllocatedId;
												$scope.formModel.qaResource = $scope.resourceAllocationList[j].resourceByQaAllocatedId;
												$scope.formModel.deliveryResource = $scope.resourceAllocationList[j].resourceByFeedbackAllocatedId;
											}
										} 
										$('#receivedDate')
												.val(
														$scope.jobslist[i].receivedDate);
										$('#assignedDate')
												.val(
														$scope.jobslist[i].assignedDate);
										$('#expectedDelivery')
												.val(
														$scope.jobslist[i].expectedDelivery);
										$('#reciveddate4').val(
												$scope.jobslist[i].deliveredOn);
										$scope.tempModel.hours_spent = $scope
												.hoursConvert($scope.jobslist[i].hoursSpent);
										$scope.tempModel.lastModified = $scope.jobslist[i].lastModified;
										$scope.formModel.jobCriticality = $scope.jobslist[i].jobCriticality;
										$scope.formModel.remarks = $scope.jobslist[i].remarks;
									}
								} */

							};
							/* Job Edit Ends */

							$scope.formModel = {};
							$scope.tempModel = {};
							$scope.flag = 1;
							$scope.resourceShow = true;
							$scope.editSpentTime = false;

							/* Sort Starts */
							$scope.orderByField = '$index';
							$scope.reverseSort = false;
							/* Sort End */

							/* Pagination */
							$scope.currentPage = 0;
							$scope.pageSize = 10;
							$scope.global_search = '';
							$scope.project_search = '';
							$scope.getData = function() {
								return $filter('filter')($scope.jobslist,
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

							/* Submit button Starts */
							$scope.addTask = function() {
								$scope.formModel.receivedDate = $(
										'#receivedDate').val();
								$scope.formModel.assignedDate = $(
										'#assignedDate').val();
								$scope.formModel.expectedDelivery = $(
										'#expectedDelivery').val();
								/* $scope.tempModel.deliveredOn = $(
										'#reciveddate4').val();
								$scope.tempModel.deliveredOn = "15-08-1947"; */
								$scope.jobJson = JSON
										.stringify($scope.formModel);
// 								alert($scope.jobJson);
								if ($scope.flag == 2) {
									$http.put(
											'${pageContext.request.contextPath}'
													+ '/job/edit/'
													+ $scope.jobJson).then(
											function(data) {
												console.log(data);
											});

									/* $http
											.put(
													'${pageContext.request.contextPath}'
															+ '/job/edit/'
															+ $scope.selectedJobId
															+ '/'
															+ $scope.formModel.projectId
															+ '/'
															+ $scope.formModel.jobNo
															+ '/'
															+ $scope.formModel.jobName
															+ '/'
															+ $scope.formModel.jobStage
															+ '/'
															+ $scope.formModel.jobStatus
															+ '/'
															+ $scope.formModel.res_allo_id
															+ '/'
															+ $scope.formModel.productionResource
															+ '/'
															+ $scope.formModel.qcResource
															+ '/'
															+ $scope.formModel.qaResource
															+ '/'
															+ $scope.formModel.deliveryResource
															+ '/'
															+ $scope.formModel.receivedDate
															+ '/'
															+ $scope.formModel.assignedDate
															+ '/'
															+ $scope.formModel.expectedDelivery
															+ '/'
															+ $scope.tempModel.deliveredOn
															+ '/'
															+ $scope.formModel.jobCriticality
															+ '/'
															+ $scope.formModel.remarks)
											.then(function(data) {
												alert(data);
											}); */
								} else {
									$http.post(
											'${pageContext.request.contextPath}'
													+ '/job/insert/'
													+ $scope.jobJson).then(
											function(data) {
												console.log(data);
											});
									/* $http
											.post(
													'${pageContext.request.contextPath}'
															+ '/job/insert/'
															+ $scope.formModel.projectId
															+ '/'
															+ $scope.formModel.jobNo
															+ '/'
															+ $scope.formModel.jobName
															+ '/'
															+ $scope.formModel.hoursEstimated
															+ '/'
															+ $scope.formModel.jobStage
															+ '/'
															+ $scope.formModel.jobStatus
															+ '/'
															+ $scope.formModel.productionResource
															+ '/'
															+ $scope.formModel.qcResource
															+ '/'
															+ $scope.formModel.qaResource
															+ '/'
															+ $scope.formModel.deliveryResource
															+ '/'
															+ $scope.formModel.productionEstimatedHours
															+ '/'
															+ $scope.formModel.qcEstimatedHours
															+ '/'
															+ $scope.formModel.qaEstimatedHours
															+ '/'
															+ $scope.formModel.deliveryEstimatedHours
															+ '/'
															+ $scope.formModel.receivedDate
															+ '/'
															+ $scope.formModel.assignedDate
															+ '/'
															+ $scope.formModel.expectedDelivery
															+ '/'
															+ $scope.tempModel.deliveredOn
															+ '/'
															+ $scope.formModel.jobCriticality
															+ '/'
															+ $scope.formModel.remarks)
											.then(function(data) {
												alert(data);
											}); */
								}
							};
							/* Submit button Ends */
							
							
							/* Deleting project Start */
						$scope.jobDelete = function(jobId,jobName) {
							 var r = confirm("Are you sure? \nDo you want to delete Job "+jobName+"?");
							    if (r == true) {
							    	$http
									.delete(
											'${pageContext.request.contextPath}'
													+ '/job/delete/'
													+ jobId)
									.then(
											function(response) {
												$scope.deleteAlert = response.data;
												alert($scope.deleteAlert.clientName);
												location.reload();
											});
							    } 
						};
						/* Deleting project Ends */
							

							/* Checking for Special Character Starts */
							$scope.Check = function(x, num) {
								var reg = /^[^`~!@#$%\^&*()_+={}|[\]\\:';"<>?,./]*$/;

								if (!x.match(reg)) {
									if (num == 1) {
										$scope.formModel.jobNo = x.substring(0,
												x.length - 1);
										$scope.test1 = true;
									}
									if (num == 2) {
										$scope.formModel.jobName = x.substring(
												0, x.length - 1);
										$scope.test2 = true;
									}

								} else {
									$scope.test1 = false;
									$scope.test2 = false;

								}
							};
							/* Checking for Special Character Ends */

						});

		/* Pagination Filter Start */
		app.filter('startFrom', function() {
			return function(input, start) {
				start = +start; //parse to int
				return input.slice(start);
			}
		});
		/* Pagination Filter End */
	</script>

	<!-- angular js script end -->
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