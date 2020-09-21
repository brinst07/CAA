<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b34009d4b541b528531e4544e9856e95"></script>

<script type="text/javascript">

</script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">점포분석</h2>
                    <!-- <h4 class="pb-2 f2-bold">현재 지도 내의 점포를 분석하여 나타냅니다.</h4> -->
                </div>
            </div>
        </div>
        <div class="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-head-row">
                                <div class="card-title">지도</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="map" style="display: block; widht: 785px; height: 375px;"></div>
                            <script src="/resources/assets/js/kakaomap/rectangle.js"></script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>