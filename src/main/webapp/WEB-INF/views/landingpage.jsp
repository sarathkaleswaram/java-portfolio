<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Meta tags -->
<title>Centillion Networks</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/logos/cnplLogo.png"
	alt="ProjectMatrix" type="image/png" />

<meta name="keywords"
	content="Exclusive Business a Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/landingpage/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/landingpage/easy-responsive-tabs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/landingpage/chocolat.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/landingpage/font-awesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/landingpage/style.css">

<!-- scripts -->
<script
	src="${pageContext.request.contextPath}/resources/js/centlandingpage/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/centlandingpage/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/centlandingpage/easyResponsiveTabs.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/centlandingpage/numscroller-1.0.js"></script>

<script type="text/javascript" src="resources/js/jquery.chocolat.js"></script>
<!-- google fonts -->
<link href="//fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Raleway:400,500,600,700"
	rel="stylesheet">

<style>
#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 10px;
	opacity:0.5;
}

</style>

</head>
<body>
	<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
	<!-- Navigation -->
	<div class="w3-start">
		<div class="container nav1">
			<a> <span class="fa fa-volume-control-phone" aria-hidden="true">
			</span>+91 (40) 4220 0027
			</a> <a href="mailto:abcd@yoursite.com"><span
				class="fa fa-envelope-o" aria-hidden="true"></span>info@centillionnetworks.com</a>
		</div>
		<div class="navbar navbar-inverse navbar-static-top w3ls-navbar">
			<div class="container brand1">
				<a href="#" class="navbar-brand w3-logo"><span class="br"><span
						class="big">C</span>ENTILLION </span><span class="bb"><span
						class="big">N</span>ETWORKS</span></a>

				<button class="navbar-toggle" data-toggle="collapse"
					data-target=".navHeaderCollapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<div class="collapse navbar-collapse navHeaderCollapse">
					<ul class="nav navbar-nav navbar-right w3ls-nav">
						<li class="w3ls-menu"><a class="scroll" href="#">Home</a></li>
						<li><a class="scroll" href="#about">About</a></li>
						<li><a class="scroll" href="#service">Services</a></li>
						<li><a class="scroll" href="#galley">Gallery</a></li>
						<li><a class="scroll" href="#clients">Clients</a></li>
						<li><a class="scroll" href="#contact">Contact</a></li>
						<li><a href="<%=request.getContextPath()%>/login">Login</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //Navigation -->
	<!-- Banner -->
	<div class="c">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner">

				<div class="item active">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/engg1.jpeg"
						alt="Los Angeles" style="width: 100%;">
					<!-- <div class="carousel-caption">
						<h1>Vast experience in the Business Industry</h1>
						<form action="/" method="post" class="w3ls-mail">
							<input type="email" name="email" placeholder="Enter Your E-mail Address" required>
							<a href="#"><input type="submit" value="Get In"></a>
						</form>
					</div> -->
				</div>

				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/robotics1.jpeg"
						alt="Chicago" style="width: 100%;">
					<!-- 	<div class="carousel-caption">
						<h3>Lorem Ipsum Create Your Big</h3>
						<p>Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
					</div> -->
				</div>

				<div class="item">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/softwarwe1.jpeg"
						alt="New York" style="width: 100%;">
					<!-- <div class="carousel-caption">
						<h3>Lorem Ipsum Create Your Big New York</h3>
						<p>Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
					</div> -->
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="fa fa-chevron-left"></span> <span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span class="fa fa-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- //Banner -->
	<!-- WELCOME SECTION -->
	<div class="agileits-welcome" id="about">
		<div class="container w3ls w3-welcome">
			<div class="w3-text">
				<h3>
					<span class="w3ag">~~~~~</span> About Us <span class="w3ag">~~~~~</span>
				</h3>
				<p>
					<b>Centillion Networks</b> is a leading Engineering and
					Construction company, specialized in Telecom and Utility domains.
					Our proven ability to deliver innovative and cutting-edge solutions
					is backed by the domain experts. Telecom and Utility sectors are
					rapidly growing and revamping their existing infrastructure
					projects to build next generation communications networks (NGN) to
					offer high bandwidth to their customers. Centillion has aligned its
					products and services to help service providers, handle simple to
					complex fibre optic infrastructure projects efficiently and
					economically.. </br> Our successful 4P-2Ts strategy (People, Process,
					Product, Performance, Technology and Tools) has made us a reliable
					communications partner for Telecom and Utilities industries. We
					operate from two global delivery centres - US and India. The
					company has to its credit, implementation of a number of turnkey
					projects for various power utility companies, most economically,
					timely and efficiently.
				</p>
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">Know More</button>
				<!-- Modal -->



				<!-- bootstrap-pop-up -->
				<div class="modal video-modal fade" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="myModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								Exclusive Business
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<section>
								<div class="modal-body">
									<%-- <img src="${pageContext.request.contextPath}/resources/img/landingpage/21.jpg" alt=" " class="img-responsive" /> --%>
									<p>The Company has executed projects for the Power Sector,
										involving establishing OPGW / ADSS Optic Fiber based
										communication network along the 400 KV, 220 KV, 132 KV lines
										even in the most hazardous and inaccessible terrain.</p>
								</div>
							</section>
						</div>
					</div>
				</div>
				<!-- //bootstrap-pop-up -->
			</div>
			<div class="w3-image">
				<h3>Best in Industry</h3>
				<div class="bestimg">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/office1.jpg"
						alt="Best image">
				</div>
				<p>Majestic Commercial, Office No 717, JNTU Road, KPHB Colony
					(Phase-1), Kukatpally, Hyderabad - 500072 India</p>
				<a href="#mymap" class="scroll">Locate Us <span
					class="fa fa-map-marker" aria-hidden="true"></span></a>
			</div>
		</div>
	</div>
	<!-- //WELCOME SECTION -->

	<!-- Services columns -->
	<div class="container w3ls-service" id="service">
		<h3 class="center">Services WE OFFER</h3>
		<p class="center">You can get Quality Services</p>
		<div class="row-agile">
			<div class="col-md-4 col-sm-4 col-xs-6 part1">
				<img class="img-responsive" alt="image"
					src="${pageContext.request.contextPath}/resources/img/landingpage/engineering.jpeg">
				<h2>Engineering</h2>
				<p>Its a great to say that, We are now one of the leading
					organizations working on different Telecom and GIS technologies
					such as Spatialnet, Small World, Autocad & Lode data.</p>
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-secondary details"
					data-toggle="modal" data-target="#myModal1">View details
					&raquo;</button>
				<!-- Modal -->
				<!-- bootstrap-pop-up -->
				<div class="modal video-modal fade" id="myModal1" tabindex="-1"
					role="dialog" aria-labelledby="myModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								Engineering
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<section>
								<div class="modal-body">
									<%-- <img
										src="${pageContext.request.contextPath}/resources/img/landingpage/1.jpg"
										alt=" " class="resources/img-responsive" /> --%>
									<p>It is a long established fact that a reader will be
										distracted by the readable content of a page when looking at
										its layout. The point of using Lorem Ipsum is that it has a
										more-or-less normal distribution of letters, as opposed to
										using 'Content here, content here', making it look like
										readable English.</p>
								</div>
							</section>
						</div>
					</div>
				</div>
				<!-- //bootstrap-pop-up -->
			</div>

			<div class="col-md-4 col-sm-4 col-xs-6 part1">
				<img class="img-responsive" alt="image"
					src="${pageContext.request.contextPath}/resources/img/landingpage/software.jpeg">
				<h2>SoftWare</h2>
				<p>Currently We are dealing on with Techologies such as Andriod
					App Development and AEM( Adobe Enterprise Management)</p>
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-secondary details"
					data-toggle="modal" data-target="#myModal2">View details
					&raquo;</button>
				<!-- Modal -->
				<!-- bootstrap-pop-up -->
				<div class="modal video-modal fade" id="myModal2" tabindex="-1"
					role="dialog" aria-labelledby="myModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								SoftWare
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<section>
								<div class="modal-body">
									<img src="resources/images/software.jpeg" alt=" "
										class="img-responsive" />
									<p>Engineering Services End to End Consulting Services
										Desktop based feasibility study services FTTx, SONET/SDH,
										DWDM, Network Architecture & Topologies Designs Telecom
										Equipment Room (TER) Designs and Drawings System development,
										Testing & Implementation Quality and Acceptance testing
										Service Configuration, Provisioning and fulfilment Network
										Migration Support System / Technology interoperability and
										comparability testing Fiber based Ethernet enabled services.</p>
								</div>
							</section>
						</div>
					</div>
				</div>
				<!-- //bootstrap-pop-up -->
			</div>
			<div class="col-md-4 col-sm-4 col-xs-6 part1 part3">
				<img class="img-responsive" alt="image"
					src="${pageContext.request.contextPath}/resources/img/landingpage/robotics.jpeg">
				<h2>Robotics</h2>
				<p>Currently we are working on Robots using cutting-edge
					technology such as Drones which will be usable at different
					locations suchh as installing an high tension lines in Heights</p>
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-secondary details"
					data-toggle="modal" data-target="#myModal3">View details
					&raquo;</button>
				<!-- Modal -->
				<!-- bootstrap-pop-up -->
				<div class="modal video-modal fade" id="myModal3" tabindex="-1"
					role="dialog" aria-labelledby="myModal">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								Robotics
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<section>
								<div class="modal-body">
									<!-- <img src="resources/images/office4.jpg" alt=" "
										class="img-responsive" /> -->
									<p>Telecom Equipment Room (TER) Designs and Drawings System
										development, Testing & Implementation Quality and Acceptance
										testing Service Configuration, Provisioning and fulfilment
										Network Migration Support System / Technology interoperability
										and comparability testing Fiber based Ethernet enabled
										services.</p>
								</div>
							</section>
						</div>
					</div>
				</div>
				<!-- //bootstrap-pop-up -->
			</div>
		</div>
	</div>
	<!-- //Services columns -->

	<!-- Gallery chocolat -->
	<div class="container w3ls-galley" id="galley">
		<h3 class="center">Gallery</h3>
		<div class="chocolat-parent" id="parentHorizontalTab"
			data-chocolat-title="Exclusive Business">
			<ul class="resp-tabs-list hor_1">
				<li><a href="#tab1" class="tabs"><span>All</span></a></li>
				<li><a href="#tab2" class="tabs"><span>Business</span></a></li>
				<li><a href="#tab3" class="tabs"><span>Clients</span></a></li>
				<li><a href="#tab4" class="tabs"><span>Development</span></a></li>
			</ul>
			<div class="resp-tabs-container hor_1">
				<!-- Tab-1 -->

				<div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all1.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all1.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all77.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all77.jpg" />
						</a>
					</div>

					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all55.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all55.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all4.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all4.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all5.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all5.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all6.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all6.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all7.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all7.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/all8.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/all8.JPG" />
						</a>
					</div>

				</div>
				<!-- //tab-1 -->
				<!-- tab-2 -->
				<div>

					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/b1.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/b1.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/b2.jpeg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/b2.jpeg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/9.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/9.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/11.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/11.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/b3.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/b3.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/b5.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/b5.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/7.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/7.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/b4.jpeg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/b4.jpeg" />
						</a>
					</div>
				</div>
				<!-- //tab-2 -->
				<!-- tab-3 -->
				<div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client1.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client1.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client2.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client2.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client3.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client3.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client4.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client4.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client5.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client5.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client6.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client6.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client7.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client7.JPG" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image"
							href="resources/img/landingpage/client8.JPG"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/client8.JPG" />
						</a>
					</div>
				</div>
				<!-- //tab-3 -->
				<!-- tab-4 -->
				<div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/d66.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/d66.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/22.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/22.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/d33.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/d33.jpg" />
						</a>
					</div>

					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/27.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/27.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/d24.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/d24.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/7.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/7.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/14.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/14.jpg" />
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6 taba">
						<a class="chocolat-image" href="resources/img/landingpage/d55.jpg"
							title="Exclusive Business"> <img class="img-responsive"
							alt="image"
							src="${pageContext.request.contextPath}/resources/img/landingpage/d55.jpg" />
						</a>
					</div>
				</div>
				<!-- //tab-4 -->
			</div>
			<!-- container end-->
		</div>
	</div>
	<!-- //Gallery -->

	<!-- counter -->
	<div class="num" id="feedback">

		<!-- <div class="counter agilecount">
			<h3 class="center">Our Stats</h3>
			<div class="counter1">
				<h3>Know About Our Business</h3><br>
				<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod.</p>
				<br>
				<p>&raquo; lorem ipsum dolor sit amit comit.</p>
				<p>&raquo; lorem ipsum dolor sit amit comit.</p>
				<p>&raquo; lorem ipsum dolor sit amit comit.</p>
				<div class="c1">
					<span class='numscroller' data-min='1' data-max='500' data-delay='5' data-increment='3'>500</span>
					<h4>Projects</h4>
				</div>
				<div class="c1">
					<span class='numscroller' data-min='1' data-max='1200' data-delay='5' data-increment='3'>1200</span>
					<h4><span class="rhide">Happy </span>Clients</h4>
				</div>
				<div class="c1">
					<span class='numscroller' data-min='1' data-max='1300' data-delay='5' data-increment='3'>1300</span>
					<h4>Customers</h4>
				</div>
			</div>
		</div> -->
	</div>
	<!-- //counter -->

	<!-- Our Team -->
	<div class="agile-team">
		<div class="container w3ls-team">
			<h3 class="center">Our Team</h3>
			<div class="col-md-4 col-sm-4 col-xs-4 team">
				<img
					src="${pageContext.request.contextPath}/resources/img/landingpage/image1.jpg"
					class="img-responsive" alt="Nicolas">
				<h4>VENKAT CHUNDI</h4>
				<p>CEO</p>
				<a href="#"><span class="fa fa-facebook-square"
					aria-hidden="true"></span></a> <a href="#"><span
					class="fa fa-google-plus-square" aria-hidden="true"></span></a> <a
					href="#"><span class="fa fa-twitter-square" aria-hidden="true"></span></a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 team">
				<img
					src="${pageContext.request.contextPath}/resources/img/landingpage/image1.jpg"
					class="img-responsive" alt="Harrison">
				<h4>LAXMINARAYANA GUDIPATI</h4>
				<p>COO</p>
				<a href="#"><span class="fa fa-facebook-square"
					aria-hidden="true"></span></a> <a href="#"><span
					class="fa fa-google-plus-square" aria-hidden="true"></span></a> <a
					href="#"><span class="fa fa-twitter-square" aria-hidden="true"></span></a>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4 team">
				<img
					src="${pageContext.request.contextPath}/resources/img/landingpage/image1.jpg"
					class="img-responsive" alt="Kevin">
				<h4>SUDHAKAR KAMISETTI</h4>
				<p>AVP</p>
				<a href="#"><span class="fa fa-facebook-square"
					aria-hidden="true"></span></a> <a href="#"><span
					class="fa fa-google-plus-square" aria-hidden="true"></span></a> <a
					href="#"><span class="fa fa-twitter-square" aria-hidden="true"></span></a>
			</div>
		</div>
	</div>
	<!-- //Our Team -->
	<!-- Service Grids -->
	<div class="w3-service">
		<h3 class="center">Our Clients</h3>
		<div class="container w3ls-servicegrid" id="clients">

			<div class="text">
				<h3>Main Business Clients we Have</h3>
				<p>We recognise publishing as one of the best ways to reach
					existing and potential customers and have extended our services to
					third parties by providing marketing solutions. With partnerships
					in more than a dozen countries, we can offer translation services
					and international distribution as an integral part of our service.</p>
			</div>
			<div class="grids">
				<div class="gridbox">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/TrueNet.jpeg"
						class="img-responsive">

				</div>
				<div class="gridbox">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/comcast.jpeg"
						class="img-responsive">

				</div>
				<div class="gridbox">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/geoData.jpeg"
						class="img-responsive">

				</div>
				<div class="gridbox">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/s1.jpeg"
						class="img-responsive">

				</div>
				<div class="gridbox">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/lt1.jpeg"
						class="img-responsive">

				</div>

				<div class="gridbox">
					<img
						src="${pageContext.request.contextPath}/resources/img/landingpage/emco.jpeg"
						class="img-responsive">
				</div>
			</div>
		</div>
	</div>
	<!-- //Service Grids -->
	<!-- map section -->
	<div class="mymap" id="mymap">
		<iframe
			src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=3C,+Manjeera+Majestic+Commercial,+Opp.+JNTU,+KPHB,+Hyderabad+-+500+072&amp;aq=&amp;sll=17.441676,78.45221&amp;sspn=0.012057,0.021136&amp;ie=UTF8&amp;hq=&amp;hnear=Manjeera+Majestic+Commercial,+Ameerpet,+Hyderabad,+Ranga+Reddy,+Andhra+Pradesh&amp;t=m&amp;ll=17.453426,78.440924&amp;spn=0.039302,0.054932&amp;z=12&amp;iwloc=A&amp;output=embed"
			allowfullscreen></iframe>
	</div>
	<!-- //map section -->
	<!-- cotact section -->
	<div class="w3ls-contact" id="contact">
		<div class="container agile-contact ">
			<div class="info col-md-4 col-sm-4 col-xs-6">
				<h4>Contact Information</h4>
				<ul>
					<li><span class="fa fa-map-marker" aria-hidden="true"></span>Manjeera
						Majestic Commercial, Office No 717, JNTU Road, KPHB Colony
						(Phase-1), Kukatpally, Hyderabad - 500072 India</li>
					<li><span class="fa fa-phone" aria-hidden="true"></span>+91
						(40) 4220 0027</li>
					<!-- <li><a href="mailto:abcd@yoursite.com"><span
							class="fa fa-envelope-o" aria-hidden="true"></span>
							info@centillionnetworks.com</a></li>
					<li><a href="#"><span class="fa fa-facebook-square"
							aria-hidden="true"></span></a> <a href="#"><span
							class="fa fa-google-plus-square" aria-hidden="true"></span></a> <a
						href="#"><span class="fa fa-twitter-square" aria-hidden="true"></span></a>
						<a href="#"><span class="fa fa-pinterest-square"
							aria-hidden="true"></span></a> <a href="#"><span
							class="fa fa-linkedin-square" aria-hidden="true"></span></a></li> -->
				</ul>
			</div>
			<div class="links col-md-4 col-sm-4 col-xs-6">
				<h4>Quick Links</h4>
				<ul>
					<!-- <li><a class="scroll" href="#"><span
							class="fa fa-long-arrow-right" aria-hidden="true"></span> HOME</a></li> -->
					<!-- <li><a class="scroll" href="#clients"><span
							class="fa fa-long-arrow-right" aria-hidden="true"></span>
							RESOURCES</a></li> -->
					<li><a class="scroll" href="#service"><span
							class="fa fa-long-arrow-right" aria-hidden="true"></span>
							SERVICES</a></li>
					<li><a class="scroll" href="#about"><span
							class="fa fa-long-arrow-right" aria-hidden="true"></span> ABOUT
							US</a></li>
					<li><a class="scroll" href="#contact"><span
							class="fa fa-long-arrow-right" aria-hidden="true"></span> CONTACT</a></li>
				</ul>
			</div>
			<div class="form col-md-4 col-sm-4 col-xs-12">
				<h4>Contact Us</h4>
				<form action="/" method="post">
					<input type="text" name="name" placeholder="NAME" required><br>
					<input type="email" name="email" placeholder="E-MAIL" required><br>
					<input type="text" name="phone" placeholder="PHONE"><br>
					<textarea placeholder="MESSAGE" name="message" rows="3" cols="30"></textarea>
					<br> <input type="SUBMIT"><br>
				</form>
			</div>
		</div>
	</div>

	<!-- //cotact section -->
	<!-- footer -->
	<div class="footer">
		<hr>
		<p>&copy 2017 All rights reserved | CentillionNetworks Pvt Ltd.</p>
	</div>

	<!-- //footer -->
	<!-- Script chocolat -->
	<script>
		$(document).ready(function() {
			$('.chocolat-parent').Chocolat();
		});
		
		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {scrollFunction()};

		function scrollFunction() {
		    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		        document.getElementById("myBtn").style.display = "block";
		    } else {
		        document.getElementById("myBtn").style.display = "none";
		    }
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
		    document.body.scrollTop = 0;
		    document.documentElement.scrollTop = 0;
		}
		
	</script>
	<!-- //scrolling script -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/centlandingpage/SmoothScroll.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/centlandingpage/move-top.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/centlandingpage/easing.js"></script>
	<!-- here stars scrolling icon -->

	<!-- //Script chocolat -->
	<!-- script responsive tabs -->
	<script type="text/javascript">
		$(document).ready(function() {

			$('#parentHorizontalTab').easyResponsiveTabs({
				type : 'default', //Types: default, vertical, accordion
				width : 'auto', //auto or any width like 600px
				fit : true, // 100% fit in a container
				closed : 'accordion', // Start closed if in accordion view
				tabidentify : 'hor_1', // The tab groups identifier
				activate : function(event) { // Callback function if tab is switched
					var $tab = $(this);
					var $info = $('#nested-tabInfo');
					var $name = $('span', $info);

					$name.text($tab.text());

					$info.show();
				}
			});

		});
	</script>
	<!-- //script responsive tabs -->
	<!-- scrolling script -->
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->

	<script>
