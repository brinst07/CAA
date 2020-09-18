<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
.findid{
	padding-left: 30%;
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
	
	function emailSend() {
		var name = document.getElementById("username").value;
		var clientemail = document.getElementById("email").value;
		var userid = document.getElementById("member_id").value;
		
		console.log('입력 이메일' + clientemail );
		
		var data = {};
		data["userID"] = userid;
		data["userEmail"] = clientemail;
		data["userName"] = name;
		
		$.ajax({
			type:"POST",
			url:"/member/rest/emailSendPW",
			 data : JSON.stringify(data),
			 contentType : "application/json; charset=utf-8",
			success : function(data){
				console.log("ajax success : " );
				alert("발송 성공!");
			}, error : function(e){
				alert("발송 실패! 아이디, 이메일 혹은 이름을 확인해주세요.");
			}
		});
		
	};

</script>

<!-- CSS Files -->
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

CSS Just for demo purpose, don't include it in your project
<link rel="stylesheet" href="/resources/assets/css/demo.css">
 -->

		<div class="main-panel full-height">
			<div class="container">
				<div class="panel-header">
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">
							<h2 class="pb-2 fw-bold">회원정보 찾기</h2>
							<div class="nav-scroller d-flex">
								<div
									class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
									<a class="nav-link " href="/member/findID">아이디 찾기</a>
									 <a class="nav-link active" href="/member/findPW">비밀번호 찾기</a>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="page-inner">
					<!-- 이름 /이메일 /아이디 입력란 -->
						
						<div class="form-group" align="center">
							<!-- thinpeopleLogo -->
							
							<div>
								<img id="logo" alt="logo"
									src="/resources/assets/img/thinkpeopleLogo.png">
							</div>
							<br>
							<br>
                              <div class="form-group form-show-validation row">
                                 <label  class="findid" for="member_id"
                                       class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">아이디
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <input type="text" class="form-control" id="member_id"
                                       name="member_id" placeholder="Enter Username" required="">
                                       <div class="check_font" id="id_check"></div>
                                 </div>
                                 </div>
                                 <br>
								  <div class="form-group form-show-validation row">
                                 <label  class="findid" for="username"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이름
                                    <span class="required-label">*&nbsp&nbsp&nbsp</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <div class="input-group">
                                       <div class="input-group-prepend">
                                          <span class="input-group-text" id="username-addon">@</span>
                                       </div>
                                       <input type="text" class="form-control"
                                          placeholder="username" aria-label="username"
                                          aria-describedby="username-addon" id="username"
                                          name="member_username" required="">
                                    </div>
                                 </div>
                              </div>
						</div>
							<br>
						  <div class="form-group form-show-validation row ">
                                 <label class="findid" for="email"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right findid">이메일
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8" style="float: left:">
                                    <input type="email" class="form-control" id="email"
                                       placeholder="Enter Email" name="member_email" required="">
                                       <div class="check_font" id="email_check"></div>
                                 </div>
                              </div>
						<div></div>
						<br>
						<br>
						<!-- 버튼 -->
						<div class="card-action" align="center">
							<button id="btnConfirm" type="button" class="btn btn-primary" onclick="emailSend()">찾기</button>
							<button type="reset" class="btn btn-black">취소</button>
							<div>ThinkPeople은 회원님의 개인정보를 보호합니다.</div>
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
</html>