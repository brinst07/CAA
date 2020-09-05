<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="main-panel full-height">
    <div class="container">
        <div class="page-inner">
            <div class="row justify-content-center">
                <form action="modify" method="post" enctype="multipart/form-data">
                    <div class="col-12 col-lg-10 col-xl-9">
                        <div class="row align-items-center">
                            <div class="col">
                                <h4 class="page-title">공지사항</h4>
                                <h6 class="page-pretitle">Notice</h6>
                            </div>


                            <div class="col-auto">
                                <a href="/notice/modify" class="btn btn-light btn-border"> 확인 </a>
                                <a href="/notice/remove" class="btn btn-light btn-border"> 삭제 </a>
                                <a href="/notice/noticeList" class="btn btn-primary ml-2"> 취소 </a>
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
                                            <div style="height: 300px;">

                                                <textarea id="editor" name="board_content"></textarea>

                                            </div>


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
</div>

    <script>
        $('#editor').summernote('code', '${board.board_content}');

        $('#editor').val("${board.board_content}");
        $('#editor').summernote(
            {
                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS',
                    'Courier New'],
                tabsize: 2,
                height: 300,
                callbacks: {
                    onImageUpload: function (files, editor, welEditable) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            sendFile(files[i], this);
                        }
                    }
                }
            });
    </script>











