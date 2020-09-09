<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/caa/left.js"></script>
<script>
    $(function () {
        $('#leftMenu li').on('click', function () {
            $(this).parent('ul').find('li').removeClass('active');
            $(this).addClass('active');
        });

        var url = window.location.href;
        url = url.split("/");
        var menuname = url[url.length-1];
        console.log(menuname);
    })
</script>
<div class="sidebar sidebar-style-2" data-background-color="blue">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <c:if test="${null ne user}">
                <div class="user">
                    <div class="avatar-sm float-left mr-2">
                        <img src="/resources/assets/img/profile.jpg" alt="..." class="avatar-img rounded-circle">
                    </div>
                    <!-- 사이드바 user정보 -->
                    <div class="info">
                        <a data-toggle="collapse" href="collapseExample" aria-expanded="true"> <span> Hizrian <span
                                class="user-level">Administrator</span> <span class="caret"></span>
						</span>
                        </a>
                        <div class="clearfix"></div>

                        <div class="collapse in" id="collapseExample">
                            <ul class="nav">
                                <li><a> <span class="link-collapse">My Profile</span>
                                </a></li>
                                <li><a> <span class="link-collapse">Edit Profile</span>
                                </a></li>
                                <li><a> <span class="link-collapse">Settings</span>
                                </a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </c:if>
            <div class="user">
                <div class="avatar-sm float-left">
                    <a><span class="btn-label"><i class="flaticon-profile"></i></span></a>
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="collapseExample" aria-expanded="true"> <span> 비회원 <span
                            class="user-level">비회원</span> <span class="caret"></span>
						</span>
                    </a>
                </div>
            </div>
            <ul class="nav" id="leftMenu">
                <li class="nav-item" id="main"><a> <i class="fas fa-home"></i>
                    <p>메인화면</p>
                </a></li>
                <li class="nav-section"><span class="sidebar-mini-icon"> <i class="fa fa-ellipsis-h"></i>
					</span>
                    <h3 class="text-section">분석메뉴</h3></li>
                <!-- 					<li class="nav-item"><a href="starter-template.html"> <i class="far fa-file-excel"></i> -->
                <!-- 							<p>Annual Report</p> -->
                <!-- 					</a></li> -->
                <!-- 					<li class="nav-item"><a href="starter-template.html"> <i class="fas fa-file-contract"></i> -->
                <!-- 							<p>HR Report</p> -->
                <!-- 					</a></li> -->
                <li class="nav-item" id="analysis"><a href="/caa/caaSelect"> <i class="fas fa-chart-bar"></i>
                    <p>상권분석</p>
                </a></li>
                <li class="nav-item" id="caaSelect"><a href="/sns/snsAnalysisFirst"> <i class="fab fa-twitter"></i>
                    <p>SNS분석</p>
                </a></li>
                <li class="nav-item" id="status"><a href="/caa/businessstatus"> <i class="fas fa-cloud"></i>
                    <p>업종현황</p>
                </a></li>
                <li class="nav-item" id="sector"><a href="iRecommendation"> <i class="fas fa-chart-bar"></i>
                    <p>업종 추천</p>
                </a></li>
                <li class="nav-section"><span class="sidebar-mini-icon"> <i class="fa fa-ellipsis-h"></i>
					</span>
						
                    <h4 class="text-section">게시판 메뉴</h4></li>
                <li class="nav-item" id="notice"><a href="/notice/noticeList"> <i class="fas fa-clipboard-list"></i>
                <p>공지사항</p>
<!--                      <span class="caret"></span> -->
                </a>
<!--                     <div class="collapse" id="email-nav"> -->
<!--                         <ul class="nav nav-collapse"> -->
<!--                             <li><a href="email-inbox.html"> <span class="sub-item">Inbox</span> -->
<!--                             </a></li> -->
<!--                             <li><a href="email-compose.html"> <span class="sub-item">Email Compose</span> -->
<!--                             </a></li> -->
<!--                             <li><a href="email-detail.html"> <span class="sub-item">Email Detail</span> -->
<!--                             </a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
                </li>
                
                <li class="nav-item" id="qna"><a href="/qna/list"> <i class="fas fa-question-circle"></i>
                    <p>Q&A게시판</p>
                </a></li>
                
                <!-- <li class="nav-item" id="qna"><a data-toggle="collapse"> <i class="fas fa-question-circle"></i>
                    <p>Q&A게시판</p> <span class="caret"></span>
                </a>
                    <div class="collapse" id="messages-app-nav">
                        <ul class="nav nav-collapse">
                            <li><a href="messages.html"> <span class="sub-item">Messages</span>
                            </a></li>
                            <li><a href="conversations.html"> <span class="sub-item">Conversations</span>
                            </a></li>
                        </ul>
                    </div>
                </li> -->
            </ul> 
        </div>
    </div>
</div>
