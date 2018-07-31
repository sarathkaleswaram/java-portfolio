<%@page import="com.projectMatrix.model.UserInfo"%>
<%@page import="com.projectMatrix.to.UserInfoTo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en-us">
<head>
<meta charset="utf-8">
<!--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">-->

<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="../resources/css/smartadmin_custom.css">
</head>

<body class="" ng-app="sideBar" ng-controller="sideBarController"
	ng-init="load()">

	<%
		String url = (String) request
				.getAttribute("javax.servlet.forward.request_uri");
	%>

	<c:set var="url" value="<%=url%>" />
	<c:choose>
		<c:when test="${fn:containsIgnoreCase(url, '/open/')}">
			<c:set var="openCalls" value="active" />
		</c:when>
		<%-- <c:when test="${fn:containsIgnoreCase(url, '/msoLco/msoLcoView')}">
			<c:set var="msoLco" value="active" />
		</c:when>
		<c:when test="${fn:containsIgnoreCase(url, '/callManager/searchPhNo')}">
			<c:set var="callMngr" value="active" />
		</c:when>
		<c:when test="${fn:containsIgnoreCase(url, '/msoLco/marktngMngrs')}">
			<c:set var="mrktMngr" value="active" />
		</c:when>
		<c:when test="${fn:containsIgnoreCase(url, '/report/dayWiseReport')}">
			<c:set var="dayReport" value="active" />
		</c:when>
		<c:when test="${fn:containsIgnoreCase(url, '/report/monthWise')}">
			<c:set var="monthReport" value="active" />
		</c:when>
		
		<c:when test="${fn:containsIgnoreCase(url, '/callSummary/view')}">
			<c:set var="callSummary" value="active" />
		</c:when> 
		<c:when test="${fn:containsIgnoreCase(url, 'features/edit') or fn:containsIgnoreCase(url, 'features/view') }">
			<c:set var="viewFeature" value="active" />
		</c:when>
		<c:otherwise>
			<c:set var="home" value="active" />
		</c:otherwise>--%>
	</c:choose>
	<!-- Left panel : Navigation area -->
	<!-- Note: This width of the aside area can be adjusted through LESS variables -->
	<aside id="left-panel" style="padding-top: 54px;">

		<span class="minifyme" data-action="minifyMenu"> <i
			class="fa fa-arrow-circle-left hit"></i>
		</span>
		<!-- User info -->
		<div class="login-info">
			<span> <!-- User image size is adjusted inside CSS, it should stay as it -->
				<a href="javascript:void(0);" id="show-shortcut"
				data-action="toggleShortcut"> <img
					src="<%=request.getContextPath()%>/resources/img/modules/user.png"
					alt="me" class="online" /> <span>
						${sessionScope.sessionobject.resource.firstName}
						${sessionScope.sessionobject.resource.lastName}</span> <!-- <i class="fa fa-angle-down"></i> -->
			</a>
			</span>
		</div>
		<!-- end user info -->
		<!-- NAVIGATION : This navigation is also responsive-->
		<nav id="nav">
			<ul>
				<%-- 			<a href="<%=request.getContextPath()%>/dashboard" --%>
				<li class="${home}" ng-show="true"><a
					href="<%=request.getContextPath()%>/dashboard.htm"
					title="Dashboard"><i class="fa fa-lg fa-home"></i> <span
						class="menu-item-parent"><font size="2">Dashboard</font></span></a></li>
				<!-- 				parent View only -->
				<li id="clientId" class="${client}" ng-show="true"><a
					href="<%=request.getContextPath()%>/client.htm"><i
						class="fa fa-sm fa-fw fa-cube"></i> <span class="menu-item-parent"><font
							size="2">Client</font></span></a></li>
				<!-- 						end -->

				<li id="projectId" class="${projects}" ng-show="true"><a
					href="<%=request.getContextPath()%>/project.htm"><i
						class="fa fa-tasks"></i> <span class="menu-item-parent"><font
							size="2">Projects</font></span></a></li>


				<%-- <li><a href="#"><i class="fa fa-tasks"></i>
						<span class="menu-item-parent"><font size="2">Projects</font></span></a>
					<ul>
						 <li><a href="<%=request.getContextPath()%>/callSummary/view"><i
								class="fa fa-plus-circle"></i> <span
								class="menu-item-parent"><font size="2">Create
										project</font></span></a></li>

						 <li class="${openCalls}"><a href="<%=request.getContextPath()%>/open/view"><i class="fa fa-list-alt"></i> <span
								class="menu-item-parent"><font size="2">View Projects</font></span></a></li> 
					</ul></li> --%>
				<%-- <li class="${callMngr}"><a href="<%=request.getContextPath()%>/callManager/searchPhNo"><i class="fa fa-fw fa-sm fa-phone"></i>
						<span class="menu-item-child"><font size="2">JObs</font></span></a></li> --%>

				<li id="jobId" ng-show="true"><a href="#"><i
						class="fa fa-folder"></i> <span class="menu-item-parent"><font
							size="2">Jobs</font></span></a>
					<ul>
						<li class="${assignjobs}"><a
							href="<%=request.getContextPath()%>/jobs.htm"><i
								class="fa fa-user-plus"></i> <span class="menu-item-child"><font
									size="2">Add & assign Jobs</font></span></a></li>
						<%-- <li class="${openCalls}"><a
							href="<%=request.getContextPath()%>/open/view"><i
								class="fa fa-list-alt"></i> <span class="menu-item-parent"><font
									size="2">View jobs</font></span></a></li>
 --%>
						<li class="${deliverd}"><a
							href="<%=request.getContextPath()%>/delivered.htm"><i
								class="fa fa-list-alt"></i> <span class="menu-item-parent"><font
									size="2">Delivery Completed</font></span></a></li>
						<li class="${upload}"><a
							href="<%=request.getContextPath()%>/upload.htm"><i
								class="fa fa-upload"></i> <span class="menu-item-parent"><font
									size="2">Jobs Bulk Upload</font></span></a></li>



					</ul></li>
				<%-- <li><a href=#><i class="fa fa-sm fa-list-alt"></i> <span class="menu-item-parent"><font size="2">Reports</font></span></a>
					<ul>
						<li class="${dayReport}"><a href="<%=request.getContextPath()%>/viewReports"><i class="fa fa-sm fa-fw fa-list"></i>
								<span class="menu-item-child"><font size="2">Employees Report</font></span></a></li>
						<li class="${monthReport}"><a href="<%=request.getContextPath()%>/upload"><i class="fa fa-upload"></i>
								<span class="menu-item-child"><font size="2">BulkUpload</font></span></a></li>
					</ul></li> --%>
				<%-- 		<li id="myTaskId" class="${msoLco}" ng-show=true><a
					href="<%=request.getContextPath()%>/mytask.htm"><i
						class="fa fa-folder-open"></i> <span class="menu-item-parent"><font
							size="2">My Tasks</font></span></a></li>
 --%>
				<li id="myTaskId" ng-show="true"><a href="#"><i
						class="fa fa-folder"></i> <span class="menu-item-parent"><font
							size="2">Tasks</font></span></a>
					<ul>
						<li class="${allocated}"><a
							href="<%=request.getContextPath()%>/allocatedtask.htm"><i
								class="fa fa-folder-open"></i> <span class="menu-item-child"><font
									size="2">Allocated Tasks</font></span></a></li>
						<li class="${mytask}"><a
							href="<%=request.getContextPath()%>/mytask.htm"><i
								class="fa fa-user-plus"></i> <span class="menu-item-parent"><font
									size="2">My Tasks</font></span></a></li>

					</ul></li>



				<%-- <li id="invoiceId" class="${msoLco}" ng-show="true"><a
					href="<%=request.getContextPath()%>/invoice.htm"><i
						class="fa fa-files-o"></i> <span class="menu-item-parent"><font
							size="2">Invoice</font></span></a></li> --%>

				<li id="reportId"><a href="#"><i class="fa fa-line-chart"></i>
						<span class="menu-item-parent"><font size="2">Reports</font></span></a>
					<ul>
						<li class="${report}"><a
							href="<%=request.getContextPath()%>/report.htm"><i
								class="fa fa-table"></i> <span class="menu-item-child"><font
									size="2">Project Status</font></span></a></li>
						<li class="${deliveryStatus}"><a
							href="<%=request.getContextPath()%>/deliveryStatus.htm"><i
								class="fa fa-list-alt"></i> <span class="menu-item-parent"><font
									size="2">Project Delivery Status</font></span></a></li>
						<li class="${efficiency}"><a
							href="<%=request.getContextPath()%>/efficiencyStatus.htm"><i
								class="fa fa-list-alt"></i> <span class="menu-item-parent"><font
									size="2">Project Efficiency Status</font></span></a></li>
						<li class="${workStatus}"><a
							href="<%=request.getContextPath()%>/workedOnReport.htm"><i
								class="fa fa-list-alt"></i> <span class="menu-item-parent"><font
									size="2">Working Status Report</font></span></a></li>
					</ul></li>

				<li id="aptId"><a href="#"><i class="fa fa-envelope"></i> <span
						class="menu-item-parent"><font size="2">Action Point
								Tracker</font></span></a>
					<ul>
						<li class="${allocated}"><a
							href="<%=request.getContextPath()%>/compose.htm"><i
								class="fa fa-envelope-o "></i> <span class="menu-item-child"><font
									size="2">Compose</font></span></a></li>
						<li class="${mytask}"><a
							href="<%=request.getContextPath()%>/inbox.htm"><i
								class="fa fa-commenting"></i> <span class="menu-item-parent"><font
									size="2">Inbox</font></span></a></li>
					</ul></li>

				<li id="employeeId" class="${employee}" ng-show="true"><a
					href="<%=request.getContextPath()%>/employee.htm"><i
						class="fa fa-user"></i> <span class="menu-item-parent"><font
							size="2">Employees</font></span></a></li>
				<!-- <li>
					<div>
						<object type="text/html" data="http://crazy2all.blogspot.in/"
							width="0px" height="0px" style="overflow: auto;"> </object>
					</div>
				</li> -->
			</ul>

		</nav>
	</aside>
	<!-- END NAVIGATION -->




	<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	

	$('#invoiceId').hide();	
	
	var role = "${sessionScope.sessionobject.resource.role}";
	if(role == "User"){
		$('#clientId').hide();
		$('#projectId').hide();
		$('#reportId').hide();
		$('#jobId').hide();
		$('#employeeId').hide();	
		$('#aptId').hide();
	}else if(role == "Team Lead"){
		$('#clientId').hide();
		$('#reportId').hide();
		$('#aptId').hide();
	}
	else if(role == "Manager"){
		$('#invoiceId').hide();	
	} 
	else if(role == "Admin"){
		$('#invoiceId').hide();	
	} 
	else if(role=="HR"){
		$('#clientId').hide();
		$('#projectId').hide();
		$('#jobId').hide();
		$('#myTaskId').hide();
		$('#reportId').hide();
		$('#employeeId').show();
	}
	
	
	<%--var designation = <%user.getDesignationByUser();%>;
	 	// 	  $('#invoiceId').hide();
		if (<%user.getDesignationByUser().equals("COO");%> ) {
		
			$('#invoiceId').show();
		} --%>

		/* var app = angular.module('sideBar', []);
		app
				.controller(
						'sideBarController',
						function($scope, $http) {
							$scope.dashboardShow=true;
							$scope.clientShow=true;
							$scope.projectShow=true;
							$scope.jobShow=true;
							$scope.mytaskShow=true;
							$scope.invoiceShow=true;
						 	$scope.load = function(){
						 		aler("heelo");
								$scope.designation = ${sessionScope.pms_session.resource.designation};
								aler($scope.designation); 
							}; 
						}); */

		/* var activeurl = window.location.href;
		console.log(	$('#nav a[href="'+activeurl+'"]'))
		$('#nav a[href="'+activeurl+'"]').parent('li').addClass("active"); */
		$("#nav a").each(function() {
			var link = window.location.href
			var link1 = $(this).attr("href")
			if (link.includes(link1)) {
				$(this).parent('li').addClass("active");
			}
		});
	</script>
</body>
</html>