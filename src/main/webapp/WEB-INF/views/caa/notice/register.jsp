<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.filebox input[type="file"] { 
				position: absolute; 
				width: 1px; 
				height: 1px; 
				padding: 0; 
				margin: -1px; 
				overflow: hidden; 
				clip:rect(0,0,0,0); 
				border: 0; } 
.filebox label { 
				display: inline-block; 
				padding: .5em .75em; 
				color: #999; 
				font-size: inherit; 
				line-height: normal; 
				vertical-align: middle; 
				background-color: #fdfdfd; 
				cursor: pointer; 
				border: 1px solid #ebebeb; 
				border-bottom-color: #e2e2e2; 
				border-radius: .25em; } 
/* named upload */ 
.filebox .upload-name { 
				display: inline-block; 
				padding: .5em .75em; 
/* label의 패딩값과 일치 */ 
				font-size: inherit; 
				font-family: inherit; 
				line-height: normal; 
				vertical-align: middle; 
				background-color: #f5f5f5;
				 border: 1px solid #ebebeb; 
				 border-bottom-color: #e2e2e2; 
				 border-radius: .25em; 
				 -webkit-appearance: none; 
				 /* 네이티브 외형 감추기 */ 
				 -moz-appearance: none; 
				 appearance: none; }

    .filebox label {
        display: inline-block;
        padding: .5em .75em;
        color: #999;
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: #fdfdfd;
        cursor: pointer;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
    }

    /* named upload */
    .filebox .upload-name {
        display: inline-block;
        padding: .5em .75em; /* label의 패딩값과 일치 */
        font-size: inherit;
        font-family: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: #f5f5f5;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
        -webkit-appearance: none; /* 네이티브 외형 감추기 */
        -moz-appearance: none;
        appearance: none;
    }


    /* imaged preview */
    .filebox .upload-display { /* 이미지가 표시될 지역 */
        margin-bottom: 5px;
    }

    @media (min-width: 768px) {
        .filebox .upload-display {
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 0;
        }
    }

    .filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
        display: inline-block;
        width: 54px;
        padding: 2px;
        vertical-align: middle;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #fff;
    }

    .filebox .upload-display img { /* 추가될 이미지 */
        display: block;
        max-width: 100%;
        width: 100% \9;
        height: auto;
    }

</style>

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
                                <button id="registerButton" data-oper='register' type="button" class="btn btn-default">
                                    등록
                                </button>
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
                                                    <c:out value="${board.member_id }"></c:out>
                                                </p>
                                            </div>

                                        </div>

                                        <div class="separator-solid"></div>
                                        <h5 class="sub">내용</h5>
                                        <div id="summernote">
                                            <%--                                        <textarea class="form-control" rows="4" id="board_content" name="board_content" ></textarea>--%>
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


                                    <div class="filebox preview-image uploadDiv">
                                        <%--                                        <input class="upload-name" value="파일선택" multiple>--%>
                                        <label for="input-file">업로드</label>
                                        <input type="file" id="input-file" class="upload-hidden" name="uploadFile"
                                               multiple>
                                        <div class="uploadResult">
                                            <ul>

                                            </ul>
                                        </div>
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


        $('#registerButton').on('click', function () {

            const bo_content = $('#summernote').summernote('code');


        })

        // $('.register').ready(function () {
        //
        //     var operForm = $("#operForm");
        //
        //     var textareaVal = $("textarea[name=board_content]").text();
        //
        //     console.log("내용로그 " + textareaVal);
        //
        //     $("button[data-oper='register']").on("click", function (e) {
        //
        //         e.preventDefault();
        //
        //         console.log("Submit clicked");
        //
        //         operForm.attr("action", "/notice/register").submit();
        //     });
        // });
    });

</script>


<script type="text/javascript">
    var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
    var maxSize = 5242880; // 5MB

    function checkExtension(fileName, fileSize) {
        if (fileSize >= maxSize) {
            alert("파일 사이즈 초과");
            return false;
        }

        if (regex.test(fileName)) {
            alert("해당 종류의 파일은 업로드 할 수 없습니다.");
            return false;
        }
        return true;
    }

    // Ajax File Upload
    $(document).ready(function () {
        $("#uploadBtn").on("click", function (e) {
            var formData = new FormData();

            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

//             // file 상태 확인
//             console.log(files);

            //add filedata to formdata
            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }

                formData.append("uploadFile", files[i]);
            }


            $.ajax({
                url: 'rest/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: 'json',
                success: function (result) {
                    console.log(result);

                    showUploadFile(result);

                    $(".uploadDiv")
                }

            }) // ajax File

        })

            var uploadResult = $('.uploadResult ul');
        function showUploadFile(uploadResultArr) {


            var str = "";

            $(uploadResultArr).each(function (i, obj) {
                str += "<li>" + obj.fileName + "</li>";
            });

            uploadResult.append(str);
        }




    })// ready

    //preview image
    var imgTarget = $('.preview-image .upload-hidden');
    imgTarget.on('change', function () {
        var parent = $(this).parent();
        parent.children('.upload-display').remove();
        if (window.FileReader) { //image 파일만 if (!$(this)[0].files[0].type.match(/image\//)) return;
            var reader = new FileReader();
            reader.onload = function (e) {
                var src = e.target.result;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
        }
    });
</script>
