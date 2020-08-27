<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
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
</script>

   <!-- CSS Files -->
   <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="../assets/css/atlantis.css">
   <!-- CSS Just for demo purpose, don't include it in your project -->
   <link rel="stylesheet" href="../assets/css/demo.css">
</head>
<body>
   <div class="wrapper sidebar_minimize fullheight-side">
      <!-- Logo Header -->
      <div class="logo-header position-fixed" data-background-color="blue">

         <a href="index.html" class="logo">
            <img src="../assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
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
                          		 공지사항
                        </h2>
                     </div>
                     
                    
                     
                     <div class="email-compose-fields">
                         <form role="form" action="/notice/modify" method="post">
                           <div class="form-group row">
                              <label for="to" class="col-form-label col-md-1">제목 </label>
                              <div class="col-md-11">
                                 <input type="text" class="form-control" id="board_title" name="board_title"
                                 value='<c:out value="${board.board_title }"/>'>
                              </div>
                           </div>
                           <div class="form-group row">
                              <label for="cc" class="col-form-label col-md-1">작성자 </label>
                              <div class="col-md-11">
                                 <input type="text" class="form-control" id="member_id" name="member_id"
                                 value='<c:out value="${board.member_id }"/>' readonly="readonly">
                              </div>
                              <br><br>
                              <div class="card-body">
                     <form action="upload.php" class="dropzone">
                        <div class="dz-message" data-dz-message>
                           
                           <h4 class="message">첨부파일</h4>
                        </div>
                        <div class="fallback">
                           <input name="file" type="file" multiple />
                        </div>
                     </form>
                  </div>
                           </div>
                     </div>
                     <div class="email-editor">
                        <div id="editor" name="board_content">${board.board_content} </div>
                        <div class="email-action">
                           <button data-oper='modify' type="submit" class="btn btn-default">확인</button>
                           <button data-oper='remove' type="submit" class="btn btn-primary">삭제</button>
                           <button data-oper='list' class="btn btn-info" onclick="location.href='/notice/noticeList'">목록</button>
                           <form id='operForm' action="/notice/modify" method="post">
                           <input type='hidden' id="board_id" name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form>
                        </div>
                      </div>
                  </div>
               </div>
            </div>
         </div>
      </form>
      <div class="quick-sidebar">
         <a href="#" class="close-quick-sidebar">
            <i class="flaticon-cross"></i>
         </a>
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

         $(document).ready(function() {

             var formObj = $("form");

             $('button').on("click", function(e) {

                e.preventDefault();

                var operation = $(this).data("oper");

                console.log(operation);

                if (operation === 'remove') {
                   formObj.attr("action", "/notice/remove");
                } else if (operation === 'list') {
                   // move to list
                   self.location = "/notice/noticeList";
                   return;
                }
                formObj.submit();
             });
          });
         
         $(document).ready(function() {

             var formObj = $("form");

             $('button').on("click", function(e) {

                e.preventDefault();

                var operation = $(this).data("oper");

                console.log(operation);

                if (operation === 'modify') {
                   formObj.attr("action", "/notice/modify");
                } else if (operation === 'list') {
                   // move to list
                   self.location = "/notice/noticeList";
                   return;
                }
                formObj.submit();
             });
          });

      });
   </script>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<title>공지사항 수정</title>
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
   <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="../assets/css/atlantis.css">
   <!-- CSS Just for demo purpose, don't include it in your project -->
   <link rel="stylesheet" href="../assets/css/demo.css">
</head>
<body>
   <div class="wrapper sidebar_minimize fullheight-side">
      <!-- Logo Header -->
      <div class="logo-header position-fixed" data-background-color="blue">

         <a href="index.html" class="logo">
            <img src="../assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
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
                           <i class="flaticon-pen mr-1"></i>
									공지사항 수정
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
                            </div>
                     <form action="upload.php" class="dropzone">
                        <div class="dz-message" data-dz-message>
                           
                           <h4 class="message">첨부파일</h4>
                        </div>
                        <div class="fallback">
                           <input name="file" type="file" multiple />
                        </div>
                     </form>
                        </form>
                     </div>
                     <div class="email-editor">
                        <div id="editor">${board.board_content}</div>
                        <div class="email-action">
                           <button data-oper='modify' class="btn btn-default" onclick="location.href='/notice/modifyNotice?board=<c:out value="${board.board_id }"/>'">수정</button>
                           <button class="btn btn-primary" color="red">삭제</button>
                           <button data-oper='list' class="btn btn-info" onclick="location.href='/notice/noticeList'">목록</button>
                           
                           <form id='operForm' action="/notice/modifyNotice" method="get">
                           <input type='hidden' id="board_id" name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form>
                           
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
        
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
   <script>`
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
   
 <script type="text/javascript">
   $(document).ready(function(){
	   var operForm = $("#operForm");
	   
	   $("button[data-oper='modify']").on("click",function(e){
		   operForm.attr("action","/notice/modifyNotice")
		   operForm.submit
	   });
	   
	   $("button[data-oper='list']").on("click",function(e){
		   operForm.find("#board_id").remove();
		   operForm.attr("action","/notice/noticeList")
		   operForm.submit
	   });
	   
   });
   </script> 
</body>
</html>