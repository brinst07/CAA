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
                                 <input type="text" class="form-control" id="member_id" name="member_id"
                                 value='<c:out value="${board.member_id }"/>' readonly="readonly">
                              </div>
                              <br><br>
                              <div class="card-body">
                  </div>
                           </div>
                        </form>
                     </div>
                     <div class="email-editor">
                     <div class="form-group row">
                              <label for="to" class="col-form-label col-md-1">내용 </label>
                              <div class="col-md-11">
                              <textarea class="form-control" rows="4" name="board_content" id="board_content" readonly="readonly"><c:out value="${board.board_content }"></c:out> </textarea>
                              </div>
                           </div>
                           
                           
                           
                           
                           
                           <form action="upload.php" class="dropzone" enctype="multipart/form-data" method="post">
                        <div class="dz-message" data-dz-message>
                           
                           <h4 class="message">첨부파일</h4>
                        </div>
                       <div>
                           <input name="uploadFile" type="file" multiple />
                        </div>
                     </form>
                        <div class="email-action">
                           <button class="btn btn-default" onclick="location.href='/notice/modify?board=<c:out value="${board.board_id }"/>'">수정</button>
                           <button class="btn btn-info" onclick="location.href='/notice/noticeList'">목록</button>
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
   <script src="../assets	/js/setting-demo.js"></script>
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
   
   <script type="text/javascript">
   
//    <!-- 파일 업로드를 위한 코드-->
   <?php
   if (isset($_FILES)) {
       $file = $_FILES["file"];
       // print_r($file);
       $error = $file["error"];
       $name = $file["name"];
       $type = $file["type"];
       $size = $file["size"];
       $tmp_name = $file["tmp_name"];
       if ( $error > 0 ) {
           echo "Error: " . $error . "<br>";
       }
       else {
         echo "Upload: " . $name . "<br>";
         echo "Type: " . $type . "<br>";
         echo "Size: " . ($size/1024/1024) . " Mb<br>";
         echo "Stored in: " . $tmp_name;
       }
   }
   else {
       echo "File is not selected";
   }
   ?>

//    <!-- 파일 업로드를 제한코드-->
   <?php
   $allowedExts = array("gif", "jpeg", "jpg", "png");

   if (isset($_FILES)) {
       $file = $_FILES["file"];
       $error = $file["error"];
       $name = $file["name"];
       $type = $file["type"];
       $size = $file["size"];
       $tmp_name = $file["tmp_name"];
      
       if ( $error > 0 ) {
           echo "Error: " . $error . "<br>";
       }
       else {
           $temp = explode(".", $name);
           // print_r($temp);
           $extension = end($temp);
           //echo $extension;
          
           if ( ($size/1024/1024) < 2.) && in_array($extension, $allowedExts) ) {
               echo "Upload: " . $name . "<br>";
               echo "Type: " . $type . "<br>";
               echo "Size: " . ($size/1024/1024) . " Mb<br>";
               echo "Stored in: " . $tmp_name;
           }
           else {
               echo ($size/1024/1024) . " Mbyte is bigger than 2 Mb ";
               echo $extension . "format file is not allowed to upload ! ";
           }
       }
   }
   else {
       echo "File is not selected";
   }
   ?>
//    <!-- 파일 업로드를 임시복사본-->
   <?php
   $allowedExts = array("gif", "jpeg", "jpg", "png");

   if (isset($_FILES)) {
       $file = $_FILES["file"];
       $error = $file["error"];
       $name = $file["name"];
       $type = $file["type"];
       $size = $file["size"];
       $tmp_name = $file["tmp_name"];
      
       if ( $error > 0 ) {
           echo "Error: " . $error . "<br>";
       }
       else {
           $temp = explode(".", $name);
           $extension = end($temp);
          
           if ( ($size/1024/1024) < 2. && in_array($extension, $allowedExts) ) {
               //echo "Upload: " . $name . "<br>";
               //echo "Type: " . $type . "<br>";
               //echo "Size: " . ($size / 1024 / 1024) . " Mb<br>";
               //echo "Stored in: " . $tmp_name;
               if (file_exists("upload/" . $name)) {
                   echo $name . " already exists. ";
               }
               else {
                   move_uploaded_file($tmp_name, "upload/" . $name);
                   echo "Stored in: " . "upload/" . $name;
               }
           }
           else {
               echo ($size/1024/1024) . " Mbyte is bigger than 2 Mb ";
               echo $extension . "format file is not allowed to upload ! ";
           }
       }
   }
   else {
       echo "File is not selected";
   }
   ?>

</script>

</body>
</html>