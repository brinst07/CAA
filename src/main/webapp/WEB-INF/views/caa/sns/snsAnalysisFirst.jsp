<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('.date').datetimepicker({
			format : 'YYYY-MM-DD',
		});
	})
</script>

<div class="wrapper fullheight-side sidebar_minimize">

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
				<!-- 이름 /이메일 /아이디 입력란 -->
				<form action="/sns/snsAnalysis" method="post">
					<div class="form-group flex-container" align="center">
						<h3 class="pb-2 fw-bold">키워드를 입력해주세요</h3>
						<div>트위터, 블로그를 키워드로 크롤링하여 언급량 감정분석 연관검색어를 알려드립니다.</div>
						<div class="page-inner">
							<div class="row">
								<div class="col-md-6">
									<div class="card">
										<div class="card-header">
											<div class="card-head-row">
												<div class="card-title">시작일자</div>
											</div>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label>Input Date Picker</label>
												<div class="input-group">
													<input type="text" class="form-control date" id="datepicker" name="startDate">
													<div class="input-group-append">
														<span class="input-group-text"> <i class="fa fa-calendar"></i>
														</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="card">
										<div class="card-header">
											<div class="card-head-row">
												<div class="card-title">끝난일자</div>
											</div>
										</div>
										<div class="card-body">
											<div class="form-group">
												<label>Input Date Picker</label>
												<div class="input-group">
													<input type="text" class="form-control date" id="datepicker" name="endDate">
													<div class="input-group-append">
														<span class="input-group-text"> <i class="fa fa-calendar"></i>
														</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="input-icon">
								<input type="text" class="form-control" placeholder="Search for..." name="keyword"> <span class="input-icon-addon"> <i class="fa fa-search"></i>
								</span>
							</div>
						</div>
					</div>
					<div></div>
					<!-- 버튼 -->
					<div class="card-action" align="center">
						<button id="btnConfirm" type="submit" class="btn btn-primary">확인</button>
						<button type="reset" class="btn btn-black">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>