(function (factory) {
    if(typeof module === "object" && typeof module.exports === "object") {
        module.exports = factory(require("jquery"), window, document);
    } else {
        factory(jQuery, window, document);
    }
}(function($, window, document, undefined) {
    var calls = 0;

    function Chocolat(element, settings) {
        var that = this;

        this.settings  = settings;
        this.elems     = {};
        this.element   = element;

        this._cssClasses = [
            'chocolat-open',
            'chocolat-in-container',
            'chocolat-cover',
            'chocolat-zoomable',
            'chocolat-zoomed'
        ];

        if (!this.settings.setTitle && element.data('chocolat-title')) {
            this.settings.setTitle = element.data('chocolat-title');
        }

        this.element.find(this.settings.imageSelector).each(function () {
            that.settings.images.push({
                title  : $(this).attr('title'),
                src    : $(this).attr(that.settings.imageSource),
                height : false,
                width  : false
            });
        });

        this.element.find(this.settings.imageSelector).each(function (i) {
            $(this).off('click.chocolat').on('click.chocolat', function(e){
                that.init(i);
                e.preventDefault();
            });
        });

        return this;
    }

    $.extend(Chocolat.prototype, {

        init : function(i) {
            if (!this.settings.initialized) {
                this.setDomContainer();
                this.markup();
                this.events();
                this.settings.lastImage   = this.settings.images.length - 1;
                this.settings.initialized = true;
            }

            this.settings.afterInitialize.call(this);

            return this.load(i);
        },

        preload : function(i) {
            var def = $.Deferred();

            if (typeof this.settings.images[i] === 'undefined') {
                return;
            }
            var imgLoader    = new Image();
            imgLoader.onload = function() { def.resolve(imgLoader); };
            imgLoader.src    = this.settings.images[i].src;

            return def;
        },

        load : function(i) {
            var that = this;
            if (this.settings.fullScreen) {
                this.openFullScreen();
            }

            if (this.settings.currentImage === i) {
                return;
            }

            this.elems.overlay.fadeIn(this.settings.duration);
            this.elems.wrapper.fadeIn(this.settings.duration);
            this.elems.domContainer.addClass('chocolat-open');

            this.settings.timer = setTimeout(function(){
                if (typeof that.elems != 'undefined') {
                    $.proxy(that.elems.loader.fadeIn(), that);
                }
            }, this.settings.duration);

            var deferred = this.preload(i)
                .then(function (imgLoader) {
                    return that.place(i, imgLoader);
                })
                .then(function (imgLoader) {
                    return that.appear(i);
                })
                .then(function (imgLoader) {
                    that.zoomable();
                    that.settings.afterImageLoad.call(that);
                });

            var nextIndex = i + 1;
            if (typeof this.settings.images[nextIndex] != 'undefined') {
                this.preload(nextIndex);
            }

            return deferred;
        },

        place : function(i, imgLoader) {
            var that = this;
            var fitting;

            this.settings.currentImage = i;
            this.description();
            this.pagination();
            this.arrows();

            this.storeImgSize(imgLoader, i);
            fitting = this.fit(i, that.elems.wrapper);

            return this.center(
                fitting.width,
                fitting.height,
                fitting.left,
                fitting.top,
                0
            );
        },

        center : function(width, height, left, top, duration) {

            return this.elems.content
                .css('overflow', 'visible')
                .animate({
                    'width'  :width,
                    'height' :height,
                    'left'   :left,
                    'top'    :top
                }, duration)
                .promise();
        },

        appear : function(i) {
            var that = this;
            clearTimeout(this.settings.timer);

            this.elems.loader.stop().fadeOut(300, function() {
                that.elems.img
                    .attr('src', that.settings.images[i].src);
            });
        },

        fit : function(i, container) {
            var height;
            var width;

            var imgHeight        = this.settings.images[i].height;
            var imgWidth         = this.settings.images[i].width;
            var holderHeight     = $(container).height();
            var holderWidth      = $(container).width();
            var holderOutMarginH = this.getOutMarginH();
            var holderOutMarginW = this.getOutMarginW();

            var holderGlobalWidth  = holderWidth-holderOutMarginW;
            var holderGlobalHeight = holderHeight-holderOutMarginH;
            var holderGlobalRatio  = (holderGlobalHeight / holderGlobalWidth);
            var holderRatio        = (holderHeight / holderWidth);
            var imgRatio           = (imgHeight / imgWidth);

            if (this.settings.imageSize == 'cover') {
                if (imgRatio < holderRatio) {
                    height = holderHeight;
                    width = height / imgRatio;
                }
                else {
                    width = holderWidth;
                    height = width * imgRatio;
                }
            }
            else if (this.settings.imageSize == 'native') {
                height = imgHeight;
                width = imgWidth;
            }
            else {
                if (imgRatio > holderGlobalRatio) {
                    height = holderGlobalHeight;
                    width = height / imgRatio;
                }
                else {
                    width = holderGlobalWidth;
                    height = width * imgRatio;
                }
                if (this.settings.imageSize === 'default' && (width >= imgWidth || height >= imgHeight)) {
                    width = imgWidth;
                    height = imgHeight;
                }
            }

            return {
                'height' : height,
                'width'  : width,
                'top'    : (holderHeight - height)/2,
                'left'   : (holderWidth - width)/2
            };
        },

        change : function(signe) {
            this.zoomOut(0);
            this.zoomable();

            var requestedImage = this.settings.currentImage + parseInt(signe);
            if (requestedImage > this.settings.lastImage) {
                if (this.settings.loop) {
                    return this.load(0);
                }
            }
            else if (requestedImage < 0) {
                if (this.settings.loop) {
                    return this.load(this.settings.lastImage);
                }
            }
            else {
                return this.load(requestedImage);
            }
        },

        arrows: function() {
            if (this.settings.loop) {
                $([this.elems.left[0],this.elems.right[0]])
                    .addClass('active');
            }
            else if (this.settings.linkImages) {
                // right
                if (this.settings.currentImage == this.settings.lastImage) {
                    this.elems.right.removeClass('active');
                }
                else {
                    this.elems.right.addClass('active');
                }
                // left
                if (this.settings.currentImage === 0) {
                    this.elems.left.removeClass('active');
                }
                else {
                    this.elems.left.addClass('active');
                }
            }
            else {
                $([this.elems.left[0],this.elems.right[0]])
                    .removeClass('active');
            }
        },

        description : function() {
            var that = this;
            this.elems.description
                .html(that.settings.images[that.settings.currentImage].title);
        },

        pagination : function() {
            var that      = this;
            var last      = this.settings.lastImage + 1;
            var position  = this.settings.currentImage + 1;

            this.elems.pagination
                .html(position + ' ' + that.settings.separator2 + last);
        },

        storeImgSize : function(img, i) {
            if (typeof img === 'undefined') {
                return;
            }
            if (!this.settings.images[i].height || !this.settings.images[i].width) {
                this.settings.images[i].height = img.height;
                this.settings.images[i].width  = img.width;
            }
        },

        close : function() {

            if (this.settings.fullscreenOpen) {
                this.exitFullScreen();
                return;
            }

            var els = [
                this.elems.overlay[0],
                this.elems.loader[0],
                this.elems.wrapper[0]
            ];
            var that = this;
            var def = $.when($(els).fadeOut(200)).done(function () {
                that.elems.domContainer.removeClass('chocolat-open');
            });
            this.settings.currentImage = false;

            return def;
        },

        destroy : function() {
            this.element.removeData();
            this.element.find(this.settings.imageSelector).off('click.chocolat');

            if (!this.settings.initialized) {
                return;
            }
            if (this.settings.fullscreenOpen) {
                this.exitFullScreen();
            }
            this.settings.currentImage = false;
            this.settings.initialized = false;
            this.elems.domContainer.removeClass(this._cssClasses.join(' '));
            this.elems.wrapper.remove();
        },

        getOutMarginW : function() {
            var left  = this.elems.left.outerWidth(true);
            var right = this.elems.right.outerWidth(true);
            return left + right;
        },

        getOutMarginH : function() {
            return this.elems.top.outerHeight(true) + this.elems.bottom.outerHeight(true);
        },

        markup : function() {
            this.elems.domContainer.addClass('chocolat-open ' + this.settings.className);
            if (this.settings.imageSize == 'cover') {
                this.elems.domContainer.addClass('chocolat-cover');
            }
            if (this.settings.container !== window) {
                this.elems.domContainer.addClass('chocolat-in-container');
            }

            this.elems.wrapper = $('<div/>', {
                'class' : 'chocolat-wrapper',
                'id' : 'chocolat-content-' + this.settings.setIndex
            }).appendTo(this.elems.domContainer);

            this.elems.overlay = $('<div/>', {
                'class' : 'chocolat-overlay'
            }).appendTo(this.elems.wrapper);

            this.elems.loader = $('<div/>', {
                'class' : 'chocolat-loader'
            }).appendTo(this.elems.wrapper);

            this.elems.content = $('<div/>', {
                'class' : 'chocolat-content',
            }).appendTo(this.elems.wrapper);

            this.elems.img = $('<img/>', {
                'class' : 'chocolat-img',
                'src' : ''
            }).appendTo(this.elems.content);

            this.elems.top = $('<div/>', {
                'class' : 'chocolat-top'
            }).appendTo(this.elems.wrapper);

            this.elems.left = $('<div/>', {
                'class' : 'chocolat-left'
            }).appendTo(this.elems.wrapper);

            this.elems.right = $('<div/>', {
                'class' : 'chocolat-right'
            }).appendTo(this.elems.wrapper);

            this.elems.bottom = $('<div/>', {
                'class' : 'chocolat-bottom'
            }).appendTo(this.elems.wrapper);

            this.elems.close = $('<span/>', {
                'class' : 'chocolat-close'
            }).appendTo(this.elems.top);

            this.elems.fullscreen = $('<span/>', {
                'class' : 'chocolat-fullscreen'
            }).appendTo(this.elems.bottom);

            this.elems.description = $('<span/>', {
                'class' : 'chocolat-description'
            }).appendTo(this.elems.bottom);

            this.elems.pagination = $('<span/>', {
                'class' : 'chocolat-pagination'
            }).appendTo(this.elems.bottom);

            this.elems.setTitle = $('<span/>', {
                'class' : 'chocolat-set-title',
                'html' : this.settings.setTitle
            }).appendTo(this.elems.bottom);

            this.settings.afterMarkup.call(this);
        },

        openFullScreen : function() {
            var wrapper = this.elems.wrapper[0];

            if (wrapper.requestFullscreen) {
                this.settings.fullscreenOpen = true;
                wrapper.requestFullscreen();
            }
            else if (wrapper.mozRequestFullScreen) {
                this.settings.fullscreenOpen = true;
                wrapper.mozRequestFullScreen();
            }
            else if (wrapper.webkitRequestFullscreen) {
                this.settings.fullscreenOpen = true;
                wrapper.webkitRequestFullscreen();
            }
            else if (wrapper.msRequestFullscreen) {
                wrapper.msRequestFullscreen();
                this.settings.fullscreenOpen = true;
            }
            else {
                this.settings.fullscreenOpen = false;
            }
        },

        exitFullScreen : function() {
            if (document.exitFullscreen) {
                document.exitFullscreen();
                this.settings.fullscreenOpen = false;
            }
            else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
                this.settings.fullscreenOpen = false;
            }
            else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
                this.settings.fullscreenOpen = false;
            }
            else {
                this.settings.fullscreenOpen = true;
            }
        },

        events : function() {
            var that = this;

            $(document).off('keydown.chocolat').on('keydown.chocolat', function(e) {
                if (that.settings.initialized) {
                    if (e.keyCode == 37) {
                        that.change(-1);
                    }
                    else if (e.keyCode == 39) {
                        that.change(1);
                    }
                    else if (e.keyCode == 27) {
                        that.close();
                    }
                }
            });
            // this.elems.wrapper.find('.chocolat-img')
            //     .off('click.chocolat')
            //     .on('click.chocolat', function(e) {
            //         var currentImage = that.settings.images[that.settings.currentImage];
            //         if(currentImage.width > $(that.elems.wrapper).width() || currentImage.height > $(that.elems.wrapper).height() ){
            //             that.toggleZoom(e);
            //         }
            // });

            this.elems.wrapper.find('.chocolat-right')
                .off('click.chocolat')
                .on('click.chocolat', function() {
                    that.change(+1);
            });

            this.elems.wrapper.find('.chocolat-left')
                .off('click.chocolat')
                .on('click.chocolat', function() {
                    return that.change(-1);
            });

            $([this.elems.overlay[0], this.elems.close[0]])
                .off('click.chocolat')
                .on('click.chocolat', function() {
                    return that.close();
            });

            this.elems.fullscreen
                .off('click.chocolat')
                .on('click.chocolat', function() {
                    if (that.settings.fullscreenOpen) {
                        that.exitFullScreen();
                        return;
                    }

                    that.openFullScreen();
            });

            if (that.settings.backgroundClose) {
                this.elems.overlay
                    .off('click.chocolat')
                    .on('click.chocolat', function() {
                        return that.close();
                });
            }
            this.elems.wrapper
                .off('click.chocolat')
                .on('click.chocolat', function(e) {
                    return that.zoomOut(e);
            });

            this.elems.wrapper.find('.chocolat-img')
                .off('click.chocolat')
                .on('click.chocolat', function(e) {
                    if (that.settings.initialZoomState === null && that.elems.domContainer.hasClass('chocolat-zoomable')) {
                        e.stopPropagation();
                        return that.zoomIn(e);
                    }
            });

            this.elems.wrapper.mousemove(function( e ) {
                if (that.settings.initialZoomState === null) {
                    return;
                }
                if (that.elems.img.is(':animated')) {
                    return;
                }

                var pos = $(this).offset();
                var height = $(this).height();
                var width = $(this).width();

                var currentImage = that.settings.images[that.settings.currentImage];
                var imgWidth = currentImage.width;
                var imgHeight = currentImage.height;

                var coord = [e.pageX - width/2 - pos.left, e.pageY - height/2 - pos.top];

                var mvtX = 0;
                if (imgWidth > width) {
                    var paddingX = that.settings.zoomedPaddingX(imgWidth, width);
                    mvtX = coord[0] / (width / 2);
                    mvtX = ((imgWidth - width)/ 2  + paddingX) * mvtX;
                }

                var mvtY = 0;
                if (imgHeight > height) {
                    var paddingY = that.settings.zoomedPaddingY(imgHeight, height);
                    mvtY = coord[1] / (height / 2);
                    mvtY = ((imgHeight - height) / 2  + paddingY) * mvtY;
                }

                var animation = {
                    'margin-left': - mvtX + 'px',
                    'margin-top': - mvtY + 'px'
                };
                if (typeof e.duration !== 'undefined') {
                    $(that.elems.img).stop(false, true).animate(animation, e.duration);
                }
                else {
                    $(that.elems.img).stop(false, true).css(animation);
                }

            });
            $(window).on('resize', function() {
                if (!that.settings.initialized) {
                    return;
                }
                that.debounce(50, function() {
                    var fitting = that.fit(that.settings.currentImage, that.elems.wrapper);
                    that.center(fitting.width, fitting.height, fitting.left, fitting.top, 0);
                    that.zoomable();
                });
            });
        },

        zoomable : function () {
            var currentImage = this.settings.images[this.settings.currentImage];
            var wrapperWidth = this.elems.wrapper.width();
            var wrapperHeight = this.elems.wrapper.height();

            var isImageZoomable = ( this.settings.enableZoom && ( currentImage.width > wrapperWidth || currentImage.height > wrapperHeight)) ? true : false;
            var isImageStretched = this.elems.img.width() > currentImage.width || this.elems.img.height() > currentImage.height;


            if (isImageZoomable && !isImageStretched) {
                this.elems.domContainer.addClass('chocolat-zoomable');
            }
            else {
                this.elems.domContainer.removeClass('chocolat-zoomable');
            }
        },

        zoomIn : function (e) {
            this.settings.initialZoomState = this.settings.imageSize;
            this.settings.imageSize = 'native';

            var event = $.Event('mousemove');
            event.pageX = e.pageX;
            event.pageY = e.pageY;
            event.duration = this.settings.duration;
            this.elems.wrapper.trigger(event);

            this.elems.domContainer.addClass('chocolat-zoomed');
            var fitting = this.fit(this.settings.currentImage, this.elems.wrapper);
            return this.center(fitting.width, fitting.height, fitting.left, fitting.top, this.settings.duration);
        },

        zoomOut : function (e, duration) {
            if (this.settings.initialZoomState === null) {
                return;
            }
            duration = duration || this.settings.duration;

            this.settings.imageSize = this.settings.initialZoomState;
            this.settings.initialZoomState = null;
            this.elems.img.animate({'margin': 0}, duration);

            this.elems.domContainer.removeClass('chocolat-zoomed');
            var fitting = this.fit(this.settings.currentImage, this.elems.wrapper);
            return this.center(fitting.width, fitting.height, fitting.left, fitting.top, duration);
        },

        setDomContainer : function() {
            // if container == window
            // domContainer = body
            if ( this.settings.container === window) {
                this.elems.domContainer = $('body');
            }
            else {
                this.elems.domContainer = $(this.settings.container);
            }
        },

        debounce: function(duration, callback) {
            clearTimeout(this.settings.timerDebounce);
            this.settings.timerDebounce = setTimeout(function() {
                callback();
            }, duration);
        },

        api: function() {
            var that = this;
            return {
                open : function(i){
                    i = parseInt(i) || 0;
                    return that.init(i);
                },

                close : function(){
                    return that.close();
                },

                next : function(){
                    return that.change(1);
                },

                prev : function(){
                    return that.change(-1);
                },

                goto : function(i){ // open alias
                    return that.open(i);
                },
                current : function(){
                    return that.settings.currentImage;
                },

                place : function(){
                    return that.place(that.settings.currentImage, that.settings.duration);
                },

                destroy : function(){
                    return that.destroy();
                },

                set : function(property, value){
                    that.settings[property] = value;
                    return value;
                },

                get : function(property){
                    return that.settings[property];
                },

                getElem : function(name){
                    return that.elems[name];
                },
            };
        }
    });

    var defaults = {
        container         : window, // window or jquery object or jquery selector, or element
        imageSelector     : '.chocolat-image',
        className         : '',
        imageSize         : 'default', // 'default', 'contain', 'cover' or 'native'
        initialZoomState  : null,
        fullScreen        : false,
        loop              : false,
        linkImages        : true,
        duration          : 300,
        setTitle          : '',
        separator2        : '/',
        setIndex          : 0,
        firstImage        : 0,
        lastImage         : false,
        currentImage      : false,
        initialized       : false,
        timer             : false,
        timerDebounce     : false,
        images            : [],
        enableZoom        : true,
        imageSource       : "href",
        afterInitialize   : function () {},
        afterMarkup       : function () {},
        afterImageLoad    : function () {},
        zoomedPaddingX    : function (canvasWidth, imgWidth) { return 0; },
        zoomedPaddingY    : function (canvasHeight, imgHeight) { return 0; },
    };

    $.fn.Chocolat = function (options) {
        return this.each(function() {

            calls++;
            var settings = $.extend(true, {}, defaults, options, {setIndex:calls} );

            if (!$.data(this, 'chocolat')) {
                $.data(this, 'chocolat',
                    new Chocolat($(this), settings)
                );
            }
        });
    };
}));

</script>




</body>
</html>
