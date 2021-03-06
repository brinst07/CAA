<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

                            <%-- <button data-oper='modify' class="btn btn-light btn-border"
                                    onclick="location.href='/qna/modify?board_id=<c:out
                                            value="${board.board_id }"/>&board_title=<c:out value="${board_title}"/>'">
                                수정
                            </button> --%>
                            
                           <c:if test="${member.member_id == board.member_id }">
                           		<a href="/qna/modify?board=${board.board_id }" class="btn btn-light btn-border">수정 </a>
                           
                           </c:if>
                            
                            
                            
                            
                            
                            
                            <a href="/qna/list" class="btn btn-primary ml-2"> 목록 </a>
                            <c:if test="${member.member_auth eq 'ROLE_ADMIN'}">
                            <c:if test="${board.board_re_lev == '0' }">
                                <button data-oper='modify' class="btn btn-light btn-border"
                                        onclick="location.href='/qna/reply?board_id=<c:out
                                                value="${board.board_id }"/>&board_re_ref=<c:out
                                                value="${board.board_re_ref}"/>'">
                                                
                                    답글
                                </button>
                                </c:if>
                            </c:if>
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
                                                <c:out value="${board.member_username }"></c:out>
                                                <%-- <c:out value="${board.board_id }"></c:out> --%>
                                                <input type="hidden" name="board_id" id="board_id" value="${board.board_id}">
                                                
                                            </p>
                                        </div>

                                    </div>

                                    <div class="separator-solid"></div>
                                    <h5 class="sub">내용</h5>
                                    <div>
                                        ${board.board_content }
                                    </div>
                                    <div style="height: 50px;">
                                    </div>
                                </div>
                                <%-- <form name="loginForm" action="/qna/reply"  method="get">
									<input type="hidden" name="board_re_ref" id="board_re_ref" value="${board_id}">
									<input type="submit" value="전송">
								</form> --%>


                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function removeHTML(text) {
	
	text = text.replace(/<br\/>/ig, "\n");
	text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
}

</script>

