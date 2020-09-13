<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>
<div class="wrapper fullheight-side sidebar_minimize">
	<script>
		//로딩화면 만들기

		function LoadingWithMask(gif) {
			//화면의 높이와 너비를 구합니다.
			var maskHeight = $(document).height();
			var maskWidth = window.document.body.clientWidth;

			//화면에 출력할 마스크를 설정해줍니다.
			var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
			var loadingImg = '';

			loadingImg += " <img src='"+ gif +"' style='position: absolute; display: block; margin: 0px auto;'/>";

			//화면에 레이어 추가
			$('body').append(mask)

			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight,
				'opacity' : '0.3'
			});

			//마스크 표시
			$('#mask').show();

			//로딩중 이미지 표시
			$('#loadingImg').append(loadingImg);
			$('#loadingImg').show();
		}

		$(document).ajaxStart(function() {
			console.log('start');
			$('#loadingImg').show();

		});

		$(document).ajaxStop(function() {
			console.log('stop');
			$('#mask, #loadingImg').hide();
			$('#mask, #loadingImg').empty();

		});

		$(function() {

			//LoadingWithMask('/resources/assets/Wedges-3s-200px.gif');

			//return false;

			var startDate = '${startDate}';
			var endDate = '${endDate}';
			var keyword = '${keyword}';

			var d = {
				startDate : startDate,
				endDate : endDate,
				keyword : keyword
			}

			console.log(d);

			var frequency_list = $.ajax({
				url : "/sns/rest/wordCloud",
				dataType : "json",
				contentType : "application/json",
				async : false,
				data : JSON.stringify(d),
				type : 'post'
			}).responseText;
			var list = JSON.parse(frequency_list);

			var tableList = list.keywords;

			for (var i = 0; i < tableList.length; i++) {
				var html = "<tr><td>" + tableList[i] + "</td></tr>"
				$('#tbody').append(html);
			}

			var x = list.list;
			var color = d3.scale.linear().domain(
					[ 0, 1, 2, 3, 4, 5, 6, 10, 15, 20, 100 ]).range(
					[ "#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd",
							"#8c564b", "#e377c2", "#7f7f7f", "#bcbd22",
							"#c5b0d5", "#c49c94", "#7f7f7f" ]);

			d3.layout.cloud().size([ 600, 390 ]).words(x).rotate(0).fontSize(
					function(d) {
						return d.size;
					}).on("end", draw).start();

			function draw(words) {
				d3.select("#wordcloud").append("svg").attr("width", 600).attr(
						"height", 390).attr("class", "wordcloud").append("g")
						.attr("transform", "translate(200,200)").selectAll(
								"text").data(words).enter().append("text")
						.style("font-size", function(d) {
							return d.size + "px";
						}).style("fill", function(d, i) {
							return color(i);
						}).attr(
								"transform",
								function(d) {
									return "translate(" + [ d.x, d.y ]
											+ ")rotate(" + d.rotate + ")";
								}).text(function(d) {
							return d.text;
						});
			}

			var response = list.response;
			var response = JSON.parse(response);
			var resData = response.results[0];
			//response.results[0].data => 월별 데이터

			for (var i = 0; i < resData.data.length; i++) {
				myLineChart.data.labels.push(resData.data[i].period)
				myLineChart.data.datasets[0].data.push(resData.data[i].ratio)
			}

			//response.results[0].keywords[0]
			myLineChart.data.datasets[0].label = resData.keywords[0];

			myLineChart.update();
		});
	</script>
	<div id="loadingImg" style="display: none">
		<div id='mask' style='position: absolute; z-index: 9000; background-color: #000000; display: none; left: 0; top: 0;'>
			<img alt="" src="/resources/assets/Wedges-3s-200px.gif">
		</div>
	</div>
	<div class="main-panel full-height">
		<div class="container">
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">SNS분석</h2>
						<div class="nav-scroller d-flex"></div>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="card-header-row">
								<div class="card-title">월별 검색량 추이</div>
							</div>
							<div class="card-body">
								<div id="chart-container">
									<canvas id="LineChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-header-row">
									<div class="card-title">트위터 크롤링</div>
								</div>
								<div class="card-body">
									<div id="wordcloud" align="center"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-header-row">
									<div class="card-title">연관검색어</div>
								</div>
								<div class="card-body">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">연관검색어</th>
											</tr>
										</thead>
										<tbody id="tbody">
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
	<script type="text/javascript">
		var lineChart = $('#LineChart');

		var myLineChart = new Chart(lineChart, {
			type : 'line',
			data : {
				labels : [],
				datasets : [ {
					label : "",
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
					data : []
				} ]
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				legend : {
					position : 'bottom',
					labels : {
						padding : 10,
						fontColor : '#1d7af3',
					}
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
</div>