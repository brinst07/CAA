<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8"/>
<title>회원가입</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
   name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico" type="image/x-icon" />
<meta charset="UTF-8" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
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
               <!-- 이름 /이메일 /아이디 입력란 -->
               <div class="form-group" align="center">
                  <label for="password">이름&nbsp&nbsp&nbsp</label><input
                     style="display: inline; width: 500px" type="password"
                     class="form-control" id="password" placeholder="Enter Name">
               </div>
               <div class="form-group" align="center">
                  <label for="email2">아이디&nbsp </label><input
                     style="display: inline; width: 500px" type="email"
                     class="form-control" id="email2" placeholder="Enter Email">
                  <small id="emailHelp2" class="form-text text-muted">
                     ThinkPeople은 회원님의 개인정보를 보호합니다.</small>
               </div>
               <div></div>
               <!-- 버튼 -->
               <div class="card-action" align="center">
                  <button class="btn btn-primary">확인</button>
                  <button class="btn btn-black">취소</button>
               </div>
            </div>
         </div>
        
      </div>

   
   </div>
   <!--   Core JS Files   -->
   <script src="../assets/js/core/jquery.3.2.1.min.js"></script>
   <script src="../assets/js/core/popper.min.js"></script>
   <script src="../assets/js/core/bootstrap.min.js"></script>

   <!-- jQuery UI -->
   <script
      src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
   <script
      src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

   <!-- jQuery Scrollbar -->
   <script
      src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

   <!-- Moment JS -->
   <script src="../assets/js/plugin/moment/moment.min.js"></script>

   <!-- Chart JS -->
   <script src="../assets/js/plugin/chart.js/chart.min.js"></script>

   <!-- jQuery Sparkline -->
   <script
      src="../assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

   <!-- Chart Circle -->
   <script src="../assets/js/plugin/chart-circle/circles.min.js"></script>

   <!-- Datatables -->
   <script src="../assets/js/plugin/datatables/datatables.min.js"></script>

   <!-- Bootstrap Notify -->
   <script
      src="../assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

   <!-- Bootstrap Toggle -->
   <script
      src="../assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

   <!-- jQuery Vector Maps -->
   <script src="../assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
   <script src="../assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

   <!-- Google Maps Plugin -->
   <script src="../assets/js/plugin/gmaps/gmaps.js"></script>

   <!-- Dropzone -->
   <script src="../assets/js/plugin/dropzone/dropzone.min.js"></script>

   <!-- Fullcalendar -->
   <script src="../assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

   <!-- DateTimePicker -->
   <script
      src="../assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

   <!-- Bootstrap Tagsinput -->
   <script
      src="../assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

   <!-- Bootstrap Wizard -->
   <script src="../assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

   <!-- jQuery Validation -->
   <script
      src="../assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

   <!-- Summernote -->
   <script src="../assets/js/plugin/summernote/summernote-bs4.min.js"></script>

   <!-- Select2 -->
   <script src="../assets/js/plugin/select2/select2.full.min.js"></script>

   <!-- Sweet Alert -->
   <script src="../assets/js/plugin/sweetalert/sweetalert.min.js"></script>

   <!-- Owl Carousel -->
   <script src="../assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

   <!-- Magnific Popup -->
   <script
      src="../assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

   <!-- Atlantis JS -->
   <script src="../assets/js/atlantis.min.js"></script>

   <!-- Atlantis DEMO methods, don't include it in your project! -->
   <script src="../assets/js/setting-demo.js"></script>
   <script src="../assets/js/demo.js"></script>
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