<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">QnA</h2>
                </div>
            </div>
        </div>
        <div class="page-inner">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header"></div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="basic-datatables_wrapper"
                                 class="dataTables_wrapper container-fluid dt-bootstrap4">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table id="basic-datatables"
                                               class="display table table-striped table-hover dataTable"
                                               role="grid" aria-describedby="basic-datatables_info">
                                            <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-sort="ascending"
                                                    aria-label="Name: activate to sort column descending"
                                                    style="width: 76px;">번호
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Position: activate to sort column ascending"
                                                    style="width: 96px;">제목
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Office: activate to sort column ascending"
                                                    style="width: 70px;">작성자
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Age: activate to sort column ascending"
                                                    style="width: 27px;">등록일
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Start date: activate to sort column ascending"
                                                    style="width: 83px;">조회수
                                                </th>
                                                <!-- <th class="sorting" tabindex="0"
                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                    aria-label="Salary: activate to sort column ascending"
                                    style="width: 78px;">Salary</th> -->
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th rowspan="1" colspan="1">번호</th>
                                                <th rowspan="1" colspan="1">제목</th>
                                                <th rowspan="1" colspan="1">작성자</th>
                                                <th rowspan="1" colspan="1">등록일</th>
                                                <th rowspan="1" colspan="1">조회수</th>
                                                <!-- <th rowspan="1" colspan="1">Salary</th> -->
                                            </tr>
                                            </tfoot>
                                            <tbody>


                                            <c:forEach items="${list }" var="board">
                                                <tr>
                                                    <td><c:out value="${board.boardnum }"/></td>
                                                        <%-- <td><a href='/qna/get?board_id=<c:out value="${board.board_id }"/>'>
                                                        <c:out value="${board.board_title }" /></a></td> --%>
                                                    <td><a class="move"
                                                           href='/qna/getDetail?board_id=<c:out value="${board.board_id }"/>'>
                                                        <c:out value="${board.board_title }"/></a></td>
                                                    <td><c:out value="${board.member_id }"/></td>
                                                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                                        value="${board.board_datetime }"/></td>
                                                        <%-- <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                                value="${board.board_datetime }" /></td> --%>
                                                    <td><c:out value="${board.board_hit}"/></td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>

                                        </table>
                                        <!-- <button data-oper='register' class="btn btn-black" onclick="location.href='/qna/register'">등록</button> -->


                                        <hr>

                                        <button data-oper='register' class="btn btn-primary"
                                                onclick="location.href='/qna/register'" style="float: right;">등록
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-5"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

