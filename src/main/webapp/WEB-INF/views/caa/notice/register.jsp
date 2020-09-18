<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="main-panel full-height">
    <div class="container">
        <div class="page-inner">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10 col-xl-9">
                    <form id="operForm" role="form" action="/notice/register"
                          method="post" enctype="multipart/form-data">
                        <div class="row align-items-center">
                            <div class="col">
                                <h4 class="page-title">NOTICE</h4>
                                <h6 class="page-pretitle">공지사항</h6>
                            </div>


                            <div class="col-auto">
                                <button id="registerButton" data-oper='register' type="button" class="btn btn-default">등록</button>
                                <button class="btn btn-info" onclick="location.href='/notice/noticeList'">목록</button>
                            </div>
                        </div>
                        <div class="page-divider"></div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-invoice">
                                    <div class="card-header">
                                        <h5 class="sub">제목</h5>
                                        <div class="invoice-header">

                                            <input type="text" class="form-control" id="board_title" name="board_title"
                                                   placeholder="제목을 입력해주세요" required>

                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="separator-solid"></div>
                                        <div class="row">

                                            <div class="col-md-8 info-invoice">
                                                <h5 class="sub">작성자</h5>
                                                <p>
                                                    <c:out value="${board.member_username }"></c:out>
                                                </p>
                                            </div>

                                        </div>

                                        <div class="separator-solid"></div>
                                        <h5 class="sub">내용</h5>
                                        <div id="summernote">
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


<script>

$('#editor').summernote('code', '${board.board_content}');

$('#editor').val("${board.board_content}");
    $(function () {
        $('#summernote').summernote({
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
            tabsize: 2,
            height: 300
        });
      
	$('#summernote').summernote({
					height: 300,                 // 에디터 높이
					minHeight: null,             // 최소 높이
					maxHeight: null,             // 최대 높이
					focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
					lang: "ko-KR",					// 한글 설정
					placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
					callbacks: {	//여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files) {
							uploadSummernoteImageFile(files[0],this);
						}
					}
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


        $('#registerButton').on('click', function (e) {

            e.preventDefault();

            var operForm = $("#operForm");

            const bo_content = $('#summernote').summernote('code');
            
            const board_content = $("<input type='hidden' name='board_content' value='" + bo_content + "'/>");

            const member_id = $("<input type='hidden' name='member_id' value='"+ ${member.member_id} +"'/>");

            operForm.append(board_content);
            operForm.append(member_id);

            operForm.attr("action", "/notice/register").submit();

        })
    });

</script>



