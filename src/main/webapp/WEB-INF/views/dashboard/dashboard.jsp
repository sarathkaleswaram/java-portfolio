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

<title>Dashboard</title>
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
<!-- charts js -->

<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>



<script
	src="${pageContext.request.contextPath}/resources/js/pieChart.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script
	src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet"
	href="https://www.amcharts.com/lib/3/plugins/export/export.css"
	type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>




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
	width: 40%;
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
	width: 12%;
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

#piechartdiv {

	width: 110%;
	height: 500px;
	padding: 0px;
	float: left;
}



#chartdiv {
	width: 50%;
	height: 500px;
}
/* #button {
  position: absolute;
  top: 50px;
  right: 20px;
  font-size: 15px;
  padding: 10px;
} */
/* 
.amcharts-export-menu-top-right {
	top: 10px;
	right: 0;
}
 */
 #piechartdiv {
	float: left;
} 


.chartwrapper {
width:100%;
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
				<div align="center">
					<h1>Centillion Networks Pvt. Ltd.</h1>
					<p>
						<strong>Project Management System</strong>
					</p>
				</div>


				<div class="form-group row">
			
				<div class="chartwrapper" >
				
				<article class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				
			<div id="piechartdiv"></div>
			
</article>
</div>
					<br> <br>

					<div id="chartdiv"></div>

					<div id="project_status">



						<!-- NEW WIDGET START -->
						<article class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken"
								id="wid-id-10" data-widget-editbutton="false">
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i>
									</span>
									<h2>Project Status</h2>
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
															<label for="cli_pm">Global Search</label><input
																type="text" class="form-control"
																ng-model="global_search" placeholder="Search...">
														</div>
														<div id="fourth">
															<label for="cli_pm ">Page Size</label> <select
																ng-model="pageSize" id="pageSize" class="form-control"
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
															No<span ng-show="orderByField == '$index'"><span
																ng-show="!reverseSort"> ^</span><span
																ng-show="reverseSort"> v</span></span>
													</a></th>
													<th><a href="#"
														ng-click="orderByField='projectName'; reverseSort = !reverseSort">Project
															Names<span ng-show="orderByField == 'projectName'"><span
																ng-show="!reverseSort"> ^</span><span
																ng-show="reverseSort"> v</span></span>
													</a></th>
													<th><a href="#"
														ng-click="orderByField='noOfJobs'; reverseSort = !reverseSort">No
															of Jobs<span ng-show="orderByField == 'noOfJobs'"><span
																ng-show="!reverseSort"> ^</span><span
																ng-show="reverseSort"> v</span></span>
													</a></th>
													<th><a href="#"
														ng-click="orderByField='remainingHours'; reverseSort = !reverseSort">Work
															in Hand/Hours<span
															ng-show="orderByField == 'remainingHours'"><span
																ng-show="!reverseSort"> ^</span><span
																ng-show="reverseSort"> v</span></span>
													</a></th>
													<th><a href="#"
														ng-click="orderByField='requiredMenDays'; reverseSort = !reverseSort">Work
															in Hand/Man days<span
															ng-show="orderByField == 'requiredMenDays'"><span
																ng-show="!reverseSort"> ^</span><span
																ng-show="reverseSort"> v</span></span>
													</a></th>
												</tr>
												<tbody>
													<tr
														ng-repeat="projects in projectDashboard | filter: global_search | startFrom:currentPage*pageSize | limitTo:pageSize | orderBy:orderByField:reverseSort">
														<td style="text-align: center;">{{ ($index + 1) +
															(currentPage) * pageSize}}</td>
														<td>{{projects.projectName}}</td>
														<td>{{projects.noOfJobs}}</td>
														<td>{{projects.remainingHours}}</td>
														<td>{{projects.requiredMenDays}}</td>
													</tr>
													<tr>
														<td></td>
														<td><b>Projects Total:</b></td>
														<td><b>{{sumNoOfJobs}}</b></td>
														<td><b>{{sumRemainingHours | number:1}}</b></td>
														<td><b>{{sumManDays | number:1}}</b></td>
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
											<br>
											<!-- Pagination Next Previous Buttons ends here -->
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

				</div>

			</section>
			<!-- end widget grid --> 

		</div>
		<!-- END MAIN CONTENT -->

	</div>
	<!-- END MAIN PANEL -->

	<!-- angular js script -->
	<script>
		var role = "${sessionScope.sessionobject.resource.role}";
		$('#project_status').hide();
		$('#chartdiv').show();
		if (role == "Super Admin" || role == "Admin" || role == "Manager") {
			$('#project_status').show();
			$('#chartdiv').hide();
		}
		var app = angular.module('jobs', []);

		app
				.controller(
						'JobController',
						function($scope, $http, $filter) {
							$http
									.get(
											'${pageContext.request.contextPath}/projectDashboard')
									.then(
											function(response) {
												$scope.projectDashboard = response.data;
												$scope.calSum();
											});

							$scope.sumNoOfJobs = 0;
							$scope.sumRemainingHours = 0;
							$scope.sumManDays = 0;

							/* Sort */

							$scope.orderByField = '$index';
							$scope.reverseSort = false;

							/* Sort End */

							/* Pagination */

							$scope.currentPage = 0;
							$scope.pageSize = 10;
							$scope.global_search = '';
							$scope.getData = function() {
								return $filter('filter')(
										$scope.projectDashboard,
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

							$scope.calSum = function() {
								for (var i = 0; i < $scope.projectDashboard.length; i++) {
									$scope.sumNoOfJobs += $scope.projectDashboard[i].noOfJobs;
									$scope.sumRemainingHours += $scope.projectDashboard[i].remainingHours;
									$scope.sumManDays += $scope.projectDashboard[i].requiredMenDays;
								}
							};
							AmCharts
									.addInitHandler(
											function(chart) {
												// check if there are graphs with autoColor: true set
												for (var i = 0; i < chart.graphs.length; i++) {
													var graph = chart.graphs[i];
													if (graph.autoColor !== true)
														continue;
													var colorKey = "autoColor-"
															+ i;
													graph.lineColorField = colorKey;
													graph.fillColorsField = colorKey;
													for (var x = 0; x < chart.dataProvider.length; x++) {
														var color = chart.colors[x]
														chart.dataProvider[x][colorKey] = color;
													}
												}

											}, [ "serial" ]);

							var charts = function() {
								var chart = AmCharts
										.makeChart(
												"piechartdiv",
												{
													"type" : "pie",
													"theme" : "light",
													"titles" : [ {
														"text" : "",
														"size" : 16
													} ],
													"dataProvider" : $scope.projectDashboard,
													"valueField" : "remainingHours",
													"titleField" : "projectName",
													"startEffect" : "elastic",
													"startDuration" : 2,
													"labelRadius" : 15,
													"innerRadius" : "50%",
													"depth3D" : 10,
													"balloonText" : "[[title]]<br><span style='font-size:14px'><b>[[value]] Hours</b> ([[percents]]%)</span>",
													"angle" : 15,
													"export" : {
														"enabled" : false
													}
												});
							};
							setTimeout(charts, 600);

						});

		/* Filter starts here */
		app.filter('startFrom', function() {
			return function(input, start) {
				start = +start; //parse to int
				return input.slice(start);
			}
		});
		/* Filter ends here */
	</script>


	<script>
		
	</script>



	<script type="text/javascript">
		var chart = AmCharts.makeChart("chartdiv", {
			"type" : "serial",
			"theme" : "light",
			"marginRight" : 70,
			"titles" : [ {
				"text" : "Jobs in Various Levels",
				"size" : 16
			} ],
			"dataProvider" : [ {
				"country" : "YTS",
				"visits" : 3025,
				"color" : "#FF0F00"
			}, {
				"country" : "Production",
				"visits" : 1882,
				"color" : "#FF6600"
			}, {
				"country" : "QC",
				"visits" : 1809,
				"color" : "#FF9E01"
			}, {
				"country" : "QA",
				"visits" : 1322,
				"color" : "#FCD202"
			}, {
				"country" : "Feedback",
				"visits" : 1122,
				"color" : "#F8FF01"
			}, {
				"country" : "Return",
				"visits" : 1114,
				"color" : "#B0DE09"
			}, {
				"country" : "Query",
				"visits" : 984,
				"color" : "#04D215"
			}, {
				"country" : "Delivered",
				"visits" : 711,
				"color" : "#0D8ECF"
			} ],
			"valueAxes" : [ {
				"axisAlpha" : 0,
				"position" : "left",
				"title" : "Jobs"
			} ],
			"startDuration" : 1,
			"graphs" : [ {
				"balloonText" : "<b>[[category]]: [[value]]</b>",
				"fillColorsField" : "color",
				"fillAlphas" : 0.9,
				"lineAlpha" : 0.2,
				"type" : "column",
				"valueField" : "visits"
			} ],
			"chartCursor" : {
				"categoryBalloonEnabled" : false,
				"cursorAlpha" : 0,
				"zoomable" : false
			},
			"categoryField" : "country",
			"categoryAxis" : {
				"gridPosition" : "start",
				"labelRotation" : 45
			},

			"export" : {
				"enabled" : false
			}

		});
		
		
		/* function resize() {
			  var w = Math.random() * 600 + 100;
			  var h = Math.random() * 800 + 100;
			  document.getElementById('piechartdiv').style.width = w + 'px';
			  document.getElementById('piechartdiv').style.height = h + 'px';
			  chart.invalidateSize();
			}
		 */
		
		
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