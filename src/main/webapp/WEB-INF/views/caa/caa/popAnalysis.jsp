<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="icon" href="/resources/assets/img/icon.ico" type="image/x-icon" />
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>


	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">상권 분석</h2>
						<div class="nav-scroller d-flex">
							<div class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center" id="navmenu">
								<a class="nav-link" href="/caa/industryanalysis">업종분석</a> <a class="nav-link " href="/caa/saleanalysis">매출분석</a> <a class="nav-link active" href="/caa/popAnalysis">인구분석</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-inner" id="PageIn">

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

				<div class="col-md-12" id="poptable">
					<div class="card">
						<div class="card-body">

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



<script type="text/javascript">
function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
}



var popData = ${jsonFigure};


/////////////////////////////////////////// 중복 값 제거
var popDataYear = [];
var popDataMonth = [];
var popDataYearMonth = [];
var popDataSelect = [];
for (var i = 0; i < popData.length; i++) {
	popDataYear.push(popData[i].year);
	popDataMonth.push(popData[i].month);
	popDataSelect.push(popData[i].selectName);
	popDataYearMonth.push(popData[i].year+"-"+popData[i].month)
}


popDataYear = popDataYear.reduce(function(a,b){if(a.indexOf(b)<0)a.push(b);return a;},[]);
popDataMonth = popDataMonth.reduce(function(a,b){if(a.indexOf(b)<0)a.push(b);return a;},[]);
popDataSelect = popDataSelect.reduce(function(a,b){if(a.indexOf(b)<0)a.push(b);return a;},[]);
popDataYearMonth = popDataYearMonth.reduce(function(a,b){if(a.indexOf(b)<0)a.push(b);return a;},[]);

// 이차원 배열 만들기
var arrayPopRideData =  [];
var arrayPopQuitData =  [];


