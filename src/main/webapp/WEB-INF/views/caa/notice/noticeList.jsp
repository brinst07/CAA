<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

CSS Just for demo purpose, don't include it in your project
<link rel="stylesheet" href="/resources/assets/css/demo.css">
 -->
</head>
<style>
    .btn-wrapper{
      display: inline-block;
    }
    .custom-control {
      float: left;
      width: 150px;
    }
</style>
<body>

   <div class="wrapper fullheight-side sidebar_minimize">

      <div class="main-panel full-height">
         <div class="container">
            <div class="panel-header">
               <div class="page-inner border-bottom pb-0 mb-3">
                  <div class="d-flex align-items-left flex-column">
                     <h2 class="pb-2 fw-bold">공지 사항</h2>
						
                  </div>
               </div>
            </div>
            <div class="page-inner">
               <div class="card-body">
                  <div class="table-responsive">
                     <div id="multi-filter-select_wrapper"
                        class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                           <div class="col-sm-12 col-md-6">
                              
                           </div>
                           <div id="btn-wrapper" class="col-sm-12 col-md-6">
                             
                              <div id="custom-control">
                                   
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-12">
                              <table id="multi-filter-select"
                                 class="display table table-striped table-hover dataTable"
                                 role="grid" aria-describedby="multi-filter-select_info">
                                 <thead>
                                    <tr role="row">
                                       <th class="sorting_asc" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1" aria-sort="ascending"
                                          aria-label="Name: activate to sort column descending"
                                          style="width: 76px;">번호</th>
                                       <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Position: activate to sort column ascending"
                                          style="width: 96px;">제목</th>
                                       <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Office: activate to sort column ascending"
                                          style="width: 70px;">작성자</th>
                                       <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Age: activate to sort column ascending"
                                          style="width: 27px;">등록일</th>
                                           <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Age: activate to sort column ascending"
                                          style="width: 27px;">조회수</th>
                                    </tr>
                                    
                                 </thead>
                                 <tfoot>
                                      
                                 </tfoot>
                                 <tbody>
                               
                                     <c:forEach items="${list }" var="board">
                                             <tr>
                                                <td><c:out value="${board.board_id }" /></td>
                                                <td><a class="move"
                                                   href='/notice/get?board_id=<c:out value="${board.board_id }"></c:out>'><c:out
                                                         value="${board.board_title }"></c:out><b>[<c:out
                                                            value="${board.board_reply_count } " />]
                                                   </b></a></td>
                                                <td><c:out value="${board.board_id }" /></td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                      value="${board.board_datetime }" /></td>
                                                <td><c:out
                                                      value="${board.board_hit }" /></td>
                                             </tr>
                                          </c:forEach>
                                 </tbody>
                                   
                              </table>
                           </div>
                        </div>
                          <div class="email-action">
                           <button class="btn btn-primary">등록</button>
                        </div>
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
	$(document)
	.ready(
			function() {
				$('#basic-datatables').DataTable({});

				$('#multi-filter-select')
						.DataTable(
								{
									"pageLength" : 5,
									initComplete : function() {
										this
												.api()
												.columns()
												.every(
														function() {
															var column = this;
															var select = $(
																	'<select class="form-control"><option value=""></option></select>')
																	.appendTo(
																			$(
																					column
																							.footer())
																					.empty())
																	.on(
																			'change',
																			function() {
																				var val = $.fn.dataTable.util
																						.escapeRegex($(
																								this)
																								.val());

																				column
																						.search(
																								val ? '^'
																										+ val
																										+ '$'
																										: '',
																								true,
																								false)
																						.draw();
																			});

															column
																	.data()
																	.unique()
																	.sort()
																	.each(
																			function(
																					d,
																					j) {
																				select
																						.append('<option value="'+d+'">'
																								+ d
																								+ '</option>')
																			});
														});
									}
								});

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