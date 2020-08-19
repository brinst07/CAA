<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
	type="image/x-icon" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<style type="text/css">
#logo {
	width: 250px;
	padding-bottom: 20px;
}
</style>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '/resources/assets/css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
</script>

<!-- CSS Files -->
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="/resources/assets/css/atlantis.css"> -->

<!-- <!-- CSS Just for demo purpose, don't include it in your project -->
-->
<!-- <link rel="stylesheet" href="/resources/assets/css/demo.css"> -->

</head>
<body>
	<div class="wrapper fullheight-side sidebar_minimize">

		<div class="main-panel full-height">
			<div class="container">
				<div class="panel-header">
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">
							<h2 class="pb-2 fw-bold">상권 분석</h2>
							<div
								class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
								<a class="nav-link" href="commercialanalysis">상권분석</a> <a
									class="nav-link " href="industryanalysis">업종분석</a> <a
									class="nav-link active " href="SaleAnalysis">매출분석</a> <a
									class="nav-link " href="test4">인구분석</a>
							</div>
					
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="card-title">1. 업종별 매출추이</div>
						</div>
						<div class="card-body">
							<div class="chart-container">
								<div class="chartjs-size-monitor"
									style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand"
										style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div
											style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink"
										style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div
											style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
									</div>
								</div>
								<canvas id="multipleLineChart" width="306" height="300"
									class="chartjs-render-monitor"
									style="display: block; width: 306px; height: 300px;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="card-title">2. 고객별 매출특성</div>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">First</th>
										<th scope="col">Last</th>
										<th scope="col">Handle</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>
									<tr>
										<td>1</td>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
									</tr>

									<tr>
										<td>2</td>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>@fat</td>
									</tr>
									<tr>
										<td>3</td>
										<td colspan="2">Larry the Bird</td>
										<td>@twitter</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	</div>

	<!-- jQuery UI -->
	<script
		src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

	<!-- Moment JS -->
	<script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

	<!-- Chart JS -->
	<script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script
		src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script
		src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- Bootstrap Toggle -->
	<script
		src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script
		src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Google Maps Plugin -->
	<script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

	<!-- Dropzone -->
	<script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

	<!-- Fullcalendar -->
	<script
		src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

	<!-- DateTimePicker -->
	<script
		src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

	<!-- Bootstrap Tagsinput -->
	<script
		src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

	<!-- Bootstrap Wizard -->
	<script
		src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

	<!-- jQuery Validation -->
	<script
		src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

	<!-- Summernote -->
	<script
		src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

	<!-- Select2 -->
	<script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

	<!-- Sweet Alert -->
	<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Owl Carousel -->
	<script
		src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

	<!-- Magnific Popup -->
	<script
		src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Atlantis JS -->
	<script src="/resources/assets/js/atlantis.min.js"></script>

	<script>
		var myMultipleLineChart = new Chart(multipleLineChart, {
			type : 'line',
			data : {
				labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
						"Aug", "Sep", "Oct", "Nov", "Dec" ],
				datasets : [
						{
							label : "Python",
							borderColor : "#1d7af3",
							pointBorderColor : "#FFF",
							pointBackgroundColor : "#1d7af3",
							pointBorderWidth : 2,
							pointHoverRadius : 4,
							pointHoverBorderWidth : 1,
							pointRadius : 4,
							backgroundColor : 'transparent',
							fill : true,
							borderWidth : 2,
							data : [ 30, 45, 45, 68, 69, 90, 100, 158, 177,
									200, 245, 256 ]
						},
						{
							label : "PHP",
							borderColor : "#59d05d",
							pointBorderColor : "#FFF",
							pointBackgroundColor : "#59d05d",
							pointBorderWidth : 2,
							pointHoverRadius : 4,
							pointHoverBorderWidth : 1,
							pointRadius : 4,
							backgroundColor : 'transparent',
							fill : true,
							borderWidth : 2,
							data : [ 10, 20, 55, 75, 80, 48, 59, 55, 23, 107,
									60, 87 ]
						},
						{
							label : "Ruby",
							borderColor : "#f3545d",
							pointBorderColor : "#FFF",
							pointBackgroundColor : "#f3545d",
							pointBorderWidth : 2,
							pointHoverRadius : 4,
							pointHoverBorderWidth : 1,
							pointRadius : 4,
							backgroundColor : 'transparent',
							fill : true,
							borderWidth : 2,
							data : [ 10, 30, 58, 79, 90, 105, 117, 160, 185,
									210, 185, 194 ]
						} ]
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				legend : {
					position : 'top',
				},
				tooltips : {
					bodySpacing : 4,
					mode : "nearest",
					intersect : 0,
					position : "nearest",
					xPadding : 10,
					yPadding : 10,
					caretPadding : 10
				},
				layout : {
					padding : {
						left : 15,
						right : 15,
						top : 15,
						bottom : 15
					}
				}
			}
		});
		$('#lineChart').sparkline([ 102, 109, 120, 99, 110, 105, 115 ], {
			type : 'line',
			height : '70',
			width : '100%',
			lineWidth : '2',
			lineColor : '#177dff',
			fillColor : 'rgba(23, 125, 255, 0.14)'
		});

		$('#lineChart2').sparkline([ 99, 125, 122, 105, 110, 124, 115 ], {
			type : 'line',
			height : '70',
			width : '100%',
			lineWidth : '2',
			lineColor : '#f3545d',
			fillColor : 'rgba(243, 84, 93, .14)'
		});

		$('#lineChart3').sparkline([ 105, 103, 123, 100, 95, 105, 115 ], {
			type : 'line',
			height : '70',
			width : '100%',
			lineWidth : '2',
			lineColor : '#ffa534',
			fillColor : 'rgba(255, 165, 52, .14)'
		});
	</script>
</body>
</html>