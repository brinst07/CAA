<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                        <form>
                            <div class="form-group row">
                                <label for="title" class="col-form-label col-md-1">제목 </label>
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


                                <br> <br>
                                <div class="card-body">

                                    <div class="form-group row">
                                        <label for="content" class="col-form-label col-md-1">내용 </label>
                                        <div class="col-md-11">
                                            <%-- <input type="text" class="form-control" id="title" name="title"
                                 value='<c:out value="${board.board_content }"/>' readonly="readonly"> --%>
                                            <textarea class="form-control" rows="3" name='content'
                                                      readonly="readonly"><c:out value="${board.board_content }"/>
                                 </textarea>
                                        </div>
                                    </div>

                                    <form action="upload.php" class="dropzone">
                                        <div class="dz-message" data-dz-message>

                                            <label for="cc" class="col-form-label col-md-1">첨부파일 </label>
                                            <h4 class="message">첨부파일</h4>
                                        </div>
                                        <div class="fallback">
                                            <input name="file" type="file" multiple/>
                                        </div>


                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="panel panel-default">

                                                    <div class="panel-heading">Files</div>
                                                    <!-- /.panel-heading -->
                                                    <div class="panel-body">

                                                        <div class='uploadResult'>
                                                            <ul>
                                                            </ul>
                                                        </div>

                                                    </div>
                                                    <!-- end panel-body -->
                                                </div>
                                                <!-- end panel-body -->
                                            </div>
                                            <!-- end panel -->
                                        </div>
                                        <!-- /.row -->


                                    </form>
                                </div>


                            </div>
                        </form>
                    </div>


                    <div class="email-editor">
                        <div id="editor"></div>
                        <div class="email-action">
                            <button data-oper='modify' class="btn btn-primary"
                                    onclick="location.href='/qna/modify?board=<c:out value="${board.board_id }"/>'">수정
                            </button>


                            <!-- <button class="btn btn-black">삭제</button> -->
                            <button data-oper='list' class="btn btn-black" onclick="location.href='/qna/list'">목록
                            </button>

                            <%-- <form id='operform' action="/qna/modify" method="get">
                               <input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</div>


<script type="text/javascript">
    $(document).ready(function () {

        var operForm = $("#operForm");

        // 	   $("button[data-oper='modify']").on("click", function(e){

        // 		   operForm.attr("action", "/qna/modify").submit();
        // 	   });

        $("button[data-oper='list']").on("click", function (e) {

            operForm.find("#board_id").remove();
            operForm.attr("action", "/qna/list")
            operForm.submit();
        });

    });
</script>

<script>
    $(document)
        .ready(
            function () {
                (function () {

                    var board_id = '<c:out value="${board.board_id}"/>';

                    $
                        .getJSON(
                            "/qna/getAttachList",
                            {
                                board_id: board_id
                            },
                            function (arr) {

                                console.log(arr);

                                var str = "";

                                $(arr)
                                    .each(
                                        function (i,
                                                  attach) {

                                            //image type
                                            if (attach.fileType) {
                                                var fileCallPath = encodeURIComponent(attach.uploadPath
                                                    + "/s_"
                                                    + attach.uuid
                                                    + "_"
                                                    + attach.fileName);

                                                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                                                str += "<img src='/display?fileName="
                                                    + fileCallPath
                                                    + "'>";
                                                str += "</div>";
                                                str
                                                + "</li>";
                                            } else {

                                                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
                                                str += "<span> "
                                                    + attach.fileName
                                                    + "</span><br/>";
                                                str += "<img src='/resources/img/attach.png'></a>";
                                                str += "</div>";
                                                str
                                                + "</li>";
                                            }
                                        });

                                $(".uploadResult ul").html(str);

                            });//end getjson

                })(); // end function
            });
</script>
