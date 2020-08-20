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
                              <div class="dataTables_length" id="multi-filter-select_length">
                                 <label>Show <select name="multi-filter-select_length"
                                    aria-controls="multi-filter-select"
                                    class="form-control form-control-sm"><option
                                          value="10">10</option>
                                       <option value="25">25</option>
                                       <option value="50">50</option>
                                       <option value="100">100</option></select> entries
                                 </label>
                              </div>
                           </div>
                           <div id="btn-wrapper" class="col-sm-12 col-md-6">
                              <div id="custom-control" class="dataTables_filter">
                                 <label>Search: <th rowspan="1" colspan="1"><select
                                          class="form-control"><option value=""></option>
                                             <option value="title">제목</option>
                                             <option value="writer">작성자</option>
                                             <option value="content">내용</option></label>
                              </div>
                              <div id="custom-control">
                                   <input type="search"
                                    class="form-control form-control-sm" placeholder=""
                                    aria-controls="multi-filter-select">
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
                                    <tr role="row" class="odd">
                                       <td class="sorting_1">1</td>
                                       <td>상권분석 공지사항입니다.</td>
                                       <td>관리자</td>
                                       <td>2020.08.01</td>
                                       <td>432</td>
                                    </tr>
                                    <tr role="row" class="odd">
                                       <td class="sorting_1">2</td>
                                       <td>소상공 이벤트입니다.</td>
                                       <td>관리자</td>
                                       <td>2020.08.02</td>
                                       <td>56</td>
                                    </tr>
                                    <tr role="row" class="even">
                                       <td class="sorting_1">3</td>
                                       <td>전화 상담 안내입니다.</td>
                                       <td>관리자</td>
                                       <td>2020.08.02</td>
										<td>457</td>
                                    </tr>
                                    <tr role="row" class="odd">
                                       <td class="sorting_1">4</td>
                                       <td>알려드립니다.</td>
                                       <td>관리자</td>
                                       <td>2020.08.03</td>
										<td>64</td>
                                    </tr>
                                    <tr role="row" class="even">
                                       <td class="sorting_1">5</td>
                                       <td>CAA를 쉽게 이용할수 있는 방법</td>
                                       <td>관리자</td>
                                       <td>2020.08.04</td>
										<td>25</td>
                                    </tr>
                                    <tr role="row" class="odd">
                                       <td class="sorting_1">6</td>
                                       <td>나도 이제 창업자~!</td>
                                       <td>관리자</td>
                                       <td>2020.08.05</td>
										<td>42</td>
                                    </tr>
                                         <tr role="row" class="even">
                                       <td class="sorting_1">7</td>
                                       <td>내 점포 분석하는 방법</td>
                                       <td>관리자</td>
                                       <td>2020.08.13</td>
									<td>13</td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-12 col-md-5">
                              <div class="dataTables_info" id="multi-filter-select_info"
                                 role="status" aria-live="polite">Showing 1 to 5 of 57
                                 entries</div>
                           </div>
                           <div class="col-sm-12 col-md-7" align="center">
                              <div class="dataTables_paginate paging_simple_numbers"
                                 id="multi-filter-select_paginate">
                                 <ul class="pagination">
                                    <li class="paginate_button page-item previous disabled"
                                       id="multi-filter-select_previous"><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="0"
                                       tabindex="0" class="page-link">Previous</a></li>
                                    <li class="paginate_button page-item active"><a
                                       href="#" aria-controls="multi-filter-select"
                                       data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                                    <li class="paginate_button page-item "><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="2"
                                       tabindex="0" class="page-link">2</a></li>
                                    <li class="paginate_button page-item "><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="3"
                                       tabindex="0" class="page-link">3</a></li>
                                    <li class="paginate_button page-item "><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="4"
                                       tabindex="0" class="page-link">4</a></li>
                                    <li class="paginate_button page-item "><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="5"
                                       tabindex="0" class="page-link">5</a></li>
                                    <li class="paginate_button page-item disabled"
                                       id="multi-filter-select_ellipsis"><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="6"
                                       tabindex="0" class="page-link">…</a></li>
                                    <li class="paginate_button page-item "><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="7"
                                       tabindex="0" class="page-link">12</a></li>
                                    <li class="paginate_button page-item next"
                                       id="multi-filter-select_next"><a href="#"
                                       aria-controls="multi-filter-select" data-dt-idx="8"
                                       tabindex="0" class="page-link">Next</a></li>
                                 </ul>
                              </div>
                           </div>
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