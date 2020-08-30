<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
      <div class="logo-header position-fixed" data-background-color="blue">

         <a href="index.html" class="logo">
            <img src="/resources/assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
         </a>
         <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon">
               <i class="icon-menu"></i>
            </span>
         </button>
         <button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
         <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar">
               <i class="icon-menu"></i>
            </button>
         </div>
      </div>
      <!-- End Logo Header -->

      

      

      <div class="main-panel full-height">
         <div class="container container-full">
            <div class="page-inner">
               <div class="page-with-aside mail-wrapper bg-white">
                  <div class="page-content mail-content">
                     <div class="email-head d-lg-flex d-block">
                        <h2>
                           <i class="flaticon-round mr-1"></i>
                           QnA
                        </h2>
                     </div>
                     <div class="email-compose-fields">
                        <form>
                           <div class="form-group row">
                              <label for="to" class="col-form-label col-md-1">제목 </label>
                              <div class="col-md-11">
                                 <input type="text" class="form-control" id="title" name="title"
                                 value='<c:out value="${board.board_title }"/>' readonly="readonly">
                              </div>
                           </div>
                           <div class="form-group row">
                              <label for="cc" class="col-form-label col-md-1">작성자 </label>
                              <div class="col-md-11">
                                 <input type="text" class="form-control" id="cc" name="cc"
                                 value='<c:out value="${board.member_id }"/>' readonly="readonly">
                              </div>
                              
                              
                              
                              <br><br>
                              <div class="card-body">
                              
                              <div class="form-group row">
                              <label for="to" class="col-form-label col-md-1">내용 </label>
                              <div class="col-md-11">
                                 <%-- <input type="text" class="form-control" id="title" name="title"
                                 value='<c:out value="${board.board_content }"/>' readonly="readonly"> --%>
                                 <textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.board_content }" />
                                 </textarea>
                              </div>
                           </div>
                              
                     <form action="upload.php" class="dropzone">
                        <div class="dz-message" data-dz-message>
                           
                           <label for="cc" class="col-form-label col-md-1">첨부파일 </label>
                           <h4 class="message">첨부파일</h4>
                        </div>
                        <div class="fallback">
                           <input name="file" type="file" multiple />
                        </div>
                     </form>
                  </div>
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                           </div>
                        </form>
                     </div>
                     
                     
                     
                     
                     <div class="email-editor">
                        <div id="editor"></div>
                        <div class="email-action">
                           <button data-oper='modify' class="btn btn-primary" onclick="location.href='/qna/modify?board=<c:out value="${board.board_id }"/>'">수정</button>
                           
                           
                           
                           <!-- <button class="btn btn-black">삭제</button> -->
                           <button data-oper='list' class="btn btn-black" onclick="location.href='/qna/list'">목록</button>
                           
                           <%-- <form id='operform' action="/qna/modify" method="get">
                           	<input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- <footer class="footer">
            <div class="container-fluid">
               <nav class="pull-left">
                  <ul class="nav">
                     <li class="nav-item">
                        <a class="nav-link" href="http://www.themekita.com">
                           ThemeKita
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">
                           Help
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">
                           Licenses
                        </a>
                     </li>
                  </ul>
               </nav>
                           
            </div>
         </footer>
      </div> -->
      <div class="quick-sidebar">
         <a href="#" class="close-quick-sidebar">
            <i class="flaticon-cross"></i>
         </a>
         
                  
                     <div class="messages-form">
                        <div class="messages-form-control">
                           <input type="text" placeholder="Type here" class="form-control input-pill input-solid message-input">
                        </div>
                        <div class="messages-form-tool">
                           <a href="#" class="attachment">
                              <i class="flaticon-file"></i>
                           </a>
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
   <script src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
   <script src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
   <!-- Bootstrap Toggle -->
   <script src="../assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
   <!-- jQuery Scrollbar -->
   <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
   <script src="../assets/js/plugin/summernote/summernote-bs4.min.js"></script>
   <!-- Atlantis JS -->
   <script src="../assets/js/atlantis.min.js"></script>
   <!-- Atlantis DEMO methods, don't include it in your project! -->
   <script src="../assets/js/setting-demo.js"></script>
   <!-- <script>
      $('#editor').summernote({
         fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
         tabsize: 2,
         height: 300
      });
   </script> -->
   
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
   
   
   <script type="text/javascript">
   $(document).ready(function(){
	 
	   var operForm = $("#operForm");
	   
// 	   $("button[data-oper='modify']").on("click", function(e){
		   
// 		   operForm.attr("action", "/qna/modify").submit();
// 	   });
	   
	   $("button[data-oper='list']").on("click", function(e){
		 
		   operForm.find("#board_id").remove();
		   operForm.attr("action", "/qna/list")
		   operForm.submit();
	   });
	   
   });
   
   </script>
   
</body>
</html>