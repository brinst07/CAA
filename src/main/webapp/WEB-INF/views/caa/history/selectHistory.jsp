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
									var container = document
											.getElementById('map');
									var options = {
										center : new kakao.maps.LatLng(
												33.450701, 126.570667),
										level : 3
									};

									var map = new kakao.maps.Map(container,
											options);
								</script>
							</div>
						</div>
					</div>
					<!-- 					<div class="col-md-4"> -->
					<!-- 						<div class="card card-primary bg-primary-gradient"> -->
					<!-- 							<div class="card-body"> -->
					<!-- 								<h1 class="mt-3 b-b1 pb-2 mb-4 fw-bold"> -->
					<!-- 									1단계 -->
					<!-- 									</h4> -->
					<!-- 									<div class="card-category">지역을 선택해주세요~</div> -->
					<!-- 									<br> -->
					<!-- 									<h1 class="mt-3 b-b1 pb-2 mb-4 fw-bold">2단계</h1> -->
					<!-- 									<div class="card-category">영역을 선택해주세요</div> -->
					<!-- 									<div class="page-inner"> -->

					<!-- 										<button class="btn btn-primary">Default</button> -->
					<!-- 										<button class="btn btn-primary btn-border btn-light"><</button> -->
					<!-- 										<button class="btn btn-primary btn-border btn-light">Border</button> -->
					<!-- 										<button class="btn btn-primary btn-border btn-light">Border</button> -->
					<!-- 									</div> -->
					<!-- 							</div> -->
					<!-- 							<h4 class="mt-5 pb-3 mb-0 fw-bold">Top active pages</h4> -->
					<!-- 							<ul class="list-unstyled"> -->
					<!-- 								<li class="d-flex justify-content-between pb-1 pt-1"><small>/product/readypro/index.html</small> <span>7</span></li> -->
					<!-- 								<li class="d-flex justify-content-between pb-1 pt-1"><small>/product/atlantis/demo.html</small> <span>10</span></li> -->
					<!-- 							</ul> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
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
								<!-- <li class="list-group-item">
									<ul class="wizard-menu nav nav-pills nav-primary">
										<li class="step" style="width: 25%;"><a class="nav-link active" href="#about" data-toggle="tab" aria-expanded="true"><i class="far fa-circle"></i><br>
												원형</a></li>
										<li class="step" style="width: 25%;"><a class="nav-link" href="#account" data-toggle="tab"><i class="fas fa-bullseye"></i><br>반경</a></li>
										<li class="step" style="width: 25%;"><a class="nav-link" href="#address" data-toggle="tab"><i class="fab fa-connectdevelop"></i><br>다각</a></li>
										<li class="step" style="width: 25%;"><a class="nav-link" href="#address" data-toggle="tab"><i class="fas fa-map-marked-alt"></i><br>상권</a></li>
									</ul>
								</li> -->
							</ul>
							<br>
							<!-- <ul class="list-group list-group-bordered">
								<li class="list-group-item active">3단계</li>
								<li class="list-group-item">업종선택</li>
								<li class="list-group-item">
									<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Primary</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="#">Separated link</a>
									</div>
								</li>
								<li class="list-group-item">
									<button class="btn btn-black">Default</button>
									<button class="btn btn-info">Info</button>
								</li>
							</ul> -->
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