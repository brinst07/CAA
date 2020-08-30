<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27"></script>
	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">유동차량 분석</h2>
						<h4 class="pb-2 f2-bold">실시간 CCTV영상으로 유동차량을 분석합니다.</h4>
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
								<script>
									var container = document
											.getElementById('map');
									var options = {
										center : new kakao.maps.LatLng(
												33.450701, 126.570667),
										level : 3
									};

									var map = new kakao.maps.Map(container,
											options);
									
									kakao.maps.event.addListener(map,'tilesloaded',function(){

										var bounds = map.getBounds();
										// 영역의 남서쪽 좌표를 얻어옵니다

										const serviceKey = "3DAEB491-BDEE-3DEB-BFB5-B9E3F3E70452";
										var geom = "BOX("+bounds.da+","+bounds.ka+","+bounds.ia+","+bounds.ja+")";
 										$.ajax({
 											url : "http://api.vworld.kr/req/data?key"+serviceKey+"&geomFilter="+geom,

 										}).done(function(data){
 											console.log(data);
										}).fail(function (xhr,status){
											console.log(xhr,status);
										});
										
									});
									
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>