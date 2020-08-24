<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico" type="image/x-icon" />
<meta charset="UTF-8" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
<!--   Core JS Files   -->
<script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="/resources/assets/js/core/popper.min.js"></script>
<script src="/resources/assets/js/core/bootstrap.min.js"></script>

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
<script src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

<!-- Google Maps Plugin -->
<script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

<!-- Dropzone -->
<script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

<!-- Fullcalendar -->
<script src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

<!-- DateTimePicker -->
<script
	src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

<!-- Bootstrap Tagsinput -->
<script
	src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

<!-- Bootstrap Wizard -->
<script src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

<!-- jQuery Validation -->
<script src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

<!-- Summernote -->
<script src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

<!-- Select2 -->
<script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

<!-- Sweet Alert -->
<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Owl Carousel -->
<script src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

<!-- Magnific Popup -->
<script
	src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Atlantis JS -->
<script src="/resources/assets/js/atlantis.min.js"></script>


<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

<title>CAA 상권분석프로그램</title>
</head>
<body>
	<div class="wrapper fullheight-side sidebar_minimize">
		<!-- Logo Header -->
		<div class="logo-header position-fixed" data-background-color="blue">

			<a href="index.html" class="logo"> <img
				src="/resources/assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
			</a>
			<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="collapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
				</span>
			</button>
			<button class="topbar-toggler more">
				<i class="icon-options-vertical"></i>
			</button>
			<div class="nav-toggle">
				<button class="btn btn-toggle toggle-sidebar">
					<i class="icon-menu"></i>
				</button>
			</div>
		</div>
		<nav
		class="navbar navbar-header navbar-header-transparent navbar-expand-lg">

		<div class="container-fluid">
			<!-- 요기다가 로고를 넣으면 될듯 -->
			<div class="collapse" id="search-nav">
<<<<<<< HEAD
<!-- 				<img alt=".." src="#"> -->
=======
<!-- 				<img alt=".." > -->
>>>>>>> 9c85cbec7bfb8670d1b4486da9d671babe27598f
			</div>
			<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
			
			<!-- 알림 -->
				<li class="nav-item dropdown hidden-caret"><a
					class="nav-link dropdown-toggle" href="#" id="notifDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-bell"></i> <span
						class="notification">4</span>
				</a>
					<ul class="dropdown-menu notif-box animated fadeIn"
						aria-labelledby="notifDropdown">
						<li>
							<div class="dropdown-title">You have 4 new notification</div>
						</li>
						<li>
							<div class="notif-scroll scrollbar-outer">
								<div class="notif-center">
									<a href="#">
										<div class="notif-icon notif-primary">
											<i class="fa fa-user-plus"></i>
										</div>
										<div class="notif-content">
											<span class="block"> New user registered </span> <span
												class="time">5 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-icon notif-success">
											<i class="fa fa-comment"></i>
										</div>
										<div class="notif-content">
											<span class="block"> Rahmad commented on Admin </span> <span
												class="time">12 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-img">
											<img src="/resources/assets/img/profile2.jpg" alt="Img Profile">
										</div>
										<div class="notif-content">
											<span class="block"> Reza send messages to you </span> <span
												class="time">12 minutes ago</span>
										</div>
									</a> <a href="#">
										<div class="notif-icon notif-danger">
											<i class="fa fa-heart"></i>
										</div>
										<div class="notif-content">
											<span class="block"> Farrah liked Admin </span> <span
												class="time">17 minutes ago</span>
										</div>
									</a>
								</div>
							</div>
						</li>
						<li><a class="see-all" href="javascript:void(0);">See all
								notifications<i class="fa fa-angle-right"></i>
						</a></li>
					</ul></li>
					
<!-- 				<li class="nav-item"><a href="#" -->
<!-- 					class="nav-link quick-sidebar-toggler"> <i class="fa fa-th"></i> -->
<!-- 				</a></li> -->
				<li class="nav-item dropdown hidden-caret"><a
					class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"
					aria-expanded="false">
						<div class="avatar-sm">
							<img src="/resources/assets/img/profile.jpg" alt="..."
								class="avatar-img rounded-circle">
						</div>
				</a>
					<ul class="dropdown-menu dropdown-user animated fadeIn">
						<div class="dropdown-user-scroll scrollbar-outer">
							<li>
								<div class="user-box">
									<div class="avatar-lg">
										<img src="/resources/assets/img/profile.jpg" alt="image profile"
											class="avatar-img rounded">
									</div>
									<div class="u-text">
										<h4>Hizrian</h4>
										<p class="text-muted">hello@example.com</p>
										<a href="profile.html" class="btn btn-xs btn-secondary btn-sm">View
											Profile</a>
									</div>
								</div>
							</li>
							<li>
								<div class="dropdown-divider"></div> <a class="dropdown-item"
								href="#">My Profile</a> <a class="dropdown-item" href="#">My
									Balance</a> <a class="dropdown-item" href="#">Inbox</a>
								<div class="dropdown-divider"></div> <a class="dropdown-item"
								href="#">Account Setting</a>
								<div class="dropdown-divider"></div> <a class="dropdown-item"
								href="#">Logout</a>
							</li>
						</div>
					</ul></li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
</body>
</html>