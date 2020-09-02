<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %> --%>
<link rel="icon" href="/resources/assets/img/icon.ico" type="image/x-icon" />
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<style type="text/css">
#logo {
	width: 250px;
	padding-bottom: 20px;
}
</style>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '/resources/assets/css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
</script>
<div class="wrapper fullheight-side sidebar_minimize">

	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">상권 분석</h2>
						<div class="nav-scroller d-flex">
							<div class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center" id="navmenu">
								<a class="nav-link " href="/caa/commercialanalysis">상권분석</a> <a class="nav-link" href="/caa/industryanalysis">업종분석</a> <a class="nav-link " href="/caa/saleanalysis">매출분석</a> <a class="nav-link active" href="/caa/PopAnalysis">인구분석</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-inner">

				<!-- ↓ 그래프 -->

				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="card-title">유동인구 월별 그래프</div>
						</div>
						<div class="card-body">
							<div class="chart-container">
								<canvas id="multipleLineChart"></canvas>
							</div>
						</div>
					</div>
				</div>

				<!-- ↑ 그래프 -->
				<!-- ↓ 표 -->


				<!-- ----------------------------------- -->

				<div class="col-md-12">
					<div class="card">
						<div class="card-body" id="poptable">

							<table class="table">
								<thead>
									<tr>
										<td>지역</td>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8</td>
										<td>9</td>
										<td>10</td>
										<td>11</td>
										<td>12</td>
									</tr>

								</thead>
								<tbody>
									<tr>
										<td>선택 영역</td>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8</td>
										<td>9</td>
										<td>10</td>
										<td>11</td>
										<td>12</td>
									</tr>
									<tr>
										<td>증감율</td>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
										<td>8</td>
										<td>9</td>
										<td>10</td>
										<td>11</td>
										<td>12</td>
									</tr>

								</tbody>
							</table>




						</div>
					</div>
				</div>
				<!-- ------------------- -->
				<!-- ↑ 표 -->


				<!-- ↓ 성별 / 연령별 유동인구 그래프 -->
				<div class="col-md-12">
					<div class="row">
						<!-- ↓ 성별 유동인구 그래프 -->
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">성별 유동인구</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="doughnutChart" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- ↑ 성별 유동인구 그래프 -->

						<!-- ↓ 연령별 유동인구 그래프 -->
						<div class="col-md-6">
							<div class="card">
								<div class="card-header">
									<div class="card-title">연령별 유동인구</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<canvas id="GenderdoughnutChart" style="width: 50%; height: 50%"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- ↑ 연령별 유동인구 그래프 -->
					</div>
				</div>
				<!-- ↑ 성별 / 연령별 유동인구 그래프 -->



			</div>
			<!-- ↑ page-inner -->
		</div>
	</div>



</div>

<!-- jQuery UI -->
<script src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

<!-- Moment JS -->
<script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

<!-- Chart JS -->
<script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

<!-- jQuery Sparkline -->
<script src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

<!-- Chart Circle -->
<script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

<!-- Datatables -->
<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

<!-- Bootstrap Notify -->
<script src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- Bootstrap Toggle -->
<script src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
<script src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

<!-- Google Maps Plugin -->
<script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

<!-- Dropzone -->
<script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

<!-- Fullcalendar -->
<script src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

<!-- DateTimePicker -->
<script src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

<!-- Bootstrap Tagsinput -->
<script src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

<!-- Bootstrap Wizard -->
<script src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

<!-- jQuery Validation -->
<script src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

<!-- Summernote -->
<script src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

<!-- Select2 -->
<script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

<!-- Sweet Alert -->
<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Owl Carousel -->
<script src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

<!-- Magnific Popup -->
<script src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Atlantis JS -->
<script src="/resources/assets/js/atlantis.min.js"></script>

