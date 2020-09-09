<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="main-panel full-height">
	<div class="container">
		<div class="page-inner">
		<form id="operForm" action="/notice/modify" method="post" enctype="multipart/form-data">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-10 col-xl-9">
					<div class="row align-items-center">
						<div class="col">
							<h4 class="page-title">공지사항</h4>
							<h6 class="page-pretitle">Notice</h6>
						</div>
						<div class="col-auto">
							<button id="modify" data-oper='modify' type="button" class="btn btn-light btn-border">확인</button>
                          	<button id="remove"  data-oper='remove' type="submit" class="btn btn-light btn-border">삭제</button> 
                        	<button  data-oper='list' class="btn btn-primary ml-2" onclick="location.href='/notice/noticeList'">목록</button> 
						</div>
					</div>
					<div class="page-divider"></div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-invoice ">
								<div class="card-header">
									<div class="invoice-header">
										<h5 class="invoice-header head-title"><b>제목</b></h5> 
									</div>
									<div class="invoice-title">
										 <input type="text" class="form-control" id="board_title" name="board_title" value='<c:out value="${board.board_title }"/>'>
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
												<c:out value="${board.member_id }"></c:out>
											</p>
										</div>

									</div>

									<div class="separator-solid"></div>
									<h5 class="sub">내용</h5>
										<div id="summernote">${board.board_content}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>

</div>

<script> 
$('#summernote').summernote({
	placeholder: '',
	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
	tabsize: 2,
	height: 300
});

     /**
     * 이미지 파일 업로드
     */
     	function uploadSummernoteImageFile(file, editor) {
     		data = new FormData();
     		data.append("file", file);
     		$.ajax({
     			data : data,
     			type : "POST",
     			url : "/uploadSummernoteImageFile",
     			contentType : false,
     			processData : false,
     			success : function(data) {
     	        	//항상 업로드된 파일의 url이 있어야 한다.
     				$(editor).summernote('insertImage', data.url);
     			}
     		});
     	}
    
     $(document).ready(function() {

         var formObj = $("form");

         $('#remove').on("click", function(e) {

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
    


$('#modify').on('click', function (e) {

            e.preventDefault();

            var operForm = $("#operForm");

            const bo_content = $('#summernote').summernote('code');
            
            const board_content = $("<input type='hidden' name='board_content' value='" + bo_content + "'/>");

            operForm.append(board_content);

            operForm.attr("action", "/notice/modify").submit();

        })
</script> 









