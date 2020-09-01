<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원가입</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
	type="image/x-icon" />
<meta charset="UTF-8" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<script src="/resources/assets/js/validation.js"></script>
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

	function emailCheck() {
		var client_email = $('#email').val();
		var passwordKey = null;			
		if( client_email.validationMAIL()){
			
			$.ajax({
				type:"POST",
				url:"/member/rest/checkmail", 
 				  data: 'client_email='+client_email,
// 				data : client_email,
				dataType : "text",
				//contentType : "application/json; charset=utf-8",
				success : function(result){
					console.log("ajax success : " + result);
					alert("메일 발송 완료")
					$('#hiddenpassword').val(result);
					passwordKey = result;
					$('#hiddenpassword').val(passwordKey);
				}, error : function(e){
					alert('street404 we can send email please check your email')
				}
			});
			
			
		}
		else {
			alert("이메일을 확인해주세요.")
			return false;
		}
	}
	




</script>

<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="/resources/assets/css/demo.css">

</head>

<body>
	<div class="wrapper fullheight-side sidebar_minimize">


		<div class="main-panel full-height">
			<div class="container">
				<div class="panel-header">
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">
							<h2 class="pb-2 fw-bold">회원가입</h2>
							<div class="nav-scroller d-flex">
								<div
									class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">회원가입</h4>
						<ul class="breadcrumbs">
							<li class="nav-home"><a href="#"> <i
									class="flaticon-home"></i>
							</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">회원가입</a></li>
							<li class="separator"><i class="flaticon-right-arrow"></i></li>
							<li class="nav-item"><a href="#">회원가입 입력창</a></li>
						</ul>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">

								<form action="" id="exampleValidation" novalidate="novalidate">
									<div class="card-body">
									
									
										<div class="form-group form-show-validation row">
											<label for="member_id"
												   class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">아이디
												<span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8">
												<input type="text" class="form-control" id="member_id"
													name="member_id" placeholder="Enter Username" required="">
													<div class="check_font" id="id_check"></div>
											</div>
											
<!-- 											<div class="form-group"> -->
<!-- 												<label for="member_id">아이디</label> <input type="text" -->
<!-- 													class="form-control" id=""member_id"" name="member_id" -->
<!-- 													placeholder="ID" required> -->
<!-- 												<div class="check_font" id="id_check"></div> -->
<!-- 											</div> -->
										</div>
										
										
										<div class="form-group form-show-validation row">
											<label for="username"
												class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이름
												<span class="required-label">*</span>
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
										
										
										<div class="form-group form-show-validation row">
											<label for="email"
												class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이메일
												<span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8" style="float: left:">
												<input type="email" class="form-control" id="email"
													placeholder="Enter Email" name="member_email" required="">
											</div>
											
											
											<button class="btn btn-primary btn-round btn-lg"
												type="button" onclick="emailCheck()" style="float: right;">인증번호</button>
										</div>
										<div class="form-group form-show-validation row">
											<label for="confirmpassword"
												class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">인증번호 확인 <span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8">
												<input type="hidden" class="form-control" id="hiddenpassword"
													name="member_emailword" value=""> <input
													type="password" class="form-control" id="confirmemailword"
													name="confirmemailword" placeholder="Enter PasswordKey"
													required="">
											</div>
										</div>
										
										
										<div class="form-group form-show-validation row">
											<label for="password"
												class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">비밀번호
												<span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8">
												<input type="password" class="form-control" id="password"
													name="member_password" placeholder="Enter Password"
													required="">
											</div>
										</div>
										
										
										<div class="form-group form-show-validation row">
											<label for="confirmpassword"
												class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">비밀번호 확인 <span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8">
												<input type="password" class="form-control"
													id="confirmpassword" name="confirmpassword"
													placeholder="Enter Password" required="">
											</div>
										</div>
										<div class="separator-solid"></div>


										<div class="form-group form-show-validation row">
											<label for="birth"
												class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">생일
												<span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8">
												<div class="input-group">
													<input type="text" class="form-control" id="birth"
														name="birth" required="">
													<div class="input-group-append">
														<span class="input-group-text"> <i
															class="fa fa-calendar-o"></i>
														</span>
													</div>
												</div>
											</div>
										</div>


										<div class="separator-solid"></div>
										<div class="form-group form-show-validation row">
											<label class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">프로필 이미지<span class="required-label">*</span>
											</label>
											<div class="col-lg-4 col-md-9 col-sm-8">
												<div class="input-file input-file-image">
													<img class="img-upload-preview img-circle" width="100"
														height="100" src="http://placehold.it/100x100"
														alt="preview"> <input type="file"
														class="form-control form-control-file" id="uploadImg"
														name="uploadImg" accept="image/*" required=""> <label
														for="uploadImg" class="btn btn-primary btn-round btn-lg"><i
														class="fa fa-file-image"></i> Upload a Image</label>
												</div>
											</div>
										</div>
										<div class="form-check">
											<div class="row">
												<label class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">동의
													<span class="required-label">*</span>
												</label>
												<div
													class="col-lg-4 col-md-9 col-sm-8 d-flex align-items-center">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="custom-control-input"
															id="agree" name="agree" required=""> <label
															class="custom-control-label" for="agree">정보이용을
															동의합니다.</label>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="card-action">
										<div class="row">
											<div class="col-md-12">
												<input class="btn btn-success" type="submit" value="가입하기">
												<button class="btn btn-danger" type="reset">취소</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
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
	<script>
		$('#birth').datetimepicker({
			format : 'MM/DD/YYYY'
		});

		$('#state').select2({
			theme : "bootstrap"
		});

		/* validate */

		// validation when select change
		$("#state").change(function() {
			$(this).valid();
		})

		// validation when inputfile change
		$("#uploadImg").on("change", function() {
			$(this).parent('form').validate();
		})

		$("#exampleValidation").validate(
				{
					validClass : "success",
					rules : {
						gender : {
							required : true
						},
						confirmpassword : {
							equalTo : "#password"
						},
						confirmemailword : {
							equalTo : "#hiddenpassword"
						},
						birth : {
							date : true
						},
						uploadImg : {
							required : true,
						},
					},
					highlight : function(element) {
						$(element).closest('.form-group').removeClass(
								'has-success').addClass('has-error');
					},
					success : function(element) {
						$(element).closest('.form-group').removeClass(
								'has-error').addClass('has-success');
					},
				});
	</script>
	
	<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#member_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var member_id = $('#member_id').val();
		$.ajax({
			url : '/member/rest/idCheck?member_id='+ member_id,
			type : 'get',
			success : function(data) {
				var over = data.over;
				console.log(over);
							
				if (over == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 ");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(member_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(member_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>

</body>
</html>