///////////////////////////////////////// 맵 형태로 만들기
const mapPopDataRide = new Map();
const mapPopDataQuit = new Map(); 
for (var i = 0; i < popDataSelect.length; i++) {
		let tempArrayRide = [];		
		let tempArrayQuit = [];		
	for (var j = 0; j < popData.length; j++) {
		if(popDataSelect[i] == popData[j].selectName){
			tempArrayRide.push((popData[j].ride));
			tempArrayQuit.push((popData[j].quit));
		}
	} 
	// 배열
	arrayPopRideData.push(tempArrayRide); 
	arrayPopQuitData.push(tempArrayQuit);
	// 맵 안에 List
	mapPopDataRide.set((popDataSelect[i]).replace(/\"/gi, "").toString(), tempArrayRide);
	mapPopDataQuit.set((popDataSelect[i]).replace(/\"/gi, "").toString(), tempArrayQuit);
	
}

var arrayArrayPopRideData =  [];
var arrayArrayPopQuitData =  [];

arrayArrayPopRideData.push(arrayPopRideData);
arrayArrayPopQuitData.push(arrayPopQuitData);



//////////////////////////////////////////// 차트에 값 넣기
$(function(){
	
	const color = [];
	var colorObj = new Object();
	colorObj.borderColor = "#1d7af3";
	colorObj.pointBackGroundColor = "#FFF";
	colorObj.pointBorderColor = "#1d7af3";
	color.push(colorObj);
	var colorObj = new Object();
	colorObj.borderColor = "#f3545d";
	colorObj.pointBackGroundColor = "#FFF";
	colorObj.pointBorderColor = "#f3545d";
	color.push(colorObj);
	var colorObj = new Object();
	colorObj.borderColor = "#0d4e26";
	colorObj.pointBackGroundColor = "#FFF";
	colorObj.pointBorderColor = "#0d4e26";
	color.push(colorObj);

	var colorObj = new Object();
	colorObj.borderColor = "#89e32d";
	colorObj.pointBackGroundColor = "#FFF";
	colorObj.pointBorderColor = "#89e32d";
	color.push(colorObj);

	var colorObj = new Object();
	colorObj.borderColor = "#6822a7";
	colorObj.pointBackGroundColor = "#FFF";
	colorObj.pointBorderColor = "#6822a7";
	color.push(colorObj);

	var colorObj = new Object();
	colorObj.borderColor = "#3a9978";
	colorObj.pointBackGroundColor = "#FFF";
	colorObj.pointBorderColor = "#3a9978";
	color.push(colorObj);

	
	
	
	myMultipleLineChart.data.labels = popDataYearMonth;
	for (var i = 0; i < popDataSelect.length; i++) {
		
		
		
			
			myMultipleLineChart.data.datasets.push({
				label : popDataSelect[i] + "탑승 승객 수",
				borderColor : color[i].borderColor,
				pointBorderColor : color[i].pointBorderColor,
				pointBackGroundColor : color[i].pointBackGroundColor,
				pointBorderWidth : 2,
				pointHoverRadius : 4,
				pointHoverBorderWidth : 1,
				pointRadius : 4,
				backgroundColor : 'transparent',
				fill : true,
				borderWidth : 2,
				data :  arrayArrayPopRideData[0][i]

			});	
		
		
		
			myMultipleLineChart.data.datasets.push({
				label : popDataSelect[i] + "하차 승객 수",
				borderColor : color[i+3].borderColor,
				pointBorderColor : color[i+3].pointBorderColor,
				pointBackGroundColor : color[i+3].pointBackGroundColor,
				pointBorderWidth : 2,
				pointHoverRadius : 4,
				pointHoverBorderWidth : 1,
				pointRadius : 4,
				backgroundColor : 'transparent',
				fill : true,
				borderWidth : 2,
				data : arrayArrayPopQuitData[0][i]

		
				
			});
			
			myMultipleLineChart.update();
	
	}
	
	
})


		




/////


	
	
	

	
////////////////////////////////////// 동적으로 만들기 위한 사전 작업 (제거하기)	
	
	var chektd = 'no';
	var chektd2 = 'no';

	
	var cell = document.getElementById("PageIn"); 
	while ( cell.hasChildNodes() ) { 
		cell.removeChild( cell.firstChild );
	}
	
	/////////////////////////////////////	↓ 그래프 	/////////////////////////////////////

	tableTags = ' 				<div class="col-md-12"> ';
	tableTags += ' 					<div class="card"> ';
	tableTags += ' 						<div class="card-header"> ';
	tableTags += ' 							<div class="card-title">유동인구 월별 그래프</div> ';
	tableTags += ' 						</div> ';
	tableTags += ' 						<div class="card-body"> ';
	tableTags += ' 							<div class="chart-container"> ';
	tableTags += ' 								<canvas id="multipleLineChart"></canvas> ';
	tableTags += ' 							</div> ';
	tableTags += ' 						</div> ';
	tableTags += ' 					</div> ';
	tableTags += ' 				</div> ';

	///////////////////////////////////// 	↑ 그래프	/////////////////////////////////////
	
	///////////////////////////////////// 동적으로 테이블 생성  ↓ ////////////////////////////////
	
	tableTags += ' 				<div class="col-md-12" id="poptable"> ';
	tableTags += ' 					<div class="card"> ';
	tableTags += ' 						<div class="card-body"> ';

	tableTags += ' 							<table class="table table-bordered"> ';
	
	tableTags += ' 								<thead> ';
	tableTags += ' 									<tr> ';
	tableTags += ' 										<th> 구역 \\ 월</th> ';


// 	년 월
	for (var i = 0; i < popDataMonth.length; i++) {
		
	tableTags += ' 										<th>'+popDataMonth[i]+' 월</th> ';
	}			
	

	tableTags += ' 									</tr> ';
	tableTags += ' 								</thead> ';
	
	tableTags += ' 								<tbody> ';
	
	// 지역 이름을 위한 2중 포문
	for (var i = 0; i < popDataSelect.length; i++) {
	tableTags += ' 									<tr> ';
	// 지역 이름
	
	tableTags += ' 										<td rowspan="4">'+(popDataSelect[i]).replace(/\"/gi, "")+'</td> ';
		

	for (var j = 0; j < popData.length; j++) {
		if((popDataSelect[i]).replace(/\"/gi, "") == popData[j].selectName.replace(/\"/gi, "")){
	tableTags += ' 										<td>'+comma(popData[j].ride)+' 명</td> ';
		}
	}
	
	// 승차 증감율
	tableTags += ' <tr>';
	for (const [key, value] of mapPopDataRide) {

		for (let k = 0; k < mapPopDataRide.get(key).length; k++) {
			console.log("사이즈 : "+mapPopDataRide.get(key).length);
			console.log("키값을 넣었을때 값 : "+mapPopDataRide.get(key));
			if (k===0 && chektd2=='no') {
				tableTags += '<td></td>';
				console.log(mapPopDataRide.get(key)[k]);
				console.log(key);
				chektd2='yes';
			}
			else if((popDataSelect[i]).replace(/\"/gi, "") == key.replace(/\"/gi, "")){
				let tableValue = Math.ceil((((mapPopDataRide.get(key)[k] - mapPopDataRide.get(key)[k-1]) / mapPopDataRide.get(key)[k-1]) * 100));
				if (tableValue > 0) {
				tableTags += ' 										<td>'+tableValue+'% <div style="color:blue; display:inline">▲</div></td> ';			
				}else if(tableValue < 0){
				tableTags += ' 										<td>'+tableValue+'% <div style="color:red; display:inline">▼</div></td> ';			
				}else if(tableValue == 0){
					tableTags += ' 										<td>'+tableValue+'% <div style=" display:inline">-</div></td> ';
				}else {
					tableTags += '<td></td>';
				}

				
			}
		}
	}

	tableTags += ' </tr>';

	tableTags += ' <tr>';
	for (var j = 0; j < popData.length; j++) {
		if((popDataSelect[i]).replace(/\"/gi, "") == popData[j].selectName.replace(/\"/gi, "")){
	tableTags += ' 										<td>'+comma(popData[j].quit)+' 명</td> ';
		}
	}
	tableTags += ' </tr>';
	
	// 하차 증감율
	tableTags += ' <tr>';
	for (const [key, value] of mapPopDataQuit) {
		
		for (let k = 0; k < mapPopDataQuit.get(key).length; k++) {
			console.log("사이즈 : "+mapPopDataQuit.get(key).length);
			console.log("키값을 넣었을때 값 : "+mapPopDataQuit.get(key));
			if (k===0 && chektd=='no') {
				tableTags += '<td></td>';
				console.log(mapPopDataQuit.get(key)[k]);
				console.log(key);
				chektd='yes';
			}
			else if((popDataSelect[i]).replace(/\"/gi, "") == key.replace(/\"/gi, "")){
				let tableValue = Math.ceil((((mapPopDataQuit.get(key)[k] - mapPopDataQuit.get(key)[k-1]) / mapPopDataQuit.get(key)[k-1]) * 100));
				if (tableValue > 0) {
				tableTags += ' 										<td>'+tableValue+'% <div style="color:blue; display:inline">▲</div></td> ';
				}else if(tableValue < 0){
					tableTags += ' 										<td>'+tableValue+'% <div style="color:red; display:inline">▼</div></td> ';
				}else if(tableValue == 0){
					tableTags += ' 										<td>'+tableValue+'% <div style=" display:inline">-</div></td> ';
				}else {
					tableTags += '<td></td>';
				}
				
			}
		}
	}
	tableTags += ' </tr>';
	
	} // 지역 이름을 위해 2중 포문 사용
	tableTags += ' </tr>';

	
	
	
	tableTags += ' 								</tbody> ';
	
	tableTags += ' 							</table> ';




	tableTags += ' 						</div> ';
	tableTags += ' 					</div> ';
	tableTags += ' 				</div> ';
	
	$('#PageIn').append(tableTags);
	
	
	
	
	
	
	///////////////////////////////////// 동적으로 테이블 생성  ↑ ////////////////////////////////


var multipleLineChart = document.getElementById('multipleLineChart')
		.getContext('2d');
// multipleLineChart.destroy();

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
				},
				 scales: {
                     yAxes: [{
                         ticks: {
                             beginAtZero:true,
                             callback: function(value, index, values) {
                                 if(parseInt(value) >= 1000){
                                    return   value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'명';
                                 } else {
                                    return  value;
                                 }
                            }                            
                         }
                     }]
                 }
			}
		});
	
	






	
</script>










