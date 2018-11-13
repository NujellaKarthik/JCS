<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta content="initial-scale=1, shrink-to-fit=no, width=device-width"
	name="viewport">

<!-- CSS -->
<!-- Add Material font (Roboto) and Material icon as needed -->
<!-- Add Material font (Roboto) and Material icon as needed -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i|Roboto+Mono:300,400,700|Roboto+Slab:300,400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"
	integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
	crossorigin="" />
<script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"
	integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA=="
	crossorigin=""></script>
<!-- Add Material CSS, replace Bootstrap CSS -->
<link href="css/material.css" rel="stylesheet">

<link href="css/toolbar.css" rel="stylesheet">
<link href="css/score-cards.css" rel="stylesheet">
<link href="css/maptest.css" rel="stylesheet">
</head>

<body>

	<%
		List<JioScoresCircle> circleListDetailsD = (ArrayList<JioScoresCircle>) request.getAttribute("circleListDetailsD");
	    JioScoresCircle circleDetailsDPost = (JioScoresCircle) request.getAttribute("circleDetailsDPost");
	%>
	<style>
body {
	background-color: #E1E7EA;
	padding-top: 104px;
	overflow-x: hidden;
}

.main-bg {
	background-color: #E1E7EA;
}

.main-navbar {
	height: 42px;
	min-height: 32px;
}

.navbar-brand {
	font-size: 0.9rem;
}

.bg-best {
	background-color: #2196F3 !important;
}

.bg-good {
	background-color: #5FB464 !important;
}

.bg-average {
	background-color: #F98200 !important;
}

.bg-bad {
	background-color: #FF0000 !important;
}

.funnel-score {
	height: 4px;
	width: 70px;
}

.shrink {
	-webkit-transform: scale(0.5);
	-moz-transform: scale(0.5);
	-ms-transform: scale(0.5);
	transform: scale(0.5);
	opacity: 0.3;
}

.sm-rect {
	width: 22px;
	height: 14px;
	border-radius: 3px;
	margin-right: 10px;
	margin-bottom: 10px;
	margin-top: 4px;
}

#sidebar {
	background-color: #E1E1E1;
	border-left: 1px solid #CCC;
	border-top: 1px solid #CCC;
	-webkit-box-shadow: -5px 5px 21px -8px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: -5px 5px 21px -8px rgba(0, 0, 0, 0.75);
	box-shadow: -5px 5px 21px -8px rgba(0, 0, 0, 0.75);
	width: 50%
}

