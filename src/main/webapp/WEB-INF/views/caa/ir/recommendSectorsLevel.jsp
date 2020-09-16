<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="main-panel full-height">
	<div class="container">
		<div class="page-inner">
			<div class="page-header">
				<h4 class="page-title">상권 유형</h4>
				<ul class="breadcrumbs">
					<li class="nav-home"><a href="#"> <i class="flaticon-home"></i>
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
						<div class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
							<a class="nav-link active" href="/ir/recommendSectorsLevel">업종별 등급</a> <a class="nav-link" href="/ir/recommendSectorsType">상권 유형 판별</a> 
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

<script>
	const SectorsLargeLevel = ${SectorsLargeLevel};
	const SectorsMiddleLevel = ${SectorsMiddleLevel};

	let arrayLabelLargeSectors = [];
	let arrayLabelLargeStoreCount = [];

	let arrayLabelMiddleSectors = [];
	let arrayLabelMiddleStoreCount = [];

	for (var i = 0; i < SectorsLargeLevel.length; i++) {
		arrayLabelLargeSectors.push(SectorsLargeLevel[i].sectors);
		arrayLabelLargeStoreCount.push(SectorsLargeLevel[i].store_count);
	}
	for (var i = 0; i < SectorsMiddleLevel.length; i++) {
		arrayLabelMiddleSectors.push(SectorsMiddleLevel[i].sales_ser_name);
		arrayLabelMiddleStoreCount
				.push(SectorsMiddleLevel[i].sales_store_count);
	}

	$(function() {

		// 대분류
		LargeRadarChart.data.labels = arrayLabelLargeSectors;
		LargeRadarChart.data.datasets.push({

			data : arrayLabelLargeStoreCount,
			borderColor : '#1d7af3',
			backgroundColor : 'rgba(29, 122, 243, 0.25)',
			pointBackgroundColor : "#1d7af3",
			pointHoverRadius : 4,
			pointRadius : 3,
			label : '대분류'

		});

		LargeRadarChart.update();

		// 중분류
		MiddleRadarChart.data.labels = arrayLabelMiddleSectors;
		MiddleRadarChart.data.datasets.push({

			data : arrayLabelMiddleStoreCount,
			borderColor : '#1d7af3',
			backgroundColor : 'rgba(29, 122, 243, 0.25)',
			pointBackgroundColor : "#1d7af3",
			pointHoverRadius : 4,
			pointRadius : 3,
			label : '중분류'

		});

		MiddleRadarChart.update();

	})

	var LargeRadarChart = document.getElementById('LargeRadarChart')
			.getContext('2d');
	var LargeRadarChart = new Chart(LargeRadarChart, {
		type : 'radar',
		data : {
			labels : [],
			datasets : []
		},
		options : {
			responsive : true,
			maintainAspectRatio : false,
			legend : {
				position : 'bottom'
			}
		}
	});

	var MiddleRadarChart = document.getElementById('MiddleRadarChart')
			.getContext('2d');

	var MiddleRadarChart = new Chart(MiddleRadarChart, {
		type : 'radar',
		data : {
			labels : [],
			datasets : []
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
