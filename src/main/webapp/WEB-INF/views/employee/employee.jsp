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

<title>Employee</title>
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

<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

<!--  top menu component -->
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/component.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/smartadmin_custom.css">
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr.custom.js"></script>



<!-- //bootstrap button -->


<link rel="stylesheet" type="text/css" media="screen"
	href="${pageContext.request.contextPath}/resources/css/angular-bootstrap-toggle.less">

<script
	src="${pageContext.request.contextPath}/resources/js/angular-bootstrap-toggle.js"></script>

<!-- //bootstrap button END -->
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
				<li>Employee</li>
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
					<button type="button" id="addEmpId" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal"
						ng-click="addFunction()" ng-disabled="readOnly()">
						Add Employee <span &nbsp; class="fa fa-plus-circle"></span>
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
								<h2>Employee List</h2>

							</header>

							<!-- widget div-->
							<div>
								<!-- widget content -->
								<div class="widget-body no-padding">
									<div style="border: 1px solid black;">
										<table id="datatable_tabletools"
											class="table table-striped table-bordered table-hover"
											width="100%">

											<tr>

												<!--  Code for search starts here -->
												<th colspan="8"><div id="first">
														<label for="cli_pm">Search for Employees</label><input
															type="text" class="form-control" ng-model="global_search"
															placeholder="Search...">
													</div> <!-- Code for Pagination starts here-->

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
													</div> <!-- Code for Pagination ends here--></th>
											</tr>
											<tr>
												<!--  Code for search ends here -->
												<!--Code for Displaying Employees List table starts here  -->
												<th><a href="#"
													ng-click="orderByField='$index'; reverseSort = !reverseSort">
														Sl No <span ng-show="orderByField == '$index'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='empId'; reverseSort = !reverseSort">Employee
														ID<span ng-show="orderByField == 'empId'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='firstName'; reverseSort = !reverseSort">Name
														<span ng-show="orderByField == 'firstName'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='deptName'; reverseSort = !reverseSort">Department<span
														ng-show="orderByField == 'deptName'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='designation'; reverseSort = !reverseSort">Designation<span
														ng-show="orderByField == 'designation'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th><a href="#"
													ng-click="orderByField='officialEmail'; reverseSort = !reverseSort">Email<span
														ng-show="orderByField == 'officialEmail'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>

												<th><a href="#"
													ng-click="orderByField='mobileNo'; reverseSort = !reverseSort">Phone
														Number<span ng-show="orderByField == 'mobileNo'"><span
															ng-show="!reverseSort"> ^</span><span
															ng-show="reverseSort"> v</span></span>
												</a></th>
												<th>Actions</th>
											</tr>
											<tbody>
												<tr
													ng-repeat="employee in resourcelist | filter: global_search |  startFrom:currentPage*pageSize | limitTo:pageSize | orderBy:orderByField:reverseSort">
													<td style="text-align: center;">{{ ($index + 1) +
														(currentPage) * pageSize}}</td>
													<td>{{employee.empId}}</td>
													<td>{{employee.firstName}} {{employee.lastName}}</td>
													<td>{{employee.deptName}}</td>
													<!-- 													<td>{{job.date}}</td> -->
													<td>{{employee.designation}}</td>
													<td>{{employee.officialEmail}}</td>
													<td>{{employee.mobileNo}}</td>
													<td><a ng-click="show(employee.resourceId);state.toggle();"
														href="${pageContext.request.contextPath}/downloadPaySlip?id=${employee.id}"
														id="{{$index}}" data-toggle="modal" data-target="#myModal"><span
															class="glyphicon glyphicon-edit"></span></a> &nbsp; &nbsp;</td>


												</tr>
											</tbody>
										</table>
										<!--Code for Displaying Employees List table starts here  -->

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

								</div>
								<!-- end widget content -->
							</div>
							<!-- end widget div -->
						</div>
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
					<h4 class="modal-title">Employee Information</h4>
				</div>
				<div class="modal-body">
					<div class=" main-content">
						<form ng-submit="onSubmit(theForm.$valid)" name="theForm"
							novalidate="novalidate">

							<div class="form-group row">

								<div class="col-lg-4">
									<label for="first_name">First Name</label> <input type="text"
										class="form-control" ng-model="formModel.firstName"
										id="first_name" required="required" ng-disabled="readOnly()">
								</div>
								<div class="col-lg-4">
									<label for="mid_name">Middle Name</label> <input type="text"
										class="form-control" ng-model="formModel.middleName"
										id="mid_name" required="required" ng-disabled="readOnly()">
								</div>
								<div class="col-lg-4">
									<label for="last_name">Last Name</label> <input type="text"
										class="form-control" ng-model="formModel.lastName"
										id="last_name" required="required" ng-disabled="readOnly()">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-3">
									<label for="emp_id">Employee ID <span
										class="glyphicon glyphicon-user"></span></label> <input type="text"
										class="form-control" ng-model="formModel.empId" id="emp_id"
										required="required" ng-disabled="readOnly()">
								</div>
								<div class="col-lg-3">

									<label for="mobile_number">Mobile Number <span
										class="glyphicon glyphicon-phone-alt"></span></label> <input
										type="text" class="form-control" ng-model="formModel.mobileNo"
										id="mobile_number" required="required"
										ng-disabled="readOnly()">
								</div>
								<div class="col-lg-3">
									<label for="alt_mob">Alternative Mobile Number <span
										class="glyphicon glyphicon-phone-alt"></span></label> <input
										type="text" class="form-control"
										ng-model="formModel.altMobileNo" id="alt_mob"
										required="required" ng-disabled="readOnly()">
								</div>
								<div class="col-lg-3">

									<label for="emr_cont">Emergency Contact Number <span
										class="glyphicon glyphicon-phone-alt"></span></label> <input
										type="text" class="form-control"
										ng-model="formModel.emgContactNo" id="emr_cont"
										required="required" ng-disabled="readOnly()">
								</div>

								<%-- 
								<form name="cardForm">
									<label translate>Email Address</label> <input name="email"
										type="email" ng-model="obj.email"
										ng-pattern="/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/" required>
									<div ng-messages="cardForm.email.$error">
										<div ng-message="pattern">Please enter a valid email
											address!</div>
									</div>
								</form> --%>
							</div>

							<div class="form-group row">

								<div class="col-lg-6">
									<label for="off_email">Email ID <span
										class="glyphicon glyphicon-envelope"></span></label> <input
										type="text" class="form-control"
										ng-model="formModel.officialEmail" id="off_email"
										required="required" ng-disabled="readOnly()">
								</div>
								<div class="col-lg-6">
									<label for="per_email">Personal Email ID <span
										class="glyphicon glyphicon-envelope"></span></label> <input
										type="text" class="form-control"
										ng-model="formModel.personalEmail" id="per_email"
										required="required" ng-disabled="readOnly()">
								</div>


							</div>
							<div class="form-group row">
								<div class="col-lg-6">

									<label for="curr_address">Current Address <span
										class="	glyphicon glyphicon-home"></span></label>
									<textarea class="form-control" name="curntAdress"
										ng-model="curntAdress" ng-disabled="readOnly()"></textarea>
								</div>
								<div class="col-lg-6">
									<label for="per_address">Permanant Address <span
										class="glyphicon glyphicon-home"></span></label>

									<textarea class="form-control" name="per_address"
										ng-model="formModel.prmtAddress" ng-disabled="readOnly()"
										ng-required="true""></textarea>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-lg-3">
									<label for="res_fb">Date of Joining <span
										class="glyphicon glyphicon-calendar"></span></label>
									<div class="date">
										<input type="text" class="form-control" name="date" id="doj"
											ng-disabled="readOnly()" ng-model="formModel.doj" />
									</div>
								</div>
								<div class="col-lg-3">
									<label for="res_fb">Date of Birth <span
										class="glyphicon glyphicon-calendar"></span></label>
									<div class="date">
										<input type="text" class="form-control" name="date" id="dob"
											ng-disabled="readOnly()" ng-model="formModel.dob" />
									</div>
								</div>
								<div class="col-lg-3">
									<label for="dept">Department</label> <select name="dept"
										id="dept" class="form-control" ng-disabled="readOnly()"
										ng-model="formModel.dept.deptId" path="Dept.deptId">
										<option disabled selected hidden value="">---Please
											Select---</option>

										<option ng-repeat="dept in deptList" ng-disabled="readOnly()"
											ng-selected="formModel.dept.deptId==dept.deptId "
											value="{{dept.deptId}}">{{dept.deptName}}</option>
									</select>
								</div>
								<div class="col-lg-3">
									<label for="division">Division</label> <select name="division"
										id="division" class="form-control" ng-disabled="readOnly()"
										ng-model="formModel.subDept.subDeptId"
										path="SubDept.subDeptId">
										<option disabled selected hidden value="">---Please
											Select---</option>

										<option ng-repeat="subDept in subDeptList"
											ng-disabled="readOnly()"
											ng-selected="formModel.subDept.subDeptId == subDept.subDeptId"
											value="{{subDept.subDeptId}}">{{subDept.subDeptName}}</option>
									</select>
									<!-- <select name="division" id="division" class="form-control" ng-model="formModel.division">
			<option value="">Please Choose</option>
			<option value="code1">Java</option>
			<option value="code2">Android</option>
			<option value="code2">Testing</option>
			
		</select>
					 -->
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-4">
									<label for="pro_wor_on">Projects Worked On</label> <input
										type="text" class="form-control"
										ng-model="formModel.projectsWorkedOn" id="pro_wor_on"
										required="required" ng-disabled="readOnly()">

								</div>

								<div class="col-lg-4">
									<label for="pro_scope">Project Scope</label> <input type="text"
										class="form-control" ng-model="formModel.projectScope"
										id="pro_scope" required="required" ng-disabled="readOnly()">

								</div>
								<div class="col-lg-4">
									<label for="visas">Visas</label> <input type="text"
										class="form-control" ng-model="formModel.visas" id="visas"
										required="required" ng-disabled="readOnly()">

								</div>
							</div>



							<!-- <div class="col-lg-3">
						<label for="dept">Department</label> <select name="dept" id="dept"
							class="form-control" ng-model="formModel.dept.deptId"
							path="Dept.deptId">
							<option disabled selected hidden>Please Choose</option>

							<option ng-repeat="dept in deptList" value="{{dept.deptId}}">
								{{dept.deptName}}</option>
						</select>
					</div> -->


							<br>

							<div class="form-group row">
								<div class="col-lg-4">
									<label for="tot_exp">Total Experience</label> <input
										type="text" class="form-control"
										ng-model="formModel.totYrsExp" id="tot_exp"
										required="required" ng-disabled="readOnly()">
								</div>

								<div class="col-lg-4">
									<label for="role">Role</label> <select name="role" id="role"
										class="form-control" ng-model="formModel.role"
										path="SubDept.subDeptId" ng-disabled="readOnly()">
										<option disabled selected hidden value="">---Please
											Select---</option>
										<option value="User">User</option>
										<option value="Team Lead">Team Lead</option>
										<option value="Manager">Manager</option>
										<option value="Admin">Admin</option>
										<option value="HR">HR</option>
										<option value="Super Admin">Super Admin</option>
									</select>

								</div>

								<!-- 	<div class="col-lg-4">
									<label for="designation">Designation</label> <select name="designation"
										id="designation" class="form-control"
										ng-model="formModel.designation" 
										ng-disabled="readOnly()">

										<option value="" disabled selected hidden>Please
											Choose</option>
										<option value="Tr_Telecom_Engineer">Tr Telecom
											Engineer</option>
										<option value="Jr_Telecom_Engineer">Jr Telecom
											Engineer</option>
										<option value="Telecom_Engineer">Telecom Engineer</option>

										<option value="Sr_Telecom_Engineer">Sr Telecom
											Engineerr</option>
										<option value="Asst_Team_Lead">Asst Team Lead</option>
										<option value="Team_Lead">Team Lead</option>
										<option value="Asst_Proj_Manager">Asst Proj Manager</option>
										<option value="Project_Manager">Project Manager</option>
										<option value="Technical_Manager">Technical Manager</option>
										<option value="Sr_Project_Manager">Sr Project Manager</option>
										<option value="Jr_Manager">Jr Manager</option>
										<option value="Process_Team_Leader">Process Team Leader</option>
										<option value="Program_Manager">Program Manager</option>
										<option value="CEO">CEO</option>
										<option value="COO">COO</option>
										<option value="AVP">AVP</option>
										<option value="HR">HR Manager</option>
									</select>

								</div>
 -->

								<div class="col-lg-4">
									<label for="designation">Designation</label> <input type="text"
										class="form-control" ng-model="formModel.designation"
										id="designation" required="required" ng-disabled="readOnly()">
								</div>
							</div>

							<!-- <div class="form-group row">
								<div class="col-lg-6">
									<button toggle-button active-text="YES" inactive-text="NO"
										ng-model="formModel.loginpermson"
										ng-init="formModel.loginpermson= 'NO'"
										ng-autocomplete="formModel.loginpermson"
										ng-disabled="readOnly()">
										<strong>Login permission :</strong>
									</button>

								</div>

								<div class="col-lg-6">
									<div align="right">
										<label for="butn"><strong>Reset Password :</strong></label> <a
											href="#" class="btn btn-primary" id="butn"
											onClick="window.location.reload()" role="button">Reset</a>
									</div>
								</div>

							</div> -->
							<!-- <div>
             <input type="checkbox" checked data-toggle="toggle" data-on="Ready" data-off="Not Ready" ng-change="changed()" data-onstyle="success" data-offstyle="danger" ng-model="formModel.active">

 <toggle ng-model="toggleValue" ng-change="changed()" on="Ready" off="Not Ready" onstyle="btn-success" offstyle="btn-danger"></toggle>