#mapid {
	height: 100%;
}
</style>

	<div class=" navbar-fixed-top">
		<nav
			class="navbar main-navbar navbar-expand-lg navbar-dark bg-primary d-flex">
			<a class="navbar-brand" href="#"> <img
				src="images/logos/jio_white_text.png" width="24" height="24"
				class="d-inline-block align-top mr-2 rounded" alt=""> COVERAGE
				PLATFORM
			</a>
			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link disabled" href="#">|</a>
					</li>
					<li class="nav-item active"><a class="nav-link" href="#">Jio
							Composite Score<span class="sr-only">(current)</span>
					</a></li>
				</ul>
			</div>
			<img src="images/buttons/user.png" width="24" height="24"
				class="d-inline-block align-top  ml-auto " alt="">
		</nav>


		<div class="d-flex align-items-stretch toolbar">
			<div class="mr-auto p-2 bd-highlight">
			

				<form action="JCSServlet" method="post">
				    <%if (circleListDetailsD!= null) { %>
					<div class="form-group">
						<label for="formGeographySelect">Geography</label> 
						<select class="form-control" id="formCircleSelect" name="myfield">
						<option>Select</option>
							<% for (JioScoresCircle i : circleListDetailsD) { %>
							<option><%=i.getCircle()%>
							</option>
							<% } %>
						</select>
					</div>
					<%} %>
					<% if  (circleListDetailsD == null) { 
					 String cir= (request.getAttribute("getCircle").toString()); %>
					
					<div class="form-group">
						<label for="formGeographySelect">Geography</label> 
						<select class="form-control" id="formCircleSelect" name="myfield">
							<option>
							<%=cir%>
							</option>
						</select>
					</div>
					<%} %>
					<div class="form-group">
						<label for="formCityNameSelect">CityName</label> <select
							class="form-control" id="formCityNameSelect">
							<option>Select</option>
							<option>Thane</option>
							<option>Bandra</option>
						</select>
					</div>
					<div class="form-group">
						<label for="formJCSelect">JC</label> <select class="form-control"
							id="formJCSelect">
							<option>Select</option>
							<option>Mum-0027</option>
							<option>Mum-0012</option>
						</select>
					</div>
					<div>
					<br/>
					<input type="submit" value="Submit" >
					</div>	
				</form>

			</div>
			<div class="p-2 bd-highlight">
				<div class="p-2 flex-fill bd-highlight">
					<button type="button" class="btn btn-toggle btn-circle btn-lg"
						data-toggle="button" aria-pressed="false" autocomplete="off">
						<i class="fa fa-university"></i>
					</button>
					<button type="button" class="btn btn-toggle btn-circle btn-lg"
						data-toggle="button" aria-pressed="false" autocomplete="off">
						<i class="fa fa-sliders-h"></i>
					</button>
					<button type="button" class="btn btn-toggle btn-circle btn-lg"
						data-toggle="button" data-target="#collapseExample"
						aria-expanded="false" aria-controls="collapseExample"
						id="maptoggle">
						<i class="fa fa-map"></i>
					</button>
					<img src="images/toolbar-sep.png"> <i
						class="fa fa-question-circle toolbar-icon"></i> <i
						class="fa fa-share-alt toolbar-icon"></i> <i
						class="fa fa-print toolbar-icon"></i> <i
						class="fa fa-download toolbar-icon"></i>
				</div>
			</div>
		</div>
	</div>

	<div class="wrapper">
		<!-- Page Content Holder -->
		<div id="content">
			<div class="container">

				<div class="d-flex justify-content-center">

					<div class="score-card-component-container">
						<div class="score-card-component bg-average bg-img-coverage">
							<h5 class="score-card-title">Coverage Score</h5>
							<span class="score-card-timeline-top">Future</span> <span
								class="score-card-timeline-bottom">Past Trends</span> <i
								class="fa fa-arrow-alt-circle-down score-card-indicator"
								alt="Decrease"></i> <img src="images/current-score-pointer.png"
								alt="Current Score" class="score-card-pointer">
								<%if (circleDetailsDPost == null) { %>
								<h1 class="score-card-score">88%</h1>
								<%} else { %>
							<h1 class="score-card-score"><%  out.println( request.getAttribute("getCoveragePercent") ) ; %></h1>
							<%} %>
							<h3 class="score-card-percent">%</h3>
						</div>
					</div>

					<div class="score-card-component-container">
						<div class="score-card-component bg-good bg-img-capacity">
							<h5 class="score-card-title">Capacity Score</h5>
							<span class="score-card-timeline-top">Future</span> <span
								class="score-card-timeline-bottom">Past Trends</span> <i
								class="fa fa-arrow-alt-circle-up score-card-indicator"
								alt="Increase"></i> <img src="images/current-score-pointer.png"
								alt="Current Score" class="score-card-pointer">
								<%if (circleDetailsDPost == null) { %>
								<h1 class="score-card-score">91%</h1>
								<%} else { %>
							<h1 class="score-card-score"><%  out.println( request.getAttribute("getCapacityPercent")) ; %></h1>
							<%} %>
							<h3 class="score-card-percent">%</h3>
						</div>
					</div>

					<div class="score-card-component-container">
						<div class="score-card-component bg-best bg-img-qos">
							<h5 class="score-card-title">QoS Score</h5>
							<span class="score-card-timeline-top">Future</span> <span
								class="score-card-timeline-bottom">Past Trends</span> <i
								class="fa fa-arrow-alt-circle-down score-card-indicator"
								alt="Decrease"></i> <img src="images/current-score-pointer.png"
								alt="Current Score" class="score-card-pointer">
								<%if (circleDetailsDPost == null) { %>
								<h1 class="score-card-score">97%</h1>
								<%} else { %>
							<h1 class="score-card-score"><%  out.println(request.getAttribute("getQosPercent")) ; %></h1>
							<%} %>
							<h3 class="score-card-percent">%</h3>
						</div>
					</div>

				</div>
				<div class="d-flex justify-content-center">
					<img src="images/funnel/graphic_funnel.png" alt="">

				</div>
				<div class="d-flex justify-content-center">
					<div class="funnel-score bg-average"></div>
					<div class="funnel-score bg-good"></div>
					<div class="funnel-score bg-best"></div>
				</div>

				<div class="d-flex justify-content-center align-items-center">

					<button type="button" class="btn btn-circle btn-toggle btn-lg"
						style="left: 100px; z-index: 99;">
						<i class="fa fa-arrow-left"></i>
					</button>

					<div class="score-card-composite-container shrink">

						<div class="score-card-composite bg-good ">
							<span class="score-card-rank">5</span>
							<h5 class="score-card-title">Jio Composite Score</h5>
							<span class="score-card-timeline-current">Current</span> <span
								class="score-card-timeline-change-title">Change</span> <span
								class="score-card-timeline-change">0%</span> <i
								class="fa fa-arrow-alt-circle-down score-card-indicator-composite"
								alt="Decrease"></i>
							<h1 class="score-card-score">87.5</h1>
							<h3 class="score-card-percent">%</h3>
							<div class="score-card-composite-bottom-area"></div>
							<span class="score-card-composite-bottom-area-title">Mumbai</span>
							<span class="score-card-composite-bottom-area-page"><b>6</b>
								of 22</span>
						</div>
					</div>

					<div class="score-card-composite-container">
						<div class="score-card-composite bg-good " id="jcs-card"
							onclick="location.href='lights-on-dashboard.html';"
							style="cursor: pointer;">
							<h5 class="score-card-title">Jio Composite Score</h5>
							<span class="score-card-timeline-current">Current</span> <span
								class="score-card-timeline-change-title">Change</span> <span
								class="score-card-timeline-change">0%</span> <i
								class="fa fa-arrow-alt-circle-down score-card-indicator-composite"
								alt="Decrease"></i>
								<%if (circleDetailsDPost == null) { %>
								<h1 class="score-card-score">92%</h1>
								<%} else { %>
							<h1 class="score-card-score"><%  out.println( request.getAttribute("getJCSPercent")) ; %></h1>
							<%} %>
							<h3 class="score-card-percent">%</h3>
							<div class="score-card-composite-bottom-area"></div>
							<span class="score-card-composite-bottom-area-title">Mumbai</span>
							<span class="score-card-composite-bottom-area-page"><b>6</b>
								of 22</span>
						</div>
					</div>

					<div class="score-card-composite-container shrink">
						<div class="score-card-composite bg-average">
							<span class="score-card-rank">7</span>
							<h5 class="score-card-title">Jio Composite Score</h5>
							<span class="score-card-timeline-current">Current</span> <span
								class="score-card-timeline-change-title">Change</span> <span
								class="score-card-timeline-change">0%</span> <i
								class="fa fa-arrow-alt-circle-down score-card-indicator-composite"
								alt="Decrease"></i>
							<h1 class="score-card-score">87.4</h1>
							<h3 class="score-card-percent">%</h3>
							<div class="score-card-composite-bottom-area"></div>
							<span class="score-card-composite-bottom-area-title">Mumbai</span>
							<span class="score-card-composite-bottom-area-page"><b>6</b>
								of 22</span>
						</div>
					</div>

					<button type="button" class="btn btn-circle btn-toggle btn-lg"
						style="right: 90px; z-index: 99;">
						<i class="fa fa-arrow-right"></i>
					</button>
				</div>
				<div class="d-flex justify-content-center align-items-center">
					<div class="card" style="width: 15rem;">
						<div class="card-body">

							<span class="card-text mb-2 text-muted">Current Budget</span>
							<p class="card-text">111,423,320 INR</p>
							<span class="card-text mb-2 text-muted">Cost Change</span>
							<p class="card-text">0 INR</p>
							<span class="card-text mb-2 text-muted">New Budget</span>
							<p class="card-text">111,423,320 INR</p>
						</div>
					</div>
					<div class="score-card-composite-container">
						<div class="score-card-composite bg-best">
							<h5 class="score-card-title">Economic Score</h5>
							<span class="score-card-timeline-current">Current</span> <span
								class="score-card-timeline-change-title">Change</span> <span
								class="score-card-timeline-change">0%</span> <i
								class="fa fa-arrow-alt-circle-down score-card-indicator-composite"
								alt="Decrease"></i>
								<%if (circleDetailsDPost == null) { %>
								<h1 class="score-card-score">Excellent</h1>
								<%} else { %>
							<h1 class="score-card-score"><%  out.println(request.getAttribute("getES")); %></h1>
							<%} %>
							<!-- <h3 class="score-card-percent">%</h3>  -->
							<div class="score-card-composite-bottom-area"></div>
							<span class="score-card-composite-bottom-area-title">Mumbai</span>
							<span class="score-card-composite-bottom-area-page"><b>6</b>
								of 22</span>
						</div>
					</div>

					<div class="card" style="width: 15rem;">
						<div class="card-body">
							<p class="card-text mb-2 text-muted">Score Legend</p>
							<div class="d-flex align-items-top">
								<div class="bg-best sm-rect"></div>
								<span class="card-text">93.0% - 100%</span>
							</div>
							<div class="d-flex align-items-top">
								<div class="bg-good sm-rect"></div>
								<span class="card-text">90.5% - 92.9%</span>
							</div>
							<div class="d-flex align-items-top">
								<div class="bg-average sm-rect"></div>
								<span class="card-text">87.9% - 90.4%</span>
							</div>
							<div class="d-flex align-items-top">
								<div class="bg-bad sm-rect"></div>
								<span class="card-text">0% - 87.8%</span>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<nav id="sidebar" class="active">
			<div id="mapid"></div>
		</nav>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

	<!-- Then Material JavaScript on top of Bootstrap JavaScript -->
	<script src="js/material.min.js"></script>

	<script type="text/javascript">
        $(document).ready(function () {
            $('#maptoggle').on('click', function () {
                $('#sidebar').toggleClass('inactive');
                
            });

        });

	var mymap = L.map('mapid').setView([20.905, 78.6777], 5);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox.streets'
}).addTo(mymap);

    </script>
</body>

</html>