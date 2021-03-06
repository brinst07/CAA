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
						<form id="operForm" role="form" action="/qna/reply" method="post">
							<div class="row align-items-center">
								<div class="col">
									<h4 class="page-title">QnA 답변</h4>
									<h6 class="page-pretitle">Questions and Answers</h6>
								</div>



							<div class="col-auto">
								 <!-- <button type="button" class="btn black mr5" onclick="javascript:goBoardList();">목록으로</button> -->
								 <a href="/qna/list" class="btn btn-light btn-border"> 목록 </a>
                				 <!-- <button type="button" class="btn black" onclick="javascript:insertBoardReply();">등록하기</button> -->
								 <button data-oper='reply' type="button" class="btn btn-primary ml-2">등록</button>
										
								<!-- <button data-oper='register' type="button"
										class="btn btn-light btn-border">등록</button>
								<a href="/qna/list" class="btn btn-primary ml-2"> 취소 </a> -->
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
												   name="board_title">

										</div>
									</div>
									<div class="card-body">
										<div class="separator-solid"></div>
										<div class="row">

											<div class="col-md-8 info-invoice">
												<h5 class="sub">작성자</h5>
												<p>
													<c:out value="${member.member_username }"></c:out>
													<input type="hidden" name="member_id" id="member_id" value="${member.member_id}">
												</p>
											</div>
											<%-- <div class="col-md-8 info-invoice">
												<!-- <h5 class="sub">글 번호</h5> -->
												<p>
													<%= request.getParameter("board_id") %>
													<c:out value="${param.board_id }"></c:out>
												</p>
											</div>

											<div class="col-md-8 info-invoice">
												<!-- <h5 class="sub">board_re_ref</h5> -->
												<p>
													<%= request.getParameter("board_re_ref") %>
													<c:out value="${param.board_re_ref }"></c:out>
													
												</p>
											</div> --%>
											</div>
											<div class="separator-solid"></div>
											<h5 class="sub">내용</h5>
											<div style="height: 500px;">
												<textarea id="editor" name="board_content"></textarea>


										</div>
											<input type="hidden" name="board_id" id="board_id" value="${param.board_id}">
											<input type="hidden" name="board_re_ref" id="board_re_ref" value="${param.board_re_ref}">
											<input type="hidden" name="board_originno" id="board_originno" value="${board_id}">	
											
																							
											<%-- <input type="hidden" name="board_re_ref" id="board_re_ref" value="${board_re_ref}">
											<input type="hidden" name="board_re_lev" id="board_re_lev" value="${board_re_lev}">
											<input type="hidden" name="board_re_seq" id="board_re_seq" value="${board_re_seq}"> --%>
																								
											
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

	/* $('#editor').summernote('code', '${board.board_content}');

	$('#editor').val("${board.board_content}");
	$('#editor').summernote({
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
		tabsize : 2,
		height : 500,

		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	}); */
	
	$(document).ready(function() {
		$('textarea[name="board_content"]').val('');
		
	    $('textarea[name="board_content"]').summernote({
	      height: 320
	    });
	      $('textarea[name="board_content"]').summernote("code", "");
	      
	      
	      
	    var boardid = $("#board_id").val();
	  	var board_re_ref = Number(boardid);
		
	  	console.log(boardid);
	  	console.log(board_re_ref);

	  });
	
	
	
	
</script>





<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		var textareaVal = $("textarea[name=board_content]").text();

		console.log(textareaVal);

		$("button[data-oper='reply']").on("click", function(e) {

			console.log("Submit clicked");

			operForm.attr("action", "/qna/reply").submit();

		});
		
		/** 게시판 - 목록 페이지 이동 */
	    function goBoardList(){                
	        location.href = "/qna/list";
	    }

	});
</script>