<script type="text/javascript">
	const color = [];
	var colorObj = new Object();
	colorObj.borderColor = "#1d7af3";
	colorObj.pointBorderColor = "#FFF";
	colorObj.pointBorderColor = "#1d7af3";
	color.push(colorObj);
	var colorObj = new Object();
	colorObj.borderColor = "#f3545d";
	colorObj.pointBorderColor = "#FFF";
	colorObj.pointBorderColor = "#f3545d";
	color.push(colorObj);
	var colorObj = new Object();
	colorObj.borderColor = "#f1f1f1";
	colorObj.pointBorderColor = "#FFF";
	colorObj.pointBorderColor = "#F25961";
	color.push(colorObj);
	
	
	$(function(){
		$(document).ajaxStop(function(){
			alert('아작스 끝');
		});
		
		
	var json = ${jsonFigure};
	
	var jsonTempMonthData = [];
	var jsonTempRideData= [];
	
	var jsonMonthData = [];
	var jsonRideData = [];
	
	for (var i = 0; i < json.length; i++) {
		jsonTempMonthData.push(json[i].month);
		jsonTempRideData.push(json[i].ride);
	}
	
	jsonMonthData.push(jsonTempMonthData);
	jsonRideData.push(jsonTempRideData);
		
		
	myMultipleLineChart.data.labels = jsonMonthData[0];
	myMultipleLineChart.data.datasets.push({
		label : "탑승 승객 수",
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
		data :  jsonRideData[0]

		
	});		
	
	myMultipleLineChart.update();
	
	
	// 테이블 만들기
	var cell = document.getElementById("poptable"); 
	while ( cell.hasChildNodes() ) { 
		cell.removeChild( cell.firstChild );
	}
	
	
	let htmltags =' 	<table class="table table-bordered">     ';
	htmltags +='<thead>                        ';
	htmltags +=' 	<tr>                      ';
	htmltags +=' 		<td>지역</td>         ';
	for (var i = 0; i < json.length; i++) {
	htmltags +=' 		<td class="text-center">'+json[i].month+' 월</td>            ';
	}
	htmltags +=' 	</tr>                     ';
    htmltags +='                               ';
	htmltags +=' </thead>                      ';
	htmltags +=' <tbody>                       ';
	
		
	
	htmltags +=' 	<tr>                      ';
	htmltags +=' 		<td>선택 영역</td>    ';
	for (var i = 0; i < json.length; i++) {
	htmltags +=' 		<td class="text-center" >'+json[i].ride+' 명</td>            ';
	}
	htmltags +=' 	</tr>                     ';
	
	htmltags +=' 	<tr>                      ';
	htmltags +=' 		<td>증감율</td>    ';
	for (var i = 0; i < json.length; i++) {
		if(i==0){
			htmltags +=' 		<td class="text-center" ></td>            ';
		}else{
	htmltags +=' 		<td class="text-center" height="0" >'+Math.ceil((((json[i].ride - json[i-1].ride) / json[i-1].ride) * 100)) +'<div style="height:3%" ><img src="/resources/assets/img/decrease.png" height="100%"></div></td>            ';
		}
	}
	htmltags +=' 	</tr>                     ';
	
	
	htmltags +=' 	</tbody>                  ';
	htmltags +=' 	</table>                  ';
	
	$('#poptable').append(htmltags);
	
		
		
		
		
	})
	
	

	
	
	
	/////////////////////////////////////////////
	
// 	var data = {
// 			json : json
// 	};
	
// 	var dataMonthList = [];
// 	var dataRideList = [];
	
	
// 	for (var i = 0; i < json.length; i++) {
// 		dataMonthList[0][i].push(json[i].month);
// 		dataRideList[0][i].push(json[i].ride);
// 	}
	
	
	
	




//////////////////////////////////////////////////////////////////////////





	
</script>


<!-- 테이블 동적으로 만들기 -->
<script type="text/javascript">
$(function(){

})
	
	
	
	

</script>


<script type="text/javascript">

/* 멀티 차트 */
var multipleLineChart = document.getElementById('multipleLineChart')
		.getContext('2d');

var myMultipleLineChart = new Chart(
		multipleLineChart, {
			type : 'line',
			data : {
				labels : [],
				datasets : []
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


/* 도넛 차트 */
var myDoughnutChart = new Chart(doughnutChart, {
	type : 'doughnut',
	data : {
		datasets : [ {
			data : [ 10, 20, 30 ],
			backgroundColor : [ '#f3545d', '#fdaf4b', '#1d7af3' ]
		} ],

		labels : [ 'Red', 'Yellow', 'Blue' ]
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
var myDoughnutChart = new Chart(GenderdoughnutChart, {
	type : 'doughnut',
	data : {
		datasets : [ {
			data : [ 10, 30 ],
			backgroundColor : [ '#f3545d', '#fdaf4b', '#1d7af3' ]
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
</script>
