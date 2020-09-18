<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
	type="image/x-icon" />
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<style type="text/css">
#logo {
	width: 250px;
	padding-bottom: 20px;
}

#selectStatus {
	margin-right: 15px;
}
</style>
<script>
	
	
	function selectedSido(){
		var sido_code = $("select[name=sel1]").val();
	
		$('select[name=sel2]').children('option').remove();
		
		$.ajax({
			type : 'get', //get방식을 사용하겠다.
			url : '/caa/rest/sido/' +sido_code,   //controller주소 로 보내겠다.
			contentTyple : "application/json; charset=tuf-8",
			success : function(result,status,xhr){
				console.log("Ajax 성공 : " + result);
				for (var i = 0; i < result.length; i++) {
					console.log(result[i]);
					if(i==0){
						$('select[name=sel2]').append(
								'<option value="a">전체</option>');
					}
					$('select[name=sel2]').append(
							'<option value=' + result[i].sigungu_name + '>'
									+ result[i].sigungu_name + '</option>');
				}
			},
			error :function(xhr, status, er) {
				console.log("Ajax 실패")
				if (er) {
					error(er);
				}
			}
		})
	}

	function selectedLarge() {
		
		var cs_code = $("select[name=large]").val();
		
		$('select[name=middle]').children('option').remove();

		$.ajax({
			type : 'get',
			url : '/caa/rest/div/' + cs_code,
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {

				for (var i = 0; i < result.length; i++) {
					console.log(result[i]);
					if(i==0){
						$('select[name=middle]').append(
								'<option value="a">전체</option>');
					}
					$('select[name=middle]').append(
							'<option value=' + result[i].cs_code + '>'
									+ result[i].cs_code_name + '</option>');
				}

			},
			error : function(xhr, status, er) {
				console.log("Ajax 실패")
				if (er) {
					error(er);
				}
			}
		})

	}
	
	




	
	function showMetheTalbe(){
		var detailupjong= $("select[name=middle]").val();
		var upjong= $("select[name=large]").val();
		var sigungu= $("select[name=sel2]").val();
		var sido= $("select[name=sel1]").val();
		
		var params = '?upjong='+upjong;
		params += '&detailupjong='+detailupjong;
		params += '&sigungu='+sigungu;
		if(  sido == '' || sido == '전체' || sigungu == '전체' || sido == '1000' || sigungu == '1000' ||  sigungu == ''  ){
			alert("지역을 선택해주세요.");
			return false;
		}
		if( upjong == '' || upjong == '1000' || upjong == '전체'){
			alert("업종을 선택해주세요.");
			return false;
		}
		
		$('#tdResult').children('tr').remove();
		
		$.ajax({
			type : 'get',
			url : '/caa/rest/businessstatus/'+upjong+'/'+detailupjong+'/'+sigungu,
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {

				console.log("Ajax Success ");
				
					if(result[0] != null){
						for (var i = 0; i < result.length; i++) {
							console.log(result[i]);
								
							var tdResult  = '<tr>';
							tdResult  += '<td style="text-align:center;" >' + result[i].sales_bd_name+'</td>';
							tdResult += '<td style="text-align:center;">' + result[i].sales_ser_name + '</td>';
							
							tdResult += '<td style="text-align:center;">' + result[i].first+'</td>';
							tdResult += '<td style="text-align:center;">' + result[i].second+'</td>';
							if ( result[i].store > 0) {
									tdResult += '<td style="text-align:center;">' + result[i].store+'<div style="color:blue; display:inline">▲</div></td>';
								}else if( result[i].store < 0){
									tdResult += '<td style="text-align:center;">' + result[i].store+'<div style="color:red; display:inline">▼</div></td>';
								}else {
									tdResult += '<td style="text-align:center;">' + result[i].store+'</td>';
									
								}
							tdResult +='</tr>';
							$('#tdResult').append(
									tdResult
							);
					};
				}

			},
			error : function(xhr, status, er) {
				console.log("Ajax 실패")
			}
		})
	}
		

	
	
</script>
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>



			
		
