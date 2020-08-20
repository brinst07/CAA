<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27"></script>

</head>
<body>
	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">상권분석</h2>
						<div class="nav-scroller d-flex">
								<div
								class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
								<a class="nav-link active" href="commercialanalysis">상권분석</a> <a
									class="nav-link" href="industryanalysis">업종분석</a> <a
									class="nav-link" href="SaleAnalysis">매출분석</a> <a class="nav-link "
									href="test4">인구분석</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-head-row">
									<div class="card-title">1. 평가종합</div>
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
					<div class="col-md-6">
							<div class="card full-height">
								<div class="card-body">
									<div class="card-title">상권등급 평가</div>
									<div class="card-category">Daily information about statistics in system</div>
									<div class="d-flex flex-wrap justify-content-around pb-2 pt-4">
										<div class="px-2 pb-2 pb-md-0 text-center">
											<div id="circles-1"><div class="circles-wrp" style="position: relative; display: inline-block;"><svg xmlns="http://www.w3.org/2000/svg" width="90" height="90"><path fill="transparent" stroke="#f1f1f1" stroke-width="7" d="M 44.99154756204665 3.500000860767564 A 41.5 41.5 0 1 1 44.942357332570026 3.500040032273624 Z" class="circles-maxValueStroke"></path><path fill="transparent" stroke="#FF9E27" stroke-width="7" d="M 44.99154756204665 3.500000860767564 A 41.5 41.5 0 1 1 20.644357636259837 78.60137921350231 " class="circles-valueStroke"></path></svg><div class="circles-text" style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 31.5px; height: 90px; line-height: 90px;">5</div></div></div>
											<h6 class="fw-bold mt-3 mb-0">상권평가지수</h6>
										</div>
										<div class="px-2 pb-2 pb-md-0 text-center">
											<div id="circles-2"><div class="circles-wrp" style="position: relative; display: inline-block;"><svg xmlns="http://www.w3.org/2000/svg" width="90" height="90"><path fill="transparent" stroke="#f1f1f1" stroke-width="7" d="M 44.99154756204665 3.500000860767564 A 41.5 41.5 0 1 1 44.942357332570026 3.500040032273624 Z" class="circles-maxValueStroke"></path><path fill="transparent" stroke="#2BB930" stroke-width="7" d="M 44.99154756204665 3.500000860767564 A 41.5 41.5 0 1 1 5.5495771787290025 57.88076625138973 " class="circles-valueStroke"></path></svg><div class="circles-text" style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 31.5px; height: 90px; line-height: 90px;">36</div></div></div>
											<h6 class="fw-bold mt-3 mb-0">증감률</h6>
										</div>
										<div class="px-2 pb-2 pb-md-0 text-center">
											<div id="circles-3"><div class="circles-wrp" style="position: relative; display: inline-block;"><svg xmlns="http://www.w3.org/2000/svg" width="90" height="90"><path fill="transparent" stroke="#f1f1f1" stroke-width="7" d="M 44.99154756204665 3.500000860767564 A 41.5 41.5 0 1 1 44.942357332570026 3.500040032273624 Z" class="circles-maxValueStroke"></path><path fill="transparent" stroke="#F25961" stroke-width="7" d="M 44.99154756204665 3.500000860767564 A 41.5 41.5 0 0 1 69.44267714510887 78.53812060894248 " class="circles-valueStroke"></path></svg><div class="circles-text" style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 31.5px; height: 90px; line-height: 90px;">12</div></div></div>
											<h6 class="fw-bold mt-3 mb-0">안정성</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
						
							
							<table class="table table-bordered table-head-bg-info table-bordered-bd-info mt-4">
										<thead>
											<tr>
												<th scope="col">상권평가지수</th>
												<th scope="col">증감률</th>
												<th scope="col">안정성</th>
												<th scope="col">영업력</th>
												<th scope="col">구매력</th>
												<th scope="col">집객력</th>
												<th scope="col">성장성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
											<td>67</td>
												<td>0.75</td>
												<td>11.8</td>
												<td>10</td>
												<td>5</td>
												<td>16</td>
												<td>14</td>
											</tr>
											
										
										</tbody>
									</table>
							</div>
							
							<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">2. 지역별 평가지수 추이</div>
								</div>
								<div class="card-body">
									<div class="chart-container"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
										<canvas id="multipleLineChart" width="306" height="300" class="chartjs-render-monitor" style="display: block; width: 306px; height: 300px;"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">Hoverable Table</div>
								</div>
								<div class="card-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">상권평가지수</th>
												<th scope="col">증감률</th>
												<th scope="col">안정성</th>
												<th scope="col">영업력</th>
												<th scope="col">구매력</th>
												<th scope="col">집객력</th>
												<th scope="col">성장성</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>67</td>
												<td>0.75</td>
												<td>11.8</td>
												<td>10</td>
												<td>5</td>
												<td>16</td>
												<td>14</td>
											</tr>
										
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
<script type="text/javascript">
Circles.create({
    id:'circles-1',
    radius:45,
    value:60,
    maxValue:100,
    width:7,
    text: 5,
    colors:['#f1f1f1', '#FF9E27'],
    duration:400,
    wrpClass:'circles-wrp',
    textClass:'circles-text',
    styleWrapper:true,
    styleText:true
 })

 Circles.create({
    id:'circles-2',
    radius:45,
    value:70,
    maxValue:100,
    width:7,
    text: 36,
    colors:['#f1f1f1', '#2BB930'],
    duration:400,
    wrpClass:'circles-wrp',
    textClass:'circles-text',
    styleWrapper:true,
    styleText:true
 })

 Circles.create({
    id:'circles-3',
    radius:45,
    value:40,
    maxValue:100,
    width:7,
    text: 12,
    colors:['#f1f1f1', '#F25961'],
    duration:400,
    wrpClass:'circles-wrp',
    textClass:'circles-text',
    styleWrapper:true,
    styleText:true
 })

var myMultipleLineChart = new Chart(multipleLineChart, {
	type: 'line',
	data: {
		labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
		datasets: [{
			label: "Python",
			borderColor: "#1d7af3",
			pointBorderColor: "#FFF",
			pointBackgroundColor: "#1d7af3",
			pointBorderWidth: 2,
			pointHoverRadius: 4,
			pointHoverBorderWidth: 1,
			pointRadius: 4,
			backgroundColor: 'transparent',
			fill: true,
			borderWidth: 2,
			data: [30, 45, 45, 68, 69, 90, 100, 158, 177, 200, 245, 256]
		}, {
			label: "Ruby",
			borderColor: "#f3545d",
			pointBorderColor: "#FFF",
			pointBackgroundColor: "#f3545d",
			pointBorderWidth: 2,
			pointHoverRadius: 4,
			pointHoverBorderWidth: 1,
			pointRadius: 4,
			backgroundColor: 'transparent',
			fill: true,
			borderWidth: 2,
			data: [10, 30, 58, 79, 90, 105, 117, 160, 185, 210, 185, 194]
		}]
	},
	options : {
		responsive: true, 
		maintainAspectRatio: false,
		legend: {
			position: 'top',
		},
		tooltips: {
			bodySpacing: 4,
			mode:"nearest",
			intersect: 0,
			position:"nearest",
			xPadding:10,
			yPadding:10,
			caretPadding:10
		},
		layout:{
			padding:{left:15,right:15,top:15,bottom:15}
		}
	}
});

</script>
</html>