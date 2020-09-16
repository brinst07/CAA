<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="main-panel full-height">
	<div class="container">
		<div class="page-inner">
			<div class="page-header">
				<h4 class="page-title">Dashboard</h4>
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
							<a class="nav-link active" href="/ir/RecommendSectorsLevel">업종별 등급<span class="badge badge-info ml-2">8</span></a> <a class="nav-link" href="/ir/recommendSectorsType">상권 유형 판별</a> <a class="nav-link" href="/ir/iRecommendation3">안정성 우수 업종<span class="badge badge-danger ml-2">2</span></a>
						</div>

					</div>
				</div>
			</div>


			<!-- --------------------------- -->
		</div>
		<div class="page-category">

			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-title">업종구성(점포 수 기준)에 따른 상권유형</div>
							</div>
							<div class="card-body" style="text-align: center; font-size: 30px;">${SectorsType[0].sectors }</div>
							<div class="card-body" style="text-align: center; font-size: 30px;">${SectorsType[0].ratio }%</div>
						</div>


					</div>
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<div class="card-title">중분류</div>
							</div>
							<div class="card-body">
								<table class="table table-bordered">
									<thead>
										<tr>
											<c:forEach var="SectorsType" items="${SectorsType}">
												<td>${SectorsType.sectors }</td>
											</c:forEach>
										</tr>

									</thead>
									<tbody>
										<tr>
											<c:forEach var="SectorsType" items="${SectorsType}">
												<td>${SectorsType.ratio }%</td>
											</c:forEach>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="page-category">

			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<div class="card-title">중분류</div>
							</div>
							<div class="card-body">
								<table class="table table-bordered">
									<thead>
										<tr>
											<td colspan="2">외식업</td>
											<td colspan="2">소매업</td>
											<td colspan="2">서비스업</td>
										</tr>

									</thead>
									<tbody>
									<c:forEach var="SectorsLargeMiddle" items="${SectorsLargeMiddle}">
										<tr>
											
												<td>${SectorsLargeMiddle.sales_ser_name_1    }</td>
												<td>${SectorsLargeMiddle.sales_store_count_1 } 개</td>
												<td>${SectorsLargeMiddle.sales_ser_name_2    }</td>
												<td>${SectorsLargeMiddle.sales_store_count_2 } 개</td>
												<td>${SectorsLargeMiddle.sales_ser_name_3    }</td>
												<td>${SectorsLargeMiddle.sales_store_count_3 } 개</td>
											
										</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="card"> -->
<!-- 							<div class="card-header"> -->
<!-- 								<div class="card-title">중분류</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-body"> -->
<!-- 								<table class="table table-bordered"> -->
<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<td colspan="2">외식업</td> -->
<!-- 											<td colspan="2">소매업</td> -->
<!-- 											<td colspan="2">서비스업</td> -->
<!-- 										</tr> -->

<!-- 									</thead> -->
<!-- 									<tbody> -->
<%-- 									<c:forEach var="SectorsLargeMiddle" items="${SectorsLargeMiddle}"> --%>
<!-- 										<tr> -->
											
<%-- 												<td>${SectorsLargeMiddle.sales_ser_name_1    }</td> --%>
<%-- 												<td>${SectorsLargeMiddle.sales_store_count_1 } 개</td> --%>
<%-- 												<td>${SectorsLargeMiddle.sales_ser_name_2    }</td> --%>
<%-- 												<td>${SectorsLargeMiddle.sales_store_count_2 } 개</td> --%>
<%-- 												<td>${SectorsLargeMiddle.sales_ser_name_3    }</td> --%>
<%-- 												<td>${SectorsLargeMiddle.sales_store_count_3 } 개</td> --%>
											
<!-- 										</tr> -->
<%-- 										</c:forEach> --%>

<!-- 									</tbody> -->
<!-- 								</table> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		



	</div>
</div>