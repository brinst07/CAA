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

.progress-card {
	width: 1000px;
	margin: 0 auto;
}

.block {
	width: 500px;
	display: inline-block;
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
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

CSS Just for demo purpose, don't include it in your project
<link rel="stylesheet" href="/resources/assets/css/demo.css">
 -->
</head>
<body>
	<div class="wrapper fullheight-side sidebar_minimize">

		<div class="main-panel full-height">
			<div class="container">
				<div class="panel-header">
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">
							<h2 class="pb-2 fw-bold">설문조사</h2>
							<div class="nav-scroller d-flex"></div>
						</div>
					</div>

					<br>
					<div class="page-inner">
						<!-- QnA 등록 -->
						<div class="form-group" >
							<!-- thinpeopleLogo -->
							<!-- <div><img id="logo" alt="logo" src="/resources/assets/img/thinkpeopleLogo.png"></div> -->
							<label for="title">제목&nbsp&nbsp&nbsp&nbsp</label><input
								style="display: inline; width: 500px" type="title"
								class="form-control" id="title" placeholder="2017년 하반기 만족도 조사">
						</div>
						<div class="form-group">	
							<label for="writer">기간&nbsp&nbsp&nbsp&nbsp</label><input
								style="display: inline; width: 500px" type="writer"
								class="form-control" id="writer" placeholder="2017-10-16 ~ 2017-11-03">
						</div>
						<!-- <div class="form-group" align="center">
						<label for="contents">내용&nbsp&nbsp&nbsp&nbsp </label>
						
						<textarea style="display: inline; width: 500px" type="contents"
						 class="form-control" id="contents" rows="5" placeholder="Enter Contents">
												</textarea>
					</div> -->


						<!-- <div class="form-group" align="center">
						<label for="exampleFormControlFile1">첨부파일&nbsp&nbsp</label>
						<input type="file" class="form-control-file" id="exampleFormControlFile1">
					</div> -->

						<br>

						<h3 class="pb-2 fw-bold">설문내용</h3>
						
						<!-- 수정 전 -->
						<!-- <div class="progress-card">
							<div class="progress-status">
								<div class="block first">
									<span class="text-muted">1. 성별은? </span>
										<label for="writer">남자&nbsp&nbsp&nbsp&nbsp</label>
										<label for="writer">여자&nbsp&nbsp&nbsp&nbsp</label>
								</div>
								
								<hr>
								<div class="block second">
									<label for="writer">남자&nbsp&nbsp&nbsp&nbsp</label>
									<hr>
									<span class="text-muted fw-bold"> 70%</span>
								</div>
							</div>
							<div class="progress" style="height: 6px;">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 70%" aria-valuenow="70" aria-valuemin="0"
									aria-valuemax="100" data-toggle="tooltip" data-placement="top"
									title="" data-original-title="70%"></div>

							</div>
							
							<div class="progress-card">
							<div class="progress-status">
								<hr>
								<label for="writer">여자&nbsp&nbsp&nbsp&nbsp</label>
								<hr>
								<span class="text-muted fw-bold"> 30%</span>
							</div>
							<div class="progress" style="height: 6px;">
								<div class="progress-bar bg-primary" role="progressbar"
									style="width: 30%" aria-valuenow="30" aria-valuemin="0"
									aria-valuemax="100" data-toggle="tooltip" data-placement="top"
									title="" data-original-title="30%" ></div>
							</div>

						</div> -->
						
						
						
						
						<!----------------------------------->
						
						<table class="table">
                    <caption class="hidden">
                    설문 항목
                    </caption>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <th class="text-left">성별은?</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="text-left"><table class="table thin none-bordered">
                                    <caption class="hidden">
                                    설문 문항
                                    </caption>
                                    <colgroup>
                                    <col style="width:25%;">
                                    <col style="width:50%;">
                                    <col style="width:25%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left">남성</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase1" role="progressbar" aria-valuenow="65.9" aria-valuemin="0" aria-valuemax="100" style="width:65.9%;"> <span class="sr-only">65.9%</span> </div>
                                                </div></td>
                                            <td>65.9%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">여성</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase2" role="progressbar" aria-valuenow="34.1" aria-valuemin="0" aria-valuemax="100" style="width:34.1%;"> <span class="sr-only">34.1%</span> </div>
                                                </div></td>
                                            <td>34.1%</td>
                                        </tr>
                                    </tbody>
                                </table></td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <th class="text-left">연령대는?</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="text-left"><table class="table thin none-bordered">
                                    <caption class="hidden">
                                    설문 문항
                                    </caption>
                                    <colgroup>
                                    <col style="width:25%;">
                                    <col style="width:50%;">
                                    <col style="width:25%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left">20대</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase1" role="progressbar" aria-valuenow="17.1" aria-valuemin="0" aria-valuemax="100" style="width:17.1%;"> <span class="sr-only">17.1%</span> </div>
                                                </div></td>
                                            <td>17.1%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">30대</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase2" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%;"> <span class="sr-only">40%</span> </div>
                                                </div></td>
                                            <td>40.0%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">40대</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase3" role="progressbar" aria-valuenow="29.2" aria-valuemin="0" aria-valuemax="100" style="width:29.2%;"> <span class="sr-only">29.2%</span> </div>
                                                </div></td>
                                            <td>29.2%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">50대</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase4" role="progressbar" aria-valuenow="10.3" aria-valuemin="0" aria-valuemax="100" style="width:10.3%;"> <span class="sr-only">10.3%</span> </div>
                                                </div></td>
                                            <td>10.3%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">60대 이상</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase5" role="progressbar" aria-valuenow="3.3" aria-valuemin="0" aria-valuemax="100" style="width:3.3%;"> <span class="sr-only">3.3%</span> </div>
                                                </div></td>
                                            <td>3.3%</td>
                                        </tr>
                                    </tbody>
                                </table></td>
						</tr>
                    </tbody>
                </table>
						
						<!----------------------------------->
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						<!-- <td class="text-left"><table class="table thin none-bordered">
                                    <caption class="hidden">
                                    설문 문항
                                    </caption>
                                    <colgroup>
                                    <col style="width:25%;">
                                    <col style="width:50%;">
                                    <col style="width:25%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="text-left">남성</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase1" role="progressbar" aria-valuenow="65.9" aria-valuemin="0" aria-valuemax="100" style="width:65.9%;"> <span class="sr-only">65.9%</span> </div>
                                                </div></td>
                                            <td>65.9%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-left">여성</td>
                                            <td><div class="progress">
                                                    <div class="progress-bar progress-bar-phase2" role="progressbar" aria-valuenow="34.1" aria-valuemin="0" aria-valuemax="100" style="width:34.1%;"> <span class="sr-only">34.1%</span> </div>
                                                </div></td>
                                            <td>34.1%</td>
                                        </tr>
                                    </tbody>
                                </table></td> -->
						
						
						
						
						
						
						
						
						
						
						
						

						<div></div>
						<!-- 버튼 -->
					</div>
						<div class="card-action" align="right">
							<!-- <button class="btn btn-primary">확인</button> -->
							<button class="btn btn-black">목록</button>
						</div>
				</div>

			</div>

		</div>
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