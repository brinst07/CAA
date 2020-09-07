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
<!--                                 <button data-oper='register' type="button" id="registerButton" -->
<!--                                         class="btn btn-light btn-border">등록 -->
<!--                                 </button> -->
<!--                                 <a href="/notice/noticeList" class="btn btn-primary ml-2"> 취소 </a> -->
                                <button data-oper='register' type="submit" class="btn btn-default">등록</button>
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
                                                   placeholder="제목을 입력해주세요!" required>

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
                                        <div id="summernote" name="board_content"> 
                                        <textarea class="form-control" rows="4" id="board_content" name="board_content" ></textarea>
                                        </div>


                                    </div>

                                </div>

                            </div>
                        </div>
                    </form>

                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10 col-xl-9">

                    <div class="row align-items-center">


                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-invoice">
                                <div class="card-header">
                                    <h5 class="sub">Files</h5>

                                </div>
                                <div class="card-body">


                                    <div class="separator-solid"></div>
                                    <%--                                    <h5 class="sub">파일</h5>--%>
                                    <div class="uploadDiv">
                                        <input type="file" name="uploadFile" multiple>

                                    </div>
                                    <button id="uploadBtn">uplaod</button>

                                    <div style="padding-bottom: 50px"></div>

                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>


    </div>
</div>


<script>


    $(function () {
        $('#summernote').summernote({
            placeholder: 'Atlantis',
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New'],
            tabsize: 2,
            height: 300
        });

//         $('#registerButton').on('click', function () {

//             const summerNoteTransfer = $('#summernote').summernote('code', $("div[name=board_content]").text());

//             const summ = document.getElementsByName('board_content')[1].textContent;
//             const asdf = document.getElementsByName('board_content');


//         })

              $('.register').ready(function() {

         var operForm = $("#operForm");
         
         var textareaVal = $("textarea[name=board_content]").text();

         console.log("내용로그 "+textareaVal);

         $("button[data-oper='register']").on("click", function(e) {
        	 
        	 e.preventDefault();
			
			console.log("Submit clicked");
         
            operForm.attr("action", "/notice/register").submit();
         });

    });


</script>

<script integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

<script type="text/javascript">
    // Ajax File Upload
    $(document).ready(function () {
        $("#uploadBtn").on("click", function (e) {
            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

            // file 상태 확인
            console.log(files);

            //add filedata to formdata
            for (var i = 0; i < files.length; i++) {
                formData.append("uploadFile", files[i]);
            }


            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                success: function (result) {
                    console.log(result);
                }

            }) // ajax File

        })
    })// ready


</script>
