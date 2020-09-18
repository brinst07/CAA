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
        var menuname = url[url.length - 1];
        console.log(menuname);
    })
</script>
<div class="sidebar sidebar-style-2" data-background-color="blue">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <ul class="nav" id="leftMenu">
                <li class="nav-item" id="main"><a href="/caa/main"> <i class="fas fa-home"></i>
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
                <li class="nav-item" id="sale"><a href="/sales/salesBoard"> <i class="flaticon-analytics"></i>
                    <p>매출 통계</p>
                </a></li>
                <li class="nav-item" id="sector"><a href="/ir/irSelectPage"> <i class="flaticon-layers-1"></i>
                    <p>업종 유형</p>
                </a></li>
                <li class="nav-item" id="history"><a href="/history/selectHistory"> <i class="icon-location-pin"></i>
                    <p>점포분석</p>
                </a></li>
                <li class="nav-item" id="cctv"><a href="/cctv/CCTVAnalysis"> <i class="icon-camrecorder"></i>
                    <p>cctv분석</p>
                </a></li>
                <li class="nav-item" id="survive"><a href="/caa/survive"> <i class="flaticon-list"></i>
                    <p>생존율</p>
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
