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

			<a href="index.html" class="logo"> <img
				src="../assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
			</a>
			<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="collapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
				</span>
			</button>
			<button class="topbar-toggler more">
				<i class="icon-options-vertical"></i>
			</button>
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
									<i class="flaticon-round mr-1"></i> QnA
								</h2>
							</div>
							<div class="email-compose-fields">



								<form id="qnaModify" role="form" action="/qna/modify" method="post">


									<div class="form-group row">
										<label for="to" class="col-form-label col-md-1">제목 </label>
										<div class="col-md-11">
											<input type="text" class="form-control" id="board_title"
												name="board_title"
												value='<c:out value="${board.board_title }"/>'>
												<input type="hidden" id="board_id" name="board_id" value='<c:out value="${board.board_id}"/>'>
										</div>
									</div>
									<div class="form-group row">
										<label for="cc" class="col-form-label col-md-1">작성자 </label>
										<div class="col-md-11">
											<input type="text" class="form-control" id="member_id"
												name="member_id"
												value='<c:out value="${board.member_id }"/>'
												readonly="readonly">
										</div>



										<br> <br>
										<div class="card-body">

											<div class="form-group row">
												<label for="to" class="col-form-label col-md-1">내용 </label>
												<div class="col-md-11">
												
												<textarea id="editor" name="board_content"></textarea>
												
												
													<%-- <input type="text" class="form-control" id="title" name="title"
                                 value='<c:out value="${board.board_content }"/>' readonly="readonly"> --%>
													<%-- <textarea class="form-control" rows="3" name='board_content'><c:out value="${board.board_content }" /></textarea> --%>
												</div>
											</div> 

											<form action="upload.php" class="dropzone">
												<div class="dz-message" data-dz-message>

													<label for="cc" class="col-form-label col-md-1">첨부파일
													</label>
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
								<div id="editor"></div>
								<div class="email-action">
									<button type="submit" data-oper='modify' class="btn btn-primary">확인</button>


									<button type="submit" data-oper='remove' class="btn btn-black">삭제</button>
									<button data-oper='list' class="btn btn-black"
										onclick="location.href='/qna/list'">목록</button>



									<form id="operForm" actions="/qna/modify" method="post">
										<%-- <input type="hidden" id="board_id" name="board_id" value='<c:out value="${board.board_id }"/>'> --%>

									</form>




									<%-- <form id='operform' action="/qna/modify" method="get">
                           	<input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
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
				<a href="#" class="close-quick-sidebar"> <i
					class="flaticon-cross"></i>
				</a>


				<div class="messages-form">
					<div class="messages-form-control">
						<input type="text" placeholder="Type here"
							class="form-control input-pill input-solid message-input">
					</div>
					<div class="messages-form-tool">
						<a href="#" class="attachment"> <i class="flaticon-file"></i>
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
	<script
		src="../assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="../assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<!-- Bootstrap Toggle -->
	<script
		src="../assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
	<!-- jQuery Scrollbar -->
	<script
		src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<script src="../assets/js/plugin/summernote/summernote-bs4.min.js"></script>
	<!-- Atlantis JS -->
	<script src="../assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="../assets/js/setting-demo.js"></script>
	<script>
		$('#editor').summernote('code', '${board.board_content}');
		
		$('#editor').val("${board.board_content}");
		$('#editor').summernote(
				{
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New' ],
					tabsize : 2,
					height : 300,
					callbacks: {
						onImageUpload: function(files, editor, welEditable) {
							for(var i = files.length -1; i >= 0; i--){
								sendFile(files[i], this);
							}
						}
					}
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
                   formObj.attr("action", "/qna/remove");
                } else if (operation === 'list') {
                   // move to list
                   self.location = "/qna/list";
                   return;
                }
                formObj.submit();
             });
          });
         
         $(document).ready(function() {

//              var formObj = $("form");
            var formObj = $("#qnaModify");

             $('button').on("click", function(e) {

                e.preventDefault();

            var operation = $(this).data("oper");
            

                console.log(operation);

                if (operation === 'modify') {
                   formObj.attr("action", "/qna/modify");
                } else if (operation === 'list') {
                   // move to list
                   self.location = "/qna/list";
                   return;
                }
                formObj.submit();
             });
          });

      });
   </script>
   

	<!-- <script type="text/javascript">
		$(document).on('click', '#modify', function() {
			var url = "qna/modify";
			url = url + "?board_id=" + $
			{
				board.board_id
			}
			;
			url = url + "&mode=edit"

			location.href = url;
		})
	</script> -->

	<!-- <script type="text/javascript">
   $(document).ready(function(){
	 
	   var operForm = $("#operForm");
	   
	   $("button[data-oper='modify']").on("click", function(e){
		   
		   operForm.attr("action", "/qna/modify").submit();
	   });
	   
	   $("button[data-oper='list']").on("click", function(e){
		 
		   openForm.find("board_id").remove();
		   openForm.attr("action", "/qna/list")
		   openForm.submit();
	   });
	   
   }); -->



</body>
</html>






























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/board/modify" method="post">
        
        <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'/>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'/>
        <input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'/>
        <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'/>
        
          <div class="form-group">
            <label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${board.bno} "></c:out> 'readonly="readonly">
          </div>

          <div class="form-group">
            <label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title} "></c:out> '>
          </div>
          
          <div class="form-group">
            <label>Text area</label>
            <textarea class="form-control" rows="3" name='content' ><c:out value="${board.content }"></c:out></textarea>
          </div>

          <div class="form-group">
            <label>Writer</label> <input class="form-control" name='writer' value='<c:out value="${board.writer }"></c:out> 'readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>Writer</label> <input class="form-control" name='regDate' value='<fmt:formatDate value="${board.regdate}" pattern="yyyy/MM/dd"/> 'readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>Writer</label> <input class="form-control" name='updateDate' value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy/MM/dd"/> 'readonly="readonly">
          </div>

          <button type="submit" class="btn btn-default" data-oper="modify">Modify</button>
          <button type="submit" class="btn btn-danger" data-oper="remove">Remove</button>
          <button type="submit" class="btn btn-info" data-oper="list">List</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<script type="text/javascript">
$(function(){
	var formObj = $('form');
	
	$('button').on('click', function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		} else if (operation === 'list'){
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();
	});
});

</script>

 --%>