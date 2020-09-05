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
                          method="post">
                        <div class="row align-items-center">
                            <div class="col">
                                <h4 class="page-title">NOTICE</h4>
                                <h6 class="page-pretitle">공지사항</h6>
                            </div>


                            <div class="col-auto">
                                <button data-oper='register' type="button"
                                        class="btn btn-light btn-border">등록
                                </button>
                                <a href="/notice/noticeList" class="btn btn-primary ml-2"> 취소 </a>
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
                                                    <c:out value="${board.member_id }"></c:out>
                                                </p>
                                            </div>

                                        </div>

                                        <div class="separator-solid"></div>
                                        <h5 class="sub">내용</h5>
                                        <div style="height: 500px;">

                                            <textarea id="summernote" name="board_content"></textarea>

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
    $(function () {


        <%--$('#editor').summernote('code', '${board.board_content}');--%>

        <%--$('#editor').val("${board.board_content}");--%>
        // $('#editor').summernote({
        //     height: 200,                 // 에디터 높이
        //     minHeight: 300,             // 최소 높이
        //     maxHeight: 300,             // 최대 높이
        //     focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        //     lang: "ko-KR",					// 한글 설정
        //     placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
        //     callbacks: {	//여기 부분이 이미지를 첨부하는 부분
        //         onImageUpload: function (files) {
        //             uploadSummernoteImageFile(files[0], this);
        //         }
        //     }
        //
        // });
    });

    // $('div[name=board_content]').


</script>

<script type="text/javascript">
    $(function(){
        $('#summernote').summernote({
            height: 300,
            fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
            fontNamesIgnoreCheck : [ '맑은고딕' ],
            focus: true,

            callbacks: {
                onImageUpload: function(files, editor, welEditable) {
                    for (var i = files.length - 1; i >= 0; i--) {
                        sendFile(files[i], this);
                    }
                }
            }

        });

    })

    function sendFile(file, el) {
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
            data: form_data,
            type: "POST",
            url: './profileImage.mpf',
            cache: false,
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function(img_name) {
                $(el).summernote('editor.insertImage', img_name);
            }
        });
    }


</script>


<script type="text/javascript">
    $(document).ready(function () {

        var operForm = $("#operForm");

        var textareaVal = $("textarea[name=board_content]").text();

        console.log(textareaVal);

        $("button[data-oper='register']").on("click", function (e) {

            console.log("Submit clicked");

            operForm.attr("action", "/notice/register").submit();

        });

    });
</script>


