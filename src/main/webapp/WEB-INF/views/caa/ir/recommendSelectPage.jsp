<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27&libraries=drawing"></script>

<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">업종추천</h2>
                </div>
            </div>
        </div>
        <div class="page-inner">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-head-row">
                                <div class="card-title">지도</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="map" style="display: block; widht: 785px; height: 680px;"></div>
                            <!-- 맵과 관련된 js를 따로 관리 -->
                            <script src="/resources/assets/js/kakaomap/rcmap.js"></script>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card-body">
                        <ul class="list-group list-group-bordered">
                            <li class="list-group-item active">1단계</li>
                            <li class="list-group-item">영역을 선택해주세요</li>
                        </ul>
                        <br>
                        <ul id="middleul" class="list-group list-group-bordered">
                            <li class="list-group-item active">2단계</li>
                            <li class="list-group-item">영역을 선택해주세요</li>



                        </ul>

                        <div class="container" style="align-content: right">
                            <button class="btn btn-info" onclick="analysis()" type="button">분석</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