</div> -->
							<br>
							<!-- 	<div class="form-group row">
								<div class="col-lg-6">
									<fieldset data-ng-repeat="choice in choices">
										<label for="skills">Skill</label> <select
											ng-model="choice.skillName"
											ng-change="skill(choice.skillName)" ng-disabled="readOnly()">
											<option disabled selected hidden>Please Select</option>
											<option data-ng-repeat="skill in skillsList"
												value="{{skill.skillsId}}">{{skill.skillsName}}</option>

										</select> <label for="skills">Skill Scale </label> <select
											ng-model="choice.skillScale"
											ng-change="skill(choice.skillScale)" ng-disabled="readOnly()">
											<option>Please Choose</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
										<input type="text" ng-model="choice.name" name="" placeholder="Enter mobile number">
										<button class="remove" ng-show="$last" ng-disabled="readOnly()"
											ng-click="removeChoice()">-</button>
									</fieldset>
									<button class="addfields" ng-click="addNewChoice()" ng-disabled="readOnly()">Add
										fields</button>

								</div>

								<div class="col-lg-6">
									<fieldset data-ng-repeat="choice1 in choices1">
										<label for="per_level">Performance Level</label> <select
											ng-model="choice1.performanceLevelName"
											ng-change="per(choice1.performanceLevelName)" ng-disabled="readOnly()">
											<option disabled selected hidden>Please Select</option>
											<option data-ng-repeat="per in performanceList"
												value="{{per.performanceId}}">{{per.performanceLevelName}}</option>

										</select> <label for="per_scale">Performance Scale </label> <select
											ng-model="choice1.performanceScale"
											ng-change="per(choice1.performanceScale)" ng-disabled="readOnly()">
											<option>Please Choose</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>


										</select>
										<input type="text" ng-model="choice.name" name="" placeholder="Enter mobile number">
										<button class="remove" ng-show="$last"
											ng-click="removeChoice1()" ng-disabled="readOnly()">-</button>
									</fieldset>

									<button class="addfields" ng-click="addNewChoice1()"  ng-disabled="readOnly()">Add
										fields</button>

								</div>
							</div> 
							
							 -->

						</form>
					</div>

					<div class="form-group row">
						<div align="center">
							<button class="btn btn-primary btn-lg" type="submit"
								id="submitId" ng-click="addTask()"
								onClick="window.location.reload()" ng-disabled="readOnly()">Submit</button>
							<button type="button" class="btn btn-default btn-lg"
								data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		/*  code for hiding  */

		if (role == "Team Lead" || role == "Manager") {
			$('#addEmpId').hide();
		}

		/*$('#jobId').hide();
		$('#invoiceId').hide();	
		$('#employeeId').hide(); */

		/*end of code for hiding  */

		$(function() {
			$('#doj').datepicker({
				dateFormat : "dd-mm-yy"
			});
		});
		$(function() {
			$('#dob').datepicker({
				dateFormat : "dd-mm-yy"
			});
		});

		var myapp = angular.module('client', []);

		/* Pagination Filter Start */
		myapp.filter('startFrom', function() {
			return function(input, start) {
				start = +start; //parse to int
				return input.slice(start);
			}
		});
		/* Pagination Filter End */

		/* <div class="form-group row">
								<div class="col-lg-6">
									<button toggle-button active-text="YES" inactive-text="NO"
										ng-model="formModel.loginpermson" ng-init="formModel.loginpermson= 'NO'" ng-checked="YES">
										<strong>Login permission :</strong>
									</button>
									
								</div>
		 */

			   
		
		myapp
				.directive(
						'toggleButton',
						function() {
							return {
								require : 'ngModel',
								scope : {
									activeText : '@activeText',
									inactiveText : '@inactiveText',
									lightState : '=ngModel'
								},
								replace : true,
								transclude : true,
								template : '<div>'
										+ '<span ng-transclude></span> '
										+ '<button class="btn" ng-class="{\'btn-primary\': state.value}" ng-click="state.toggle()">{{activeText}}</button>'
										+ '<button class="btn" ng-class="{\'btn-primary\': !state.value}" ng-click="state.toggle()">{{inactiveText}}</button>'
										+ '</div>',
								link : function postLink(scope) {
						
									scope.state = {
										
										
										
										toggle : function() {
											alert("hiiiii");
											
											this.value = !this.value;
											scope.lightState = this.value ? scope.activeText
													: scope.inactiveText;
										}
									};
									
									
								}
							}
						})

		myapp
				.controller(
						'MinMaxCtrl',
						function($scope, $http, $filter) {

							$scope.data = [];

							$scope.readOnly = true;

							/* Sort */

							$scope.orderByField = '$index';
							$scope.reverseSort = false;

							/* Sort End */

							/* Pagination */

							$scope.currentPage = 0;
							$scope.pageSize = 10;
							$scope.global_search = '';
							$scope.getData = function() {
								return $filter('filter')($scope.resourcelist,
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
							$scope.initfun = function() {

								$scope.formModel.state = 'NO';

							};

							$scope.formModel = {};
							$scope.choice = {};
							$scope.choice1 = {};
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
											'${pageContext.request.contextPath}/skills')
									.then(function(response) {
										$scope.skillsList = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/dept')
									.then(function(response) {
										$scope.deptList = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/division')
									.then(function(response) {
										$scope.subDeptList = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/performance')
									.then(function(response) {
										$scope.performanceList = response.data;
									});
							$http
									.get(
											'${pageContext.request.contextPath}/employeeView')
									.then(function(response) {
										$scope.resourcelist = response.data;
									});

							$scope.addTask = function() {
								$scope.skillsjson = JSON
										.stringify($scope.choices);
								$scope.performancejson = JSON
										.stringify($scope.choices1);
								/* $scope.officialEmail = $scope.officialEmail+"";  */
								$scope.formModel.doj = $('#doj').val();
								$scope.formModel.dob = $('#dob').val();
								$scope.formModel.skillsList = $scope.choices;
								$scope.formModel.performanceList = $scope.choices1;
								$scope.employeejson = JSON
										.stringify($scope.formModel);
								$scope.address = $scope.curntAdress;
// 								alert($scope.address);
// 								alert($scope.employeejson);
								if ($scope.flag == 2) {

									$http.put(
											'${pageContext.request.contextPath}'
													+ '/resource/edit/' + '/'
													+ $scope.resource_id + '/'
													+ $scope.employeejson + '/'
													+ $scope.address).then(
											function(data) {
												console.log(data);
											});

								} else {
									$http.post(
											'${pageContext.request.contextPath}'
													+ '/employee/insert/'
													+ $scope.employeejson)
											.then(function(data) {
												console.log(data);
											});
								}

							};

							$scope.choices = [ {
								id : 'choice1'
							}, {
								id : 'choice2'
							} ];
							$scope.choices1 = [ {
								id : 'choicee1'
							}, {
								id : 'choicee2'
							} ];

							$scope.addNewChoice = function() {
								var newItemNo = $scope.choices.length + 1;
								$scope.choices.push({
									'id' : 'choice' + newItemNo
								});
							};

							$scope.removeChoice = function() {
								var lastItem = $scope.choices.length - 1;
								$scope.choices.splice(lastItem);
							};
							$scope.addNewChoice1 = function() {
								var newItemNo1 = $scope.choices1.length + 1;
								$scope.choices1.push({
									'id' : 'choicee' + newItemNo1
								});
							};

							$scope.removeChoice1 = function() {
								var lastItem1 = $scope.choices1.length - 1;
								$scope.choices1.splice(lastItem1);
							};

							$scope.flag = 1;
							var clientId;
							$scope.resource_id = 0;

							$scope.readOnly = function() {

								if (role == "Team Lead" || role == "Manager")
									return true;
								else
									return false;
							};

							$scope.show = function(id) {
								$scope.resource_id = id;
								$scope.selectedResourceId = id;
								$scope.flag = 2;
								
								$http.post(
										'${pageContext.request.contextPath}'
												+ '/resourceId/byEmployeeId/'
												+ id).then(function(response) {
									$scope.empEdit = response.data;
									$scope.getResourceListFunc();
									
								});

								/* for (var i = 0; i < $scope.resourcelist.length; i++) {
									if ($scope.resourcelist[i].resourceId == id) {
										$scope.formModel.first_name=$scope.resourcelist[i].firstName;

									}
								} */
							};

							
							
							$scope.getResourceListFunc = function() {

								$scope.formModel.firstName = $scope.empEdit.firstName;
								$scope.formModel.middleName = $scope.empEdit.middleName;
								$scope.formModel.lastName = $scope.empEdit.lastName;
								$scope.formModel.empId = $scope.empEdit.empId;
								$scope.formModel.officialEmail = $scope.empEdit.officialEmail;
								$scope.formModel.personalEmail = $scope.empEdit.personalEmail;
								$scope.formModel.mobileNo = $scope.empEdit.mobileNo;
								$scope.formModel.altMobileNo = $scope.empEdit.altMobileNo;
								$scope.formModel.emgContactNo = $scope.empEdit.emgContactNo;
								// 								$scope.formModel.curntAdress = $scope.empEdit.curntAdress;
								$scope.formModel.prmtAddress = $scope.empEdit.prmtAddress;
								$scope.formModel.projectsWorkedOn = $scope.empEdit.projectsWorkedOn;
								$scope.formModel.projectScope = $scope.empEdit.projectScope;
								$scope.formModel.visas = $scope.empEdit.visas;
								$scope.formModel.totYrsExp = $scope.empEdit.totYrsExp;
								$scope.formModel.designation = $scope.empEdit.designation;
								$scope.formModel.dept.deptId = $scope.empEdit.dept1;
								$scope.formModel.subDept.subDeptId = $scope.empEdit.subDept1;
								$scope.formModel.role = $scope.empEdit.role;

// 								alert($scope.empEdit.loginpermson);

								$scope.formModel.loginpermson = $scope.empEdit.loginpermson;

								if($scope.empEdit.loginpermson == 'NO'){
									$scope.lightState=$scope.inactiveText;
									state.value=false;
								}else if($scope.empEdit.loginpermson == 'YES'){
									$scope.lightState=$scope.activeText;	
									state.value=true;
								}else{
									state.value=true;
									
								}
																
								
								 
								
								
								$('#dob').val($scope.empEdit.dob);
								$('#doj').val($scope.empEdit.doj);
							};
							$scope.addFunction = function() {
								$scope.formModel = {};
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