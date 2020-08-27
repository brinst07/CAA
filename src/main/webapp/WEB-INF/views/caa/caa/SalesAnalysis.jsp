<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
	type="image/x-icon" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<style type="text/css">
#logo {
	width: 250px;
	padding-bottom: 20px;
}

.fontsize {
	font-size: 13px;
}

.thfont {
	font-size: 13px;
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

						<div
							class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
							<a class="nav-link" href="commercialanalysis">상권분석</a> <a
								class="nav-link " href="industryanalysis">업종분석</a> <a
								class="nav-link active " href="SaleAnalysis">매출분석</a> <a
								class="nav-link " href="test4">인구분석</a>
						</div>
					</div>
				</div>
				<div class="page-inner">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">1. 업종별 매출추이</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas id="multipleLineChart" width="306" height="300"
										class="chartjs-render-monitor"
										style="display: block; width: 306px; height: 300px;"></canvas>
								</div>
								<br>


								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col" colspan="6" style="text-align: center;"center" ><span>${list[0].sales_ser_name }</th>
										</tr>
										<tr>
											<th scope="col" class="thfont" align="center"
												style="text-align: center;">분기</th>
											<th scope="col" class="thfont" style="text-align: center;">당월
												매출 금액</th>
											<th scope="col" class="thfont" style="text-align: center;"center" ><span>당월매출
													건수</th>
											<th scope="col" class="thfont" style="text-align: center;"center" ><span>점포수</th>
											<th scope="col" class="thfont" style="text-align: center;"center" ><span>주중
													매출 비율</th>
											<th scope="col" class="thfont" style="text-align: center;"center" ><span>주말
													매출 비율</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach items="${list }" var="Info" varStatus="i">
											<tr>
												<td style="text-align: center;">${Info.sales_year}년
													${Info.sales_bungi_code} 분기</td>
												<td style="text-align: right;">${Info.sales_mnt_price }
													원</td>
												<td style="text-align: center;">${Info.sales_mnt_count }
													건</td>
												<td style="text-align: center;">${Info.sales_store_count }
													개점</td>
												<td style="text-align: center;">${Info.sales_wd_rati }
													%</td>
												<td style="text-align: center;">${Info.sales_wk_rati}%</td>

											</tr>
										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">2. 요일별 매출추이</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas id="multipleLineChart1" width="306" height="300"
										class="chartjs-render-monitor"
										style="display: block; width: 306px; height: 300px;"></canvas>
								</div>
								<br>


								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col" colspan="19" style="text-align: center;"center" ><span>${list[0].sales_ser_name }</th>
										</tr>
										<tr>
											<th scope="col" rowspan="2" align="center"
												style="text-align: center;"><span class="thfont">분기</span></th>
											<th scope="col" colspan="2" style="text-align: center;"><span
												class="thfont">월</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">화</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">수</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">목</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">금</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">토</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">일</span></th>

										</tr>
										<tr>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</th>
											<th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="Info" varStatus="i">
											<tr>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_year}년
														${Info.sales_bungi_code} 분기</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_mon_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_mon_rati}%</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_tue_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_tue_rati}%</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_wed_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_wed_rati}%</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_thu_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_thu_rati}%</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_fri_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_fri_rati}%</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_sat_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_sat_rati}%</span></td>
												<td style="text-align: right;"><span class="fontsize">${Info.sales_sun_price }원</span></td>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_sun_rati}%</span></td>
											</tr>
										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-title">3. 시간별 매출추이</div>
							</div>
							<div class="card-body">
								<div class="chart-container">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas id="multipleLineChart2" width="306" height="300"
										class="chartjs-render-monitor"
										style="display: block; width: 306px; height: 300px;"></canvas>

								</div>
							</div>
							<div class="page-inner">
								<div class="col-md-12">
									<div class="card">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th scope="col" colspan="19" style="text-align: center;"center" ><span>${list[0].sales_ser_name }</th>
												</tr>
												<tr>
													<th scope="col" rowspan="2" align="center"
														style="text-align: center;"><span class="thfont">분기</span></th>
													<th scope="col" colspan="2" style="text-align: center;"><span
														class="thfont">00~06</span></th>
													<th scope="col" colspan="2" style="text-align: center;"center" ><span
														class="thfont">06~11</span></th>
													<th scope="col" colspan="2" style="text-align: center;"center" ><span
														class="thfont">11~14</span></th>
													<th scope="col" colspan="2" style="text-align: center;"center" ><span
														class="thfont">14~17</span></th>
													<th scope="col" colspan="2" style="text-align: center;"center" ><span
														class="thfont">17~21</span></th>
													<th scope="col" colspan="2" style="text-align: center;"center" ><span
														class="thfont">21~24</span></th>

												</tr>
												<tr>
													<th scope="col" align="center" style="text-align: center;"><span
														class="thfont">금액</span></th>
													<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
													<th scope="col" align="center" style="text-align: center;"><span
														class="thfont">금액</span></th>
													<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
													<th scope="col" align="center" style="text-align: center;"><span
														class="thfont">금액</span></th>
													<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
													<th scope="col" align="center" style="text-align: center;"><span
														class="thfont">금액</span></th>
													<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
													<th scope="col" align="center" style="text-align: center;"><span
														class="thfont">금액</span></th>
													<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
													<th scope="col" align="center" style="text-align: center;"><span
														class="thfont">금액</span></th>
													<th scope="col" style="text-align: center;"center" ><span>비율</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list }" var="Info" varStatus="i">
													<tr>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_year}년
																${Info.sales_bungi_code} 분기</span></td>
														<td style="text-align: right;"><span class="fontsize">${Info.sales_0006_price }원</span></td>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_0006_rati}%</span></td>
														<td style="text-align: right;"><span class="fontsize">${Info.sales_0611_price }원</span></td>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_0611_rati}%</span></td>
														<td style="text-align: right;"><span class="fontsize">${Info.sales_1114_price }원</span></td>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_1114_rati}%</span></td>
														<td style="text-align: right;"><span class="fontsize">${Info.sales_1417_price }원</span></td>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_1417_rati}%</span></td>
														<td style="text-align: right;"><span class="fontsize">${Info.sales_1721_price }원</span></td>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_1721_rati}%</span></td>
														<td style="text-align: right;"><span class="fontsize">${Info.sales_2124_price }원</span></td>
														<td style="text-align: center;"><span
															class="fontsize">${Info.sales_2124_rati}%</span></td>
													</tr>
												</c:forEach>


											</tbody>

										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">4. 연령별 매출추이</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<div class="chartjs-size-monitor"
											style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div class="chartjs-size-monitor-expand"
												style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
												<div
													style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
											</div>
											<div class="chartjs-size-monitor-shrink"
												style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
												<div
													style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
											</div>
										</div>
										<canvas id="multipleLineChart3" width="306" height="300"
											class="chartjs-render-monitor"
											style="display: block; width: 306px; height: 300px;"></canvas>
									</div>
									<br>


									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="col" colspan="19" style="text-align: center;"center" ><span>${list[0].sales_ser_name }</th>
											</tr>
											<tr>
												<th scope="col" rowspan="2" align="center"
													style="text-align: center;"><span class="thfont">분기</span></th>
												<th scope="col" colspan="2" style="text-align: center;"><span
													class="thfont">10대</span></th>
												<th scope="col" colspan="2" style="text-align: center;"center" ><span
													class="thfont">20대</span></th>
												<th scope="col" colspan="2" style="text-align: center;"center" ><span
													class="thfont">30대</span></th>
												<th scope="col" colspan="2" style="text-align: center;"center" ><span
													class="thfont">40대</span></th>
												<th scope="col" colspan="2" style="text-align: center;"center" ><span
													class="thfont">50대</span></th>
												<th scope="col" colspan="2" style="text-align: center;"center" ><span
													class="thfont">60대</span></th>

											</tr>
											<tr>
												<th scope="col" align="center" style="text-align: center;"><span
													class="thfont">금액</span></th>
												<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
												<th scope="col" align="center" style="text-align: center;"><span
													class="thfont">금액</span></th>
												<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
												<th scope="col" align="center" style="text-align: center;"><span
													class="thfont">금액</span></th>
												<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
												<th scope="col" align="center" style="text-align: center;"><span
													class="thfont">금액</span></th>
												<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
												<th scope="col" align="center" style="text-align: center;"><span
													class="thfont">금액</span></th>
												<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
												<th scope="col" align="center" style="text-align: center;"><span
													class="thfont">금액</span></th>
												<th scope="col" style="text-align: center;"center" ><span>비율</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list }" var="Info" varStatus="i">
												<tr>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_year}년${Info.sales_bungi_code}
															분기</span></td>
													<td style="text-align: right;"><span class="fontsize">${Info.sales_age_10_price }원</span></td>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_age_10_rati}%</span></td>
													<td style="text-align: right;"><span class="fontsize">${Info.sales_age_20_price }원</span></td>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_age_20_rati}%</span></td>
													<td style="text-align: right;"><span class="fontsize">${Info.sales_age_30_price }원</span></td>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_age_30_rati}%</span></td>
													<td style="text-align: right;"><span class="fontsize">${Info.sales_age_40_price }원</span></td>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_age_40_rati}%</span></td>
													<td style="text-align: right;"><span class="fontsize">${Info.sales_age_50_price }원</span></td>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_age_50_rati}%</span></td>
													<td style="text-align: right;"><span class="fontsize">${Info.sales_age_60_price }원</span></td>
													<td style="text-align: center;"><span class="fontsize">${Info.sales_age_60_rati}%</span></td>
												</tr>
											</c:forEach>


										</tbody>

									</table>
								</div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="card-title">5. 성별 매출추이</div>
								</div>
								<div class="card-body">
									<div class="chart-container">
										<div class="chartjs-size-monitor"
											style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div class="chartjs-size-monitor-expand"
												style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
												<div
													style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
											</div>
											<div class="chartjs-size-monitor-shrink"
												style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
												<div
													style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
											</div>
										</div>
										<canvas id="doughnutChart"
											style="width: 438px; height: 300px; display: block;"
											width="438" height="300" class="chartjs-render-monitor"></canvas>
									</div>

								</div>
								<br>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col" colspan="19" style="text-align: center;"center" ><span>${list[0].sales_ser_name }</th>
										</tr>
										<tr>
											<th scope="col" rowspan="2" align="center"
												style="text-align: center;"><span class="thfont">분기</span></th>
											<th scope="col" colspan="2" style="text-align: center;"><span
												class="thfont">남자</span></th>
											<th scope="col" colspan="2" style="text-align: center;"center" ><span
												class="thfont">여자</span></th>
										</tr>
										<tr>
											<th scope="col" align="center" style="text-align: center;"><span
												class="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>
											<th scope="col" align="center" style="text-align: center;"><span
												class="thfont">금액</span></th>
											<th scope="col" style="text-align: center;"center" ><span>비율</span></th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list }" var="Info" varStatus="i">
											<tr>
												<td style="text-align: center;"><span class="fontsize">${Info.sales_year}년
														${Info.sales_bungi_code} 분기</span></td>
												<td style="text-align: right;"><span>${Info.sales_men_price }원</span></td>
												<td style="text-align: center;"><span>${Info.sales_men_rati}%</span></td>
												<td style="text-align: right;"><span>${Info.sales_wom_price }원</span></td>
												<td style="text-align: center;"><span>${Info.sales_wom_rati}%</span></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>



		</div>

		<!-- jQuery UI -->
		<script
			src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
		<script
			src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

		<!-- jQuery Scrollbar -->
		<script
			src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

		<!-- Moment JS -->
		<script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

		<!-- Chart JS -->
		<script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

		<!-- jQuery Sparkline -->
		<script
			src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

		<!-- Chart Circle -->
		<script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

		<!-- Datatables -->
		<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

		<!-- Bootstrap Notify -->
		<script
			src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

		<!-- Bootstrap Toggle -->
		<script
			src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

		<!-- jQuery Vector Maps -->
		<script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
		<script
			src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

		<!-- Google Maps Plugin -->
		<script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

		<!-- Dropzone -->
		<script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

		<!-- Fullcalendar -->
		<script
			src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

		<!-- DateTimePicker -->
		<script
			src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

		<!-- Bootstrap Tagsinput -->
		<script
			src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

		<!-- Bootstrap Wizard -->
		<script
			src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

		<!-- jQuery Validation -->
		<script
			src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

		<!-- Summernote -->
		<script
			src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

		<!-- Select2 -->
		<script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

		<!-- Sweet Alert -->
		<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

		<!-- Owl Carousel -->
		<script
			src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

		<!-- Magnific Popup -->
		<script
			src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

		<!-- Atlantis JS -->
		<script src="/resources/assets/js/atlantis.min.js"></script>

		<script>
			var myDoughnutChart = new Chart(doughnutChart, {
				type : 'doughnut',
				data : {
					datasets : [ {
						data : [ 10, 30 ],
						backgroundColor : [ '#f3545d', '#1d7af3' ]
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

			var myMultipleLineChart = new Chart(multipleLineChart, {
				type : 'line',
				data : {
					labels : [ "${list[3].sales_bungi_code}",
							"${list[2].sales_bungi_code}",
							"${list[1].sales_bungi_code}",
							"${list[0].sales_bungi_code}" ],
					datasets : [ {
						label : "${list[0].sales_ser_name}",
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
						data : [ 30, 45, 45, 68 ]
					}

					]
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

			var myMultipleLineChart1 = new Chart(multipleLineChart1, {
				type : 'line',
				data : {
					labels : [ "월", "화", "수", "목", "금", "토", "일" ],
					datasets : [

					{
						label : "${list[0].sales_ser_name}",
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
						data : [ 30, 45, 45, 68, 65, 32, 88 ]
					}

					]
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
			var myMultipleLineChart2 = new Chart(multipleLineChart2, {
				type : 'line',
				data : {
					labels : [ "00~06", "06~11", "11~14", "14~17", "17~21",
							"21~24" ],
					datasets : [ {
						label : "${list[0].sales_ser_name}",
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
						data : [ 30, 45, 45, 68, 65, 32 ]
					}

					]
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

			var myMultipleLineChart3 = new Chart(multipleLineChart3, {
				type : 'line',
				data : {
					labels : [ "10대", "20대", "30대", "40대", "50대", "60대" ],
					datasets : [ {
						label : "${list[0].sales_ser_name}",
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
						data : [ 30, 45, 45, 68, 65, 32 ]
					}

					]
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
					}
				}
			});
		</script>
		<!-- jQuery UI -->

		<script
			src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
		<script
			src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

		<!-- jQuery Scrollbar -->
		<script
			src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

		<!-- Moment JS -->
		<script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

		<!-- Chart JS -->
		<script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

		<!-- jQuery Sparkline -->
		<script
			src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

		<!-- Chart Circle -->
		<script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

		<!-- Datatables -->
		<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

		<!-- Bootstrap Notify -->
		<script
			src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

		<!-- Bootstrap Toggle -->
		<script
			src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

		<!-- jQuery Vector Maps -->
		<script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
		<script
			src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

		<!-- Google Maps Plugin -->
		<script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

		<!-- Dropzone -->
		<script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

		<!-- Fullcalendar -->
		<script
			src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

		<!-- DateTimePicker -->
		<script
			src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

		<!-- Bootstrap Tagsinput -->
		<script
			src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

		<!-- Bootstrap Wizard -->
		<script
			src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

		<!-- jQuery Validation -->
		<script
			src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

		<!-- Summernote -->
		<script
			src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

		<!-- Select2 -->
		<script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

		<!-- Sweet Alert -->
		<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

		<!-- Owl Carousel -->
		<script
			src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

		<!-- Magnific Popup -->
		<script
			src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

		<!-- Atlantis JS -->
		<script src="/resources/assets/js/atlantis.min.js"></script>


		</body>
</html>

