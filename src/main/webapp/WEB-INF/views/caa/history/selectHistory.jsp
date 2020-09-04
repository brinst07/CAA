<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27"></script>

</head>
<body>
	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">점포이력분석</h2>
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
								<div id="map" style="display: block; widht: 785px; height: 375px;"></div>
								<script>
									
									// 지도를 표시할 div
									var container = document.getElementById('map');
									var options = {
										center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
										level : 3 // 지도의 확대 레벨
									};

									// 지도를 생성합니다.
									var map = new kakao.maps.Map(container, options);
									
									// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도 타입 컨트롤을 생성합니다
									var mapTypeControl = new kakao.maps.MapTypeControl();
									
									// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
									// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미
									map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
									
									// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
									var zoomControl = new kakao.maps.ZoomControl();
									map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
									
									// 지도의 현재 영역을 얻어옵니다.
									var bounds = map.getBounds();
									var boundStr = bounds.toString();

									// 영역의 남서쪽 좌표를 얻어옵니다
									var swLatLng = bounds.getSouthWest();

									// 영역의 북동쪽 좌표를 얻어옵니다
									var neLatLng = bounds.getNorthEast();
									
									
									console.log(boundStr);
									
									console.log(swLatLng);
									console.log(neLatLng);
									
									
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div
										mapOption = {
											center: new kakao.map.LatLng(33.450701, 126.570667), // 지도의 중심좌표
											level: 3 // 지도의 확대 레벨
									};
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
									// 마커를 표시할 위치와 title 객체 배열입니다
									var positions = [
										{
											title: '카카오',
											latlng: new kakao.maps.LatLng(33.450705, 126.570677)
										},
										{
											title: '생태연못',
											latlng: new kakao.maps.LatLng(33.450936, 126.569477)
										},
										{
											title: '텃밭',
											latlng: new kakao.maps.LatLng(33.450879, 1236.569940)
										},
										{
											title: '근린공원',
											latlng: new kakao.maps.LatLng(33.451393, 126.570738)
										}
									];
									
									// 머커 이미지의 이미지 주소입니당
									var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
									
									for (var i = 0; i < positions.length; i++){
										
										// 마커 이미지의 이미지 크기
										var imageSize = new kakao.map.Size(24, 35);
										
										// 마커 이미지를 생성
										var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
										
										// 마커를 생성합니다
										var marker = new kakao.maps.Marker({
											map: map, // 마커를 표시할 지도
											position: position[i].latlng, // 마커를 표시할 위치
											title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시
											image: markerImage // 마커 이미지 
										});
									}
									

								</script>
							</div>
						</div>
					</div>
					
					
					<div class="col-md-4">
						<div class="card-body">
							<ul class="list-group list-group-bordered">
								<li class="list-group-item active">1단계</li>
								<li class="list-group-item">지역을 선택해주세요</li>
							</ul>
							<br>
							<ul class="list-group list-group-bordered">
								<li class="list-group-item active">2단계</li>
								<li class="list-group-item">점포를 선택해주세요</li>
								
								
								
								
							</ul>
							<br>
							
							
							
							
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>