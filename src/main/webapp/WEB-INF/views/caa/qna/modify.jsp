<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<body>
	<div class="main-panel full-height">
		<div class="container">
			<div class="page-inner">
				<div class="row justify-content-center">
					<div class="col-12 col-lg-10 col-xl-9">

						<form id="qnaModify" role="form" action="/qna/modify" method="post">

							<div class="row align-items-center">
								<div class="col">
									<h4 class="page-title">QnA</h4>
									<h6 class="page-pretitle">Questions and Answers</h6>
								</div>




								<div class="col-auto">
									<button type="submit" data-oper='modify' class="btn btn-light btn-border">확인</button>
									<button type="submit" data-oper='remove' class="btn btn-light btn-border">삭제</button>
									<a href="/qna/list" class="btn btn-primary ml-2"> 취소 </a>
								</div>
							</div>
							<div class="page-divider"></div>
							<div class="row">
								<div class="col-md-12">
									<div class="card card-invoice">
										<div class="card-header">
											<h5 class="sub">제목</h5>
											<div class="invoice-header">

												<input type="text" class="form-control" id="board_title"
													name="board_title"
													value='<c:out value="${board.board_title }"/>'>
												<input type="hidden" id="board_id" name="board_id" value='<c:out value="${board.board_id}"/>'>
											</div>
										</div>
										<div class="card-body">
											<div class="separator-solid"></div>
											<div class="row">
												<div class="col-md-8 info-invoice">
													<h5 class="sub">날짜</h5>
													<p>
														<c:out value="${board.board_datetime }"></c:out>
													</p>
												</div>
												<div class="col-md-8 info-invoice">
													<h5 class="sub">작성자</h5>
													<p>
														<c:out value="${board.member_username }"></c:out>
													</p>
												</div>

											</div>

											<div class="separator-solid"></div>
											<h5 class="sub">내용</h5>
											<div style="height: 300px;">

												<textarea id="editor" name="board_content"></textarea>

											</div>


										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>






</body>


<script>
	$('#editor').summernote('code', '${board.board_content}');

	$('#editor').val("${board.board_content}");
	$('#editor').summernote({
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
		tabsize : 2,
		height : 600,
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	});
	
	
	
</script>
				
				
	

<script type="text/javascript">
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
         
</script>

			
<script type="text/javascript">
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

   </script>



<%-- <body>
	<div class="wrapper sidebar_minimize fullheight-side">
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

									</form>




								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
			
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
</body> --%>


</html>









