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

<title>Upload</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
	alt="ProjectMatrix" type="image/png" />
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

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
				<li>Jobs</li>
				<li>BulkUpload</li>
			</ol>
		</div>
		<!-- END RIBBON -->
		<c:choose>
			<c:when test="${not empty errorMessage}">
				<div class="alert alert-danger">${errorMessage}</div>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<c:if test="${not empty success}">
			<div class="alert alert-success">
				<a class="close" data-dismiss="alert">×</a> ${success}
			</div>
		</c:if>

<form:form commandName="jobsUploadForm" class="form-horizontal"
			enctype="multipart/form-data" method="POST">

			<form:errors path="*" class="alert alert-danger" element="div" />
		
			&nbsp;&nbsp;&nbsp;&nbsp;<legend>File inputs</legend>
				<div class="form-group">
					<form:label class="col-md-2 control-label" path="jobsFile">File input</form:label>
					<div class="col-md-10">
						<form:input type="file" path="jobsFile" class="btn btn-default"
							id="exampleInputFile1" accept=".xls,.xlsx" />
						<p class="help-block">Please Use only instructed excel
							template to upload.</p>
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm btn-primary" id="done">Upload</button> 
					</div>
				</div>
		</form:form>
		
	</div>
</body>
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






</html>