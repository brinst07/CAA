<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>공지사항</title>
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

   function sendEmail() {

   };
</script>

	<!-- CSS Files -->
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="/resources/assets/css/demo.css">
</head>
<body>
 <div class="wrapper sidebar_minimize fullheight-side">
      <!-- Logo Header -->
      

	

		<!-- Sidebar -->
		
		<!-- End Sidebar -->

		<div class="main-panel">
			<div class="container container-full">
				<div class="page-navs bg-black">
					<div class="nav-scroller">
					</div>
				</div>
				<div class="page-inner">
					<div class="row">
						<div class="col-md-12">
							<section class="card mt-4">
								<div class="list-group list-group-messages list-group-flush">
									<div class="list-group-item unread">
										<div class="list-group-item-figure">
											<span class="rating rating-sm mr-3">
												<input type="checkbox" id="star2" value="1" checked>
											</span>
											<a href="conversations.html" class="user-avatar">
												<div>
													<img src="/resources/assets/img/service1.png" alt="" class="avatar-img rounded-circle">
												</div>
											</a>
										</div>
										<div class="list-group-item-body pl-3 pl-md-4">
											<div class="row">
												<div class="col-12 col-lg-10">
													<h4 class="list-group-item-title">
														<a>상권분석</a>
													</h4>
													<p class="list-group-item-text text-truncate"> 
													· 특정 지역·영역·업종의 업종, 매출, 인구, 지역 53종의 상권정보 제공<br>
													· 업종(추이, 창·폐업률 등), 매출(추이,특성 등), 인구(유동, 거주 등), 지역(주요집객시설, 학교, 교통 등) </p>
												</div>
											</div>
										</div>
										<div class="list-group-item-figure">
										</div>
									</div>
									<div class="list-group-item unread">
										<div class="list-group-item-figure">
											<span class="rating rating-sm mr-3">
												<input type="checkbox" id="star3" value="1">
											</span>
											<a href="conversations.html" class="user-avatar">
												<div>
													<img src="/resources/assets/img/service5.png" alt="..." class="avatar-img rounded-circle">
												</div>
											</a>
										</div>
										<div class="list-group-item-body pl-3 pl-md-4">
											<div class="row">
												<div class="col-12 col-lg-10">
													<h4 class="list-group-item-title">
														<a>점포 이력 분석</a>
													</h4>
													<p class="list-group-item-text text-truncate">· 특정 위치의 개·폐업 이력정보. 특정 업종의 창업여부 및 영업기간 등의 정보 제공 </p>
												</div>
											</div>
										</div>
									</div>
									<div class="list-group-item unread">
										<div class="list-group-item-figure">
											<span class="rating rating-sm mr-3">
												<input type="checkbox" id="star4" value="1">
											</span>
											<a href="conversations.html" class="user-avatar">
												<div>
													<img src="/resources/assets/img/service2.png" alt="..." class="avatar-img rounded-circle">
												</div>
											</a>
										</div>
										<div class="list-group-item-body pl-3 pl-md-4">
											<div class="row">
												<div class="col-12 col-lg-10">
													<h4 class="list-group-item-title">
														<a>업소 현황</a>
													</h4>
													<p class="list-group-item-text text-truncate">
													· 업소현황이란?
                                                                                                        행정동별로 기본적인 업종 업소수 정보를 통해 상권분석 전 예비정보로 활용할 수 있습니다. <br>
                                                    · 업소현황 : 행정동별 업종별 업소수와 변화추이를 분석할 수 있습니다.                                                    </p>
												</div>
											</div>
										</div>
									</div>
									<div class="list-group-item unread">
									<div class="list-group-item-figure">
											<span class="rating rating-sm mr-3">
												<input type="checkbox" id="star4" value="1">
											</span>
											<a href="conversations.html" class="user-avatar">
												<div>
													<img src="/resources/assets/img/service2.png" alt="..." class="avatar-img rounded-circle">
												</div>
											</a>
										</div>
										<div class="list-group-item-body pl-3 pl-md-4">
											<div class="row">
												<div class="col-12 col-lg-10">
													<h4 class="list-group-item-title">
														<a>매출 현황</a>
													</h4>
													<p class="list-group-item-text text-truncate"> 
													· (추정) 매출액 현황은 해당 상권에 진입 또는 퇴출을 고려하는 예비창업자 및 소상공인에게 상권 성장 여부에 대한 추세를 제공하여 참고하도록 <br>
													     &nbsp&nbsp하는 것을 목적으로 소상공인 전체 매출현황이 아닙니다.<br>
													· 매출정보를 보유하고 있지 않은 업종은 표시되지 않습니다.</p>
												</div>
											</div>
										</div>
									</div>
									<div class="list-group-item unread">
										<div class="list-group-item-figure">
											<span class="rating rating-sm mr-3">
												<input type="checkbox" id="star6" value="1">
											</span>
											<a href="conversations.html" class="user-avatar">
												<div>
													<img src="/resources/assets/img/img_create2_2.png" alt="설문 구성" class="avatar-img rounded-circle">
												</div>
											</a>
										</div>
										<div class="list-group-item-body pl-3 pl-md-4">
											<div class="row">
												<div class="col-12 col-lg-10">
													<h4 class="list-group-item-title">
														<a>설문 조사</a>
													</h4>
													<p class="list-group-item-text text-truncate">· 상권정보시스템의 이용자를 대상으로 만족도 조사 및 다양한 설문조사 결과를 확인 하실 수 있습니다.</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
			</footer>
		</div>
		<div class="quick-sidebar">
			<a href="#" class="close-quick-sidebar">
				<i class="flaticon-cross"></i>
			</a>
			<div class="quick-sidebar-wrapper">
				<ul class="nav nav-tabs nav-line nav-color-secondary" role="tablist">
					<li class="nav-item"> <a class="nav-link active show" data-toggle="tab" href="#messages" role="tab" aria-selected="true">Messages</a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tasks" role="tab" aria-selected="false">Tasks</a> </li>
					<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#settings" role="tab" aria-selected="false">Settings</a> </li>
				</ul>
				<div class="tab-content mt-3">
					<div class="tab-chat tab-pane fade show active" id="messages" role="tabpanel">
						<div class="messages-contact">
							<div class="quick-wrapper">
								<div class="quick-scroll scrollbar-outer">
									<div class="quick-content contact-content">
										<span class="category-title mt-0">Contacts</span>
										<div class="avatar-group">
											<div class="avatar">
												<img src="/resources/assets/img/jm_denis.jpg" alt="..." class="avatar-img rounded-circle border border-white">
											</div>
											<div class="avatar">
												<img src="/resources/assets/img/chadengle.jpg" alt="..." class="avatar-img rounded-circle border border-white">
											</div>
											<div class="avatar">
												<img src="/resources/assets/img/mlane.jpg" alt="..." class="avatar-img rounded-circle border border-white">
											</div>
											<div class="avatar">
												<img src="/resources/assets/img/talha.jpg" alt="..." class="avatar-img rounded-circle border border-white">
											</div>
											<div class="avatar">
												<span class="avatar-title rounded-circle border border-white">+</span>
											</div>
										</div>
										<span class="category-title">Recent</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="tasks" role="tabpanel">
						<div class="quick-wrapper tasks-wrapper">
							<div class="tasks-scroll scrollbar-outer">
								<div class="tasks-content">
									<span class="category-title mt-0">Today</span>
									<ul class="tasks-list">
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" checked="" class="custom-control-input"><span class="custom-control-label">Planning new project structure</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span class="custom-control-label">Create the main structure							</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span class="custom-control-label">Add new Post</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span class="custom-control-label">Finalise the design proposal</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
									</ul>

									<span class="category-title">Tomorrow</span>
									<ul class="tasks-list">
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span class="custom-control-label">Initialize the project							</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span class="custom-control-label">Create the main structure							</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span class="custom-control-label">Updates changes to GitHub							</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
										<li>
											<label class="custom-checkbox custom-control checkbox-secondary">
												<input type="checkbox" class="custom-control-input"><span title="This task is too long to be displayed in a normal space!" class="custom-control-label">This task is too long to be displayed in a normal space!				</span>
												<span class="task-action">
													<a href="#" class="link text-danger">
														<i class="flaticon-interface-5"></i>
													</a>
												</span>
											</label>
										</li>
									</ul>

									<div class="mt-3">
										<div class="btn btn-primary btn-rounded btn-sm">
											<span class="btn-label">
												<i class="fa fa-plus"></i>
											</span>
											Add Task
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Custom template | don't include it in your project! -->
		<div class="custom-template">
			<div class="title">Settings</div>
			<div class="custom-content">
				<div class="switcher">
				</div>
			</div>
		</div>
	<!--   Core JS Files   -->
   <script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
   <script src="/resources/assets/js/core/popper.min.js"></script>
   <script src="/resources/assets/js/core/bootstrap.min.js"></script>
   <!-- jQuery UI -->
   <script src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
   <script src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
   <!-- Bootstrap Toggle -->
   <script src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
   <!-- jQuery Scrollbar -->
   <script src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
   <script src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>
   <!-- Atlantis JS -->
   <script src="/resources/assets/js/atlantis.min.js"></script>
   <!-- Atlantis DEMO methods, don't include it in your project! -->
   <script src="/resources/assets/js/setting-demo.js"></script>
   <script>
      $('#editor').summernote({
         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
         tabsize: 2,
         height: 300
      });
   </script>

	
	<script >
      $(document).ready(function() {
         $('#basic-datatables').DataTable({
         });

         $('#multi-filter-select').DataTable( {
            "pageLength": 5,
            initComplete: function () {
               this.api().columns().every( function () {
                  var column = this;
                  var select = $('<select class="form-control"><option value=""></option></select>')
                  .appendTo( $(column.footer()).empty() )
                  .on( 'change', function () {
                     var val = $.fn.dataTable.util.escapeRegex(
                        $(this).val()
                        );

                     column
                     .search( val ? '^'+val+'$' : '', true, false )
                     .draw();
                  } );

                  column.data().unique().sort().each( function ( d, j ) {
                     select.append( '<option value="'+d+'">'+d+'</option>' )
                  } );
               } );
            }
         });

      });
   </script>
	
</body>
</html>