<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sector" value="${sector }"></c:set>
<script type="text/javascript">
$(function(){
	// 사용자가 선택한 값을 가져오는 코드
	var sectorDATA = '${sector}';
	var json = '${jsonMapList}';
	var jsonMapList = JSON.parse(json);
	var sectorList = JSON.parse(sectorDATA);
	ServiceKey = '21SOlCjmfqUliASu82VGE2%2FXQ1uFeVzXzPQ7egYRvgT7cKF1cBdfAONRgbHRnpHFgtd3NlHgCOj2kblMeWg6iQ%3D%3D';
	//업종별 분석을 하기위해 상권을 조회하는 부분
	for(var i = 0; i<jsonMapList.length; i++){
		if(jsonMapList[i].type == 'circle'){
			var radius = jsonMapList[i].radius;
			var cx = jsonMapList[i].cx;
			var cy = jsonMapList[i].cy;
			
			var d =  {
				radius : radius,
				cx : cx,
				cy : cy,
				sectors : sectorList
			};
			
			console.log(d);
			
			$.ajax({
				url : '/caa/rest/sector',
				type : 'POST',
				traditional : true,
				contentType : "application/json",
				data : JSON.stringify(d)
			}).done(function(data){
				console.log(data);
			}).fail(function(xhr,status){
				alert(xhr);
			});
		}
	}
});	
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27"></script>
	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">상권분석</h2>
						<div class="nav-scroller d-flex">
							<div class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center" id="navmenu">
								<a class="nav-link " href="/caa/commercialanalysis">상권분석</a> 
								<a class="nav-link active" href="/caa/industryanalysis">업종분석</a> 
								<a class="nav-link" href="/caa/saleanalysis">매출분석</a> 
								<a class="nav-link" href="/caa/popAnalysis">인구분석</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="card-title">1. 업종별 추이</div>
						</div>
						<div class="card-body">
							<div class="chart-container">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
									</div>
								</div>
								<canvas id="multipleLineChart" width="306" height="300" class="chartjs-render-monitor" style="display: block; width: 306px; height: 300px;"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="card">

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

				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-title">Doughnut Chart</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas id="doughnutChart" style="width: 306px; height: 300px; display: block;" width="306" height="300" class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-title">Doughnut Chart</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas id="doughnutChart2" style="width: 306px; height: 300px; display: block;" width="306" height="300" class="chartjs-render-monitor"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-title">Doughnut Chart2</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas id="doughnutChart3" style="width: 306px; height: 300px; display: block;" width="306" height="300" class="chartjs-render-monitor"></canvas>
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
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
<script type="text/javascript">
	var myDoughnutChart = new Chart(doughnutChart, {
		type : 'doughnut',
		data : {
			datasets : [ {
				data : [ 10, 20 ],
				backgroundColor : [ '#f3545d', '#fdaf4b' ]
			} ],

			labels : [ 'Red', 'Blue' ]
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				position : 'bottom'
			},
			layout : {
				padding : {
					left : 20,
					right : 20,
					top : 20,
					bottom : 20
				}
			}
		}
	});
	var myDoughnutChart = new Chart(doughnutChart2, {
		type : 'doughnut',
		data : {
			datasets : [ {
				data : [ 30, 40 ],
				backgroundColor : [ '#f3545d', '#fdaf4b' ]
			} ],

			labels : [ 'Red', 'Blue' ]
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				position : 'bottom'
			},
			layout : {
				padding : {
					left : 20,
					right : 20,
					top : 20,
					bottom : 20
				}
			}
		}
	});
	var myDoughnutChart = new Chart(doughnutChart3, {
		type : 'doughnut',
		data : {
			datasets : [ {
				data : [ 12, 47 ],
				backgroundColor : [ '#f3545d', '#fdaf4b' ]
			} ],

			labels : [ 'Red', 'Blue' ]
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				position : 'bottom'
			},
			layout : {
				padding : {
					left : 20,
					right : 20,
					top : 20,
					bottom : 20
				}
			}
		}
	});

	Circles.create({
		id : 'circles-1',
		radius : 45,
		value : 60,
		maxValue : 100,
		width : 7,
		text : 5,
		colors : [ '#f1f1f1', '#FF9E27' ],
		duration : 400,
		wrpClass : 'circles-wrp',
		textClass : 'circles-text',
		styleWrapper : true,
		styleText : true
	})

	Circles.create({
		id : 'circles-2',
		radius : 45,
		value : 70,
		maxValue : 100,
		width : 7,
		text : 36,
		colors : [ '#f1f1f1', '#2BB930' ],
		duration : 400,
		wrpClass : 'circles-wrp',
		textClass : 'circles-text',
		styleWrapper : true,
		styleText : true
	})

	Circles.create({
		id : 'circles-3',
		radius : 45,
		value : 40,
		maxValue : 100,
		width : 7,
		text : 12,
		colors : [ '#f1f1f1', '#F25961' ],
		duration : 400,
		wrpClass : 'circles-wrp',
		textClass : 'circles-text',
		styleWrapper : true,
		styleText : true
	})

	var myMultipleLineChart = new Chart(multipleLineChart, {
		type : 'line',
		data : {
			labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
					"Sep", "Oct", "Nov", "Dec" ],
			datasets : [
					{
						label : "Python",
						borderColor : "#1d7af3",
						pointBorderColor : "#FFF",
						pointBackgroundColor : "#1d7af3",
						pointBorderWidth : 2,
						pointHoverRadius : 4,
						pointHoverBorderWidth : 1,
						pointRadius : 4,
						backgroundColor : 'transparent',
						fill : true,
						borderWidth : 2,
						data : [ 30, 45, 45, 68, 69, 90, 100, 158, 177, 200,
								245, 256 ]
					},
					{
						label : "Ruby",
						borderColor : "#f3545d",
						pointBorderColor : "#FFF",
						pointBackgroundColor : "#f3545d",
						pointBorderWidth : 2,
						pointHoverRadius : 4,
						pointHoverBorderWidth : 1,
						pointRadius : 4,
						backgroundColor : 'transparent',
						fill : true,
						borderWidth : 2,
						data : [ 10, 30, 58, 79, 90, 105, 117, 160, 185, 210,
								185, 194 ]
					} ]
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				position : 'top',
			},
			tooltips : {
				bodySpacing : 4,
				mode : "nearest",
				intersect : 0,
				position : "nearest",
				xPadding : 10,
				yPadding : 10,
				caretPadding : 10
			},
			layout : {
				padding : {
					left : 15,
					right : 15,
					top : 15,
					bottom : 15
				}
			}
		}
	});
</script>
