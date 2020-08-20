<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27&libraries=drawing"></script>
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
								<div id="map" style="display: block; widht: 785px; height: 375px;"></div>
								<!-- 맵과 관련된 js를 따로 관리 -->
								<script src="/resources/assets/js/kakaomap/map.js">								
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
										<li class="step" style="width: 25%;" onclick="selectOverlay('CIRCLE')"><a id="circle" class="nav-link active" href="#about" data-toggle="tab" aria-expanded="true"><i class="far fa-circle"></i><br>
												원형</a></li>
										<li class="step" style="width: 25%;" onclick="selectOverlay('RECTANGLE')"><a class="nav-link" href="#address" data-toggle="tab"><i class="fab fa-connectdevelop"></i><br>사각</a></li>
										<li class="step" style="width: 25%;" onclick="selectOverlay('POLYGON')"><a class="nav-link" href="#address" data-toggle="tab"><i class="fab fa-connectdevelop"></i><br>다각</a></li>
										<li class="step" style="width: 25%;" ><a id="radius" class="nav-link" data-toggle="tab"><i class="fas fa-bullseye"></i><br>반경</a></li>
										<li class="step" style="width: 25%;" onclick="test()"><a class="nav-link" href="#address" data-toggle="tab"><i class="fas fa-map-marked-alt"></i><br>상권</a></li>
									</ul>
								</li>
							</ul>
							<br>
							<ul class="list-group list-group-bordered">
								<li class="list-group-item active">3단계</li>
								<li class="list-group-item">업종선택</li>
								<li class="list-group-item">
									<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Primary</button>
									<div class="dropdown-menu">
									<select name="large">
										<c:forEach items="${firstDiv }" var="first">
											<option value="${first.cs_code }">${first.cs_code_name }</option>
										</c:forEach>
									</select>
									</div>
								</li>
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
	</div>
	</div>
</body>
</html>