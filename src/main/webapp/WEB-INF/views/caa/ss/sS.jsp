<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#selectStatus {
	margin-right: 15px;
}
</style>
</head>
<body>
	<div class="main-panel full-height">

		<div class="container">
			<div class="page-inner">
				<div class="page-header">
					<h4 class="page-title">매출 통계</h4>
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

				<!-- 설명 부분 -->
				<div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-body" style="background: rgba(195, 195, 195, 0.3)">
								<div class="form-group">
									(추정) 매출액 현황은 해당 상권에 진입 또는 퇴출을 고려하는 예비창업자 및 소상공인에게 상권 성장 여부에 대한 추세를 제공하여 참고하도록 하는 것을 목적으로 소상공인 전체 매출현황이 아닙니다.<br>
* (추정) 매출액 현황은 상업적인 목적이 아닌 개인적인 용도로만 사용이 가능합니다.<br>
* 보도, 교육, 연구 등의 목적으로 사용하는 경우, 통계청의 자료를 이용하시기 바랍니다.<br>
(추정) 매출액 현황은 카드사 가맹점 매출현황을 기반으로 추정된 정보로서, 세부적인 조건(점포면적, 점포 위치의 입지조건, 서비스 품질 등)에 따라 달라질 수 있으니 참고 정보로만 활용하시기 바랍니다.<br>
매출정보를 보유하고 있지 않은 업종은 표시되지 않습니다.
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 설명 부분 -->


				<div>

					<!-- ------------- 헤더 부분 -------------- -->


					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<div class="form-group">
									<div class="selectgroup w-100">

										<label class="selectgroup-item"> <input type="radio"
											name="transportation" value="asdasd"
											class="selectgroup-input"> <span
											class="selectgroup-button selectgroup-button-icon"><i
												class="icon-screen-smartphone">행정구역</i></span>
										</label> <label id="selectStatus" class="selectgroup-item"> <input
											type="radio" name="transportation" value="1"
											class="selectgroup-input" checked> <span
											class="selectgroup-button selectgroup-button-icon"><i
												class="icon-screen-tablet"> 주요상권</i></span>
										</label> <select class="form-control form-control-sm">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select> <select class="form-control form-control-sm"
											id="selectStatus">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>


										</select> <label id="selectStatus" class="selectgroup-item"> <input
											type="radio" name="value" value="50"
											class="selectgroup-input" checked="checked"> <span
											class="selectgroup-button">상권업종</span>
										</label> <select class="form-control form-control-sm"
											id="selectStatus">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
										<button class="btn btn-primary btn-s" id="selectStatus">현황보기
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- ------------- 헤더 부분 -------------- -->
				</div>
				<div class="page-category">

					<!-- ----------------------------------- -->

					<div class="col-md-12">
						<div class="card">
							<div class="card-body">

								<table class="table">
									<thead>
										<tr>
											<th scope="col" colspan="2" rowspan="2">지역</th>
											<th scope="col" colspan="2" rowspan="2">업종</th>
											<th scope="col" colspan="2" style="text-align: center;">2019년
												상반기</th>
											<th scope="col" colspan="2" style="text-align: center;">2019년
												하반기</th>
										</tr>
										<tr>
											<th scope="col">월평균 매출</th>
											<th scope="col">건 단가</th>
											<th scope="col">월 평균 매출</th>
											<th scope="col">건 단가</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2">일반형</td>
											<td colspan="2">전체 업종구성시 기존</td>
											<td>7,068</td>
											<td>31,252</td>
											<td>7,716</td>
											<td>31,252</td>
										</tr>

									</tbody>
								</table>

							</div>
						</div>
					</div>
					<!-- ------------------- -->
				</div>



			</div>
		</div>
	</div>
	<!-- 	</div> -->
</body>


</html>