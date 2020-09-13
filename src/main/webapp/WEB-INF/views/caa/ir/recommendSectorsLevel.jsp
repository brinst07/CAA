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
			<div class="page-inner">
				<div class="page-header">
					<h4 class="page-title">Dashboard</h4>
					<ul class="breadcrumbs">
						<li class="nav-home"><a href="#"> <i
								class="flaticon-home"></i>
						</a></li>
						<li class="separator"><i class="flaticon-right-arrow"></i></li>
						<li class="nav-item"><a href="#">Pages</a></li>
						<li class="separator"><i class="flaticon-right-arrow"></i></li>
						<li class="nav-item"><a href="#">Starter Page</a></li>
					</ul>
				</div>

				<div>

					<!-- --------------------------- -->
					<div class="d-flex align-items-left flex-column">
						<!-- <h2 class="pb-2 fw-bold">Dashboard</h2> -->
						<div class="nav-scroller d-flex">
							<div
								class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
								<a class="nav-link active" href="RecommendSectorsLevel">업종별 등급<span
									class="badge badge-info ml-2">8</span></a> <a class="nav-link"
									href="iRecommendation2">상권 유형 판별</a> <a class="nav-link"
									href="iRecommendation3">안정성 우수 업종<span
									class="badge badge-danger ml-2">2</span></a>
							</div>

						</div>
					</div>
				</div>


				<!-- --------------------------- -->
			</div>
			<div class="page-category">

				<div class="col-md-12">
				<div class="row">
				<div class="col-md-6" id="SectorsLarge">
					<div class="card">
						<div class="card-header">
							<div class="card-title">대분류</div>
						</div>
						<div class="card-body">
							<div class="chart-container">
								<canvas id="LargeRadarChart"></canvas>
							</div>
						</div>
					</div>


				</div>
				<div class="col-md-6" id="SectorsMiddle">
					<div class="card">
						<div class="card-header">
							<div class="card-title">중분류</div>
						</div>
						<div class="card-body">
							<div class="chart-container">
								<canvas id="MiddleRadarChart"></canvas>
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

<script>
let SectorsLargeLevel = '${SectorsLargeLevel}';
let SectorsMiddleLevel = '${SectorsMiddleLevel}';

const jsonSectorsLargeLevel = JSON.parse(SectorsLargeLevel);

	myRadarChart = document.getElementById('LargeRadarChart').getContext('2d');

	var myRadarChart = new Chart(LargeRadarChart, {
		type : 'radar',
		data : {
			labels : [  'Eating', 'Cycling', 'Jumping' ],
			datasets : [ {
				data : [  30, 2, 30 ],
				borderColor : '#1d7af3',
				backgroundColor : 'rgba(29, 122, 243, 0.25)',
				pointBackgroundColor : "#1d7af3",
				pointHoverRadius : 4,
				pointRadius : 3,
				label : 'Team 1'
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
	
	myRadarChart = document.getElementById('MiddleRadarChart').getContext('2d');
	
	var myRadarChart = new Chart(MiddleRadarChart, {
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