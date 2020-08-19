<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">상권분석</h2>
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
								<div id="map"
									style="display: block; widht: 785px; height: 375px;"></div>
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
					<div class="col-md-4">
						<div class="card-body">
							<ul class="list-group list-group-bordered">
								<li class="list-group-item active">1단계</li>
								<li class="list-group-item">영역을 선택해주세요</li>
							</ul>
							<br>
							<ul class="list-group list-group-bordered">
								<li class="list-group-item active">2단계</li>
								<li class="list-group-item">영역을 선택해주세요</li>
								<li class="list-group-item">
									<ul class="wizard-menu nav nav-pills nav-primary">
										<li class="step" style="width: 25%;"><a
											class="nav-link active" href="#about" data-toggle="tab"
											aria-expanded="true"><i class="far fa-circle"></i><br>
												원형</a></li>
										<li class="step" style="width: 25%;"><a class="nav-link"
											href="#account" data-toggle="tab"><i
												class="fas fa-bullseye"></i><br>반경</a></li>
										<li class="step" style="width: 25%;"><a class="nav-link"
											href="#address" data-toggle="tab"><i
												class="fab fa-connectdevelop"></i><br>다각</a></li>
										<li class="step" style="width: 25%;"><a class="nav-link"
											href="#address" data-toggle="tab"><i
												class="fas fa-map-marked-alt"></i><br>상권</a></li>
									</ul>
								</li>
							</ul>
							<br>
							<ul class="list-group list-group-bordered">
								<li class="list-group-item active">3단계</li>
								
								<li class="list-group-item">
									<button class="btn btn-black">Default</button>
									<button class="btn btn-info">Info</button>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	radarChart = document.getElementById('radarChart').getContext('2d');

	var myRadarChart = new Chart(radarChart, {
		type : 'radar',
		data : {
			labels : [ 'Running', 'Swimming', 'Eating', 'Cycling', 'Jumping' ],
			datasets : [ {
				data : [ 20, 10, 30, 2, 30 ],
				borderColor : '#1d7af3',
				backgroundColor : 'rgba(29, 122, 243, 0.25)',
				pointBackgroundColor : "#1d7af3",
				pointHoverRadius : 4,
				pointRadius : 3,
				label : 'Team 1'
			}, {
				data : [ 10, 20, 15, 30, 22 ],
				borderColor : '#716aca',
				backgroundColor : 'rgba(113, 106, 202, 0.25)',
				pointBackgroundColor : "#716aca",
				pointHoverRadius : 4,
				pointRadius : 3,
				label : 'Team 2'
			}, ]
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				position : 'bottom'
			}
		}
	});
</script>
</html>