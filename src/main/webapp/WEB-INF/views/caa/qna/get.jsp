<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<body>
<div class="main-panel full-height">
    <div class="container">
        <div class="page-inner">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10 col-xl-9">
                    <div class="row align-items-center">
                        <div class="col">
                            <h4 class="page-title">QnA</h4>
                            <h6 class="page-pretitle">Questions and Answers</h6>
                        </div>
                        <div class="col-auto">

                            <button data-oper='modify' class="btn btn-light btn-border"
                                    onclick="location.href='/qna/modify?board=<c:out
                                            value="${board.board_id }"/>&board_title=<c:out value="${board_title}"/>'">
                                수정
                            </button>

                            <a href="/qna/list" class="btn btn-primary ml-2"> 목록 </a>
                        </div>
                    </div>
                    <div class="page-divider"></div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-invoice">
                                <div class="card-header">
                                    <div class="invoice-header">

                                        <h3 class="invoice-title">
                                            <c:out value="${board.board_title }"></c:out>
                                        </h3>
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
                                        <c:out value="${board.board_content }"></c:out>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>