<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">


		<div class="main-panel full-height">
			<div class="container">  
				<div class="panel-header">
				
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">

							<div class="page-header">
								<h4 class="page-title">업소 현황</h4>
								<ul class="breadcrumbs">
									<li class="nav-home"><a href="#"> <i
											class="flaticon-home"></i>
									</a></li>
									<li class="separator"><i class="flaticon-right-arrow"></i></li>
									<li class="nav-item"><a href="#">업소 현황</a></li>
								
								</ul>
							</div>
						</div>
						<!-- 설명 부분 -->
						<div>
							<div class="col-md-12">
								<div class="card">
									<div class="card-body"
										style="background: rgba(195, 195, 195, 0.3)">
										<div class="form-group">
											업소현황이란? 행정동별로 기본적인 업종 업소수 정보를 통해 상권분석 전 예비정보로 활용할 수 있습니다.<br>
											업소현황 : 행정동별 업종별 업소수와 변화추이를 분석할 수 있습니다. 업소현황 데이터는 공단이 보유한 상가업소
											데이터*를 기반으로 구성하였사오니, 현황자료가 아닌 단순 참고자료로만 활용하시기 바랍니다 * 보도, 교육,
											연구 등의 목적으로 사용하는 경우, 통계청의 자료를 이용하시기 바랍니다. * (출처)
											행안부인허가정보+현장조사정보+국세청 일부 폐업정보 등 * (규모기준) 해당 자료는 소상공인의 창폐업을 의미하지
											않음(대규모 점포, 중소기업, 소기업, 소상공인 등 다양한 사업체 정보가 포함) * (산출기준) 행안부 인허가
											정보를 제외한 현장조사정보는 개폐업일이 아닌, 현장조사 시점으로 작성(하반기 8~10월 중)되었으며, 국세청
											폐업정보는 일부만 확인가능하여, 시계열분석이 불가함
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 설명 부분 -->


					</div>
				</div>
				
				<div class="page-inner">
				<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<div class="form-group">
									<div class="selectgroup w-100">
										
										 <label class="selectStatus" class="selectgroup-item"> <input type="radio" name="transportation" value="1" class="selectgroup-input" checked="checked"> <span class="selectgroup-button selectgroup-button-icon"> <i class="icon-screen-tablet"> 주요상권</i></span>
										</label>
										 <select id="sel1" name="sel1" class="form-control form-control-sm"  onchange="selectedSido()">
												<option value="">전체</option>
													<c:forEach items="${SidoList }" var="SidoList">
														<option value="${SidoList.sido_code }">${SidoList.sido_name }</option>
													</c:forEach>
										</select> 
										<select name="sel2" id="sel2" class="form-control form-control-sm selectStatus">
												<option value="0">전체</option>
										</select>
										<!-- 상권 업종 ↓ -->
										 <label class="selectStatus selectgroup-item" style="padding-left: 10px"> <input type="radio" name="value" value="50" class="selectgroup-input" checked="checked"> <span class="selectgroup-button">상권업종</span>
										</label> <select class="form-control form-control-sm" name="large" onchange="selectedLarge()">
												<option value="">대분류</option>
											<c:forEach items="${csCodeList }" var="csCodeList">
											
												<option value="${csCodeList.cs_code }">${csCodeList.cs_code_name }</option>
											</c:forEach>
										</select> 
										<select class="form-control form-control-sm" name="middle">
											<option value="">중분류</option>
										</select>



										<!-- 상권 업종 ↑ -->

										<button id="viewButton" onclick="showMetheTalbe()" class="btn btn-primary btn-s selectStatus" style="margin-left: 10px">현황보기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				
					<div class="col-md-12">
						<div class="card">
							<div class="card-body">
								<div class="table table-head-bg-primary mt-4">
									<div id="basic-datatables_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table id="basic-datatables"
													class="display table table-striped table-hover dataTable"
													role="grid" aria-describedby="basic-datatables_info">
													<thead>
														<tr role="row">
															<th class="sorting_asc" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-sort="ascending"
																aria-label="Name: activate to sort column descending"
																style="width: 76px;">주요상권</th>
															<th class="sorting_asc" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-sort="ascending"
																aria-label="Name: activate to sort column descending"
																style="width: 76px;">세부업종</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Position: activate to sort column ascending"
																style="width: 96px;">2019년 상반기</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Office: activate to sort column ascending"
																style="width: 70px;">2019년 하반기</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Age: activate to sort column ascending"
																style="width: 27px;">증감률</th>

														</tr>
													</thead>

													<tbody id=tdResult>
														
													</tbody>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-5"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>





</html>