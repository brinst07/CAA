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
			<div class="panel-header">
				<div class="page-inner border-bottom pb-0 mb-3">
					<div class="d-flex align-items-left flex-column">
						<h2 class="pb-2 fw-bold">Dashboard</h2>
						<div class="nav-scroller d-flex">
							<div
								class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
								<a class="nav-link active" href="#">New Orders<span
									class="badge badge-info ml-2">8</span></a> <a class="nav-link"
									href="#">Processed</a> <a class="nav-link" href="#">Cancelled<span
									class="badge badge-danger ml-2">2</span></a>
							</div>
							<div class="d-flex d-md-inline ml-md-auto py-2 py-md-0">
								<div class="dropdown d-inline mr-3 mr-md-2">
									<button class="btn btn-info btn-round dropdown-toggle"
										type="button" id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">Actions</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="#">Action</a> <a
											class="dropdown-item" href="#">Another action</a> <a
											class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
								<a href="#" class="btn btn-info btn-border btn-round"> <span
									class="btn-label"> <i class="fa fa-plus"></i></span> Add New
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-inner">
				<div class="row">
					<div class="col-sm-6 col-md-3">
						<div class="card card-stats card-round">
							<div class="card-body ">
								<div class="row">
									<div class="col-5">
										<div class="icon-big text-center">
											<i class="flaticon-chart-pie text-warning"></i>
										</div>
									</div>
									<div class="col-7 col-stats">
										<div class="numbers">
											<p class="card-category">Number</p>
											<h4 class="card-title">150GB</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="card card-stats card-round">
							<div class="card-body ">
								<div class="row">
									<div class="col-5">
										<div class="icon-big text-center">
											<i class="flaticon-coins text-success"></i>
										</div>
									</div>
									<div class="col-7 col-stats">
										<div class="numbers">
											<p class="card-category">Revenue</p>
											<h4 class="card-title">$ 1,345</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="card card-stats card-round">
							<div class="card-body">
								<div class="row">
									<div class="col-5">
										<div class="icon-big text-center">
											<i class="flaticon-error text-danger"></i>
										</div>
									</div>
									<div class="col-7 col-stats">
										<div class="numbers">
											<p class="card-category">Errors</p>
											<h4 class="card-title">23</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-md-3">
						<div class="card card-stats card-round">
							<div class="card-body">
								<div class="row">
									<div class="col-5">
										<div class="icon-big text-center">
											<i class="flaticon-twitter text-primary"></i>
										</div>
									</div>
									<div class="col-7 col-stats">
										<div class="numbers">
											<p class="card-category">Followers</p>
											<h4 class="card-title">+45K</h4>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<div class="card-head-row">
									<div class="card-title">User Statistics</div>
									<div class="card-tools">
										<a href="#"
											class="btn btn-info btn-border btn-round btn-sm mr-2"> <span
											class="btn-label"> <i class="fa fa-pencil"></i>
										</span> Export
										</a> <a href="#" class="btn btn-info btn-border btn-round btn-sm">
											<span class="btn-label"> <i class="fa fa-print"></i>
										</span> Print
										</a>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="chart-container" style="min-height: 375px">
									<canvas id="statisticsChart"></canvas>
								</div>
								<div id="myChartLegend"></div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card card-primary">
							<div class="card-header">
								<div class="card-title">Daily Sales</div>
								<div class="card-category">March 25 - April 02</div>
							</div>
							<div class="card-body pb-0">
								<div class="mb-4 mt-2">
									<h1>$4,578.58</h1>
								</div>
								<div class="pull-in">
									<canvas id="dailySalesChart"></canvas>
								</div>
							</div>
						</div>
						<div class="card card-primary bg-primary-gradient">
							<div class="card-body">
								<h4 class="mb-1 fw-bold">Tasks Progress</h4>
								<div id="task-complete" class="chart-circle mt-4 mb-3"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="card-body pb-0">
								<div class="h1 fw-bold float-right text-primary">+5%</div>
								<h2 class="mb-2">17</h2>
								<p class="text-muted">Users online</p>
								<div class="pull-in sparkline-fix">
									<div id="lineChart"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-body pb-0">
								<div class="h1 fw-bold float-right text-danger">-3%</div>
								<h2 class="mb-2">27</h2>
								<p class="text-muted">New Users</p>
								<div class="pull-in sparkline-fix">
									<div id="lineChart2"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-body pb-0">
								<div class="h1 fw-bold float-right text-warning">+7%</div>
								<h2 class="mb-2">213</h2>
								<p class="text-muted">Transactions</p>
								<div class="pull-in sparkline-fix">
									<div id="lineChart3"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row row-card-no-pd">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="card-head-row">
									<h4 class="card-title">Users Geolocation</h4>
									<div class="card-tools">
										<button class="btn btn-icon btn-link btn-primary btn-xs">
											<span class="fa fa-angle-down"></span>
										</button>
										<button
											class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card">
											<span class="fa fa-sync-alt"></span>
										</button>
										<button class="btn btn-icon btn-link btn-primary btn-xs">
											<span class="fa fa-times"></span>
										</button>
									</div>
								</div>
								<p class="card-category">Map of the distribution of users
									around the world</p>
							</div>
							<div class="card-body">
								<div class="row">
									<div class="col-md-6">
										<div class="table-responsive table-hover table-sales">
											<table class="table">
												<tbody>
													<tr>
														<td>
															<div class="flag">
																<img src="${pageContext.request.contextPath}/assets/img/flags/id.png" alt="indonesia">
															</div>
														</td>
														<td>Indonesia</td>
														<td class="text-right">2.320</td>
														<td class="text-right">42.18%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${pageContext.request.contextPath}/assets/img/flags/us.png"
																	alt="united states">
															</div>
														</td>
														<td>USA</td>
														<td class="text-right">240</td>
														<td class="text-right">4.36%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${pageContext.request.contextPath}/assets/img/flags/au.png" alt="australia">
															</div>
														</td>
														<td>Australia</td>
														<td class="text-right">119</td>
														<td class="text-right">2.16%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${pageContext.request.contextPath}/assets/img/flags/ru.png" alt="russia">
															</div>
														</td>
														<td>Russia</td>
														<td class="text-right">1.081</td>
														<td class="text-right">19.65%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${pageContext.request.contextPath}/assets/img/flags/cn.png" alt="china">
															</div>
														</td>
														<td>China</td>
														<td class="text-right">1.100</td>
														<td class="text-right">20%</td>
													</tr>
													<tr>
														<td>
															<div class="flag">
																<img src="${pageContext.request.contextPath}/assets/img/flags/br.png" alt="brazil">
															</div>
														</td>
														<td>Brasil</td>
														<td class="text-right">640</td>
														<td class="text-right">11.63%</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="col-md-6">
										<div class="mapcontainer">
											<div id="map-example" class="vmap"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<div class="card-title">Top Products</div>
							</div>
							<div class="card-body pb-0">
								<div class="d-flex">
									<div class="avatar">
										<img src="${pageContext.request.contextPath}/assets/img/logoproduct.svg" alt="..."
											class="avatar-img rounded-circle">
									</div>
									<div class="flex-1 pt-1 ml-2">
										<h6 class="fw-bold mb-1">CSS</h6>
										<small class="text-muted">Cascading Style Sheets</small>
									</div>
									<div class="d-flex ml-auto align-items-center">
										<h3 class="text-info fw-bold">+$17</h3>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="d-flex">
									<div class="avatar">
										<img src="${pageContext.request.contextPath}/assets/img/logoproduct.svg" alt="..."
											class="avatar-img rounded-circle">
									</div>
									<div class="flex-1 pt-1 ml-2">
										<h6 class="fw-bold mb-1">J.CO Donuts</h6>
										<small class="text-muted">The Best Donuts</small>
									</div>
									<div class="d-flex ml-auto align-items-center">
										<h3 class="text-info fw-bold">+$300</h3>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="d-flex">
									<div class="avatar">
										<img src="${pageContext.request.contextPath}/assets/img/logoproduct3.svg" alt="..."
											class="avatar-img rounded-circle">
									</div>
									<div class="flex-1 pt-1 ml-2">
										<h6 class="fw-bold mb-1">Ready Pro</h6>
										<small class="text-muted">Bootstrap 4 Admin Dashboard</small>
									</div>
									<div class="d-flex ml-auto align-items-center">
										<h3 class="text-info fw-bold">+$350</h3>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="pull-in">
									<canvas id="topProductsChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-body">
								<div class="card-title fw-mediumbold">Suggested People</div>
								<div class="card-list">
									<div class="item-list">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/jm_denis.jpg" alt="..."
												class="avatar-img rounded-circle">
										</div>
										<div class="info-user ml-3">
											<div class="username">Jimmy Denis</div>
											<div class="status">Graphic Designer</div>
										</div>
										<button class="btn btn-icon btn-primary btn-round btn-xs">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<div class="item-list">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
												class="avatar-img rounded-circle">
										</div>
										<div class="info-user ml-3">
											<div class="username">Chad</div>
											<div class="status">CEO Zeleaf</div>
										</div>
										<button class="btn btn-icon btn-primary btn-round btn-xs">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<div class="item-list">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/talha.jpg" alt="..."
												class="avatar-img rounded-circle">
										</div>
										<div class="info-user ml-3">
											<div class="username">Talha</div>
											<div class="status">Front End Designer</div>
										</div>
										<button class="btn btn-icon btn-primary btn-round btn-xs">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<div class="item-list">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/mlane.jpg" alt="..."
												class="avatar-img rounded-circle">
										</div>
										<div class="info-user ml-3">
											<div class="username">John Doe</div>
											<div class="status">Back End Developer</div>
										</div>
										<button class="btn btn-icon btn-primary btn-round btn-xs">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<div class="item-list">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/talha.jpg" alt="..."
												class="avatar-img rounded-circle">
										</div>
										<div class="info-user ml-3">
											<div class="username">Talha</div>
											<div class="status">Front End Designer</div>
										</div>
										<button class="btn btn-icon btn-primary btn-round btn-xs">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<div class="item-list">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/jm_denis.jpg" alt="..."
												class="avatar-img rounded-circle">
										</div>
										<div class="info-user ml-3">
											<div class="username">Jimmy Denis</div>
											<div class="status">Graphic Designer</div>
										</div>
										<button class="btn btn-icon btn-primary btn-round btn-xs">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card card-primary bg-primary-gradient">
							<div class="card-body">
								<h4 class="mt-3 b-b1 pb-2 mb-4 fw-bold">Active user right
									now</h4>
								<h1 class="mb-4 fw-bold">17</h1>
								<h4 class="mt-3 b-b1 pb-2 mb-5 fw-bold">Page view per
									minutes</h4>
								<div id="activeUsersChart"></div>
								<h4 class="mt-5 pb-3 mb-0 fw-bold">Top active pages</h4>
								<ul class="list-unstyled">
									<li class="d-flex justify-content-between pb-1 pt-1"><small>/product/readypro/index.html</small>
										<span>7</span></li>
									<li class="d-flex justify-content-between pb-1 pt-1"><small>/product/atlantis/demo.html</small>
										<span>10</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-title">Feed Activity</div>
							</div>
							<div class="card-body">
								<ol class="activity-feed">
									<li class="feed-item feed-item-secondary"><time
											class="date" datetime="9-25">Sep 25</time> <span class="text">Responded
											to need <a href="#">"Volunteer opportunity"</a>
									</span></li>
									<li class="feed-item feed-item-success"><time class="date"
											datetime="9-24">Sep 24</time> <span class="text">Added
											an interest <a href="#">"Volunteer Activities"</a>
									</span></li>
									<li class="feed-item feed-item-info"><time class="date"
											datetime="9-23">Sep 23</time> <span class="text">Joined
											the group <a href="single-group.php">"Boardsmanship
												Forum"</a>
									</span></li>
									<li class="feed-item feed-item-warning"><time class="date"
											datetime="9-21">Sep 21</time> <span class="text">Responded
											to need <a href="#">"In-Kind Opportunity"</a>
									</span></li>
									<li class="feed-item feed-item-danger"><time class="date"
											datetime="9-18">Sep 18</time> <span class="text">Created
											need <a href="#">"Volunteer Opportunity"</a>
									</span></li>
									<li class="feed-item"><time class="date" datetime="9-17">Sep
											17</time> <span class="text">Attending the event <a
											href="single-event.php">"Some New Event"</a></span></li>
								</ol>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<div class="card-head-row">
									<div class="card-title">Support Tickets</div>
									<div class="card-tools">
										<ul class="nav nav-pills nav-secondary nav-pills-no-bd nav-sm"
											id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link"
												id="pills-today" data-toggle="pill" href="#pills-today"
												role="tab" aria-selected="true">Today</a></li>
											<li class="nav-item"><a class="nav-link active"
												id="pills-week" data-toggle="pill" href="#pills-week"
												role="tab" aria-selected="false">Week</a></li>
											<li class="nav-item"><a class="nav-link"
												id="pills-month" data-toggle="pill" href="#pills-month"
												role="tab" aria-selected="false">Month</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="d-flex">
									<div class="avatar avatar-online">
										<span
											class="avatar-title rounded-circle border border-white bg-info">J</span>
									</div>
									<div class="flex-1 ml-3 pt-1">
										<h6 class="text-uppercase fw-bold mb-1">
											Joko Subianto <span class="text-warning pl-3">pending</span>
										</h6>
										<span class="text-muted">I am facing some trouble with
											my viewport. When i start my</span>
									</div>
									<div class="float-right pt-1">
										<small class="text-muted">8:40 PM</small>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="d-flex">
									<div class="avatar avatar-offline">
										<span
											class="avatar-title rounded-circle border border-white bg-secondary">P</span>
									</div>
									<div class="flex-1 ml-3 pt-1">
										<h6 class="text-uppercase fw-bold mb-1">
											Prabowo Widodo <span class="text-success pl-3">open</span>
										</h6>
										<span class="text-muted">I have some query regarding
											the license issue.</span>
									</div>
									<div class="float-right pt-1">
										<small class="text-muted">1 Day Ago</small>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="d-flex">
									<div class="avatar avatar-away">
										<span
											class="avatar-title rounded-circle border border-white bg-danger">L</span>
									</div>
									<div class="flex-1 ml-3 pt-1">
										<h6 class="text-uppercase fw-bold mb-1">
											Lee Chong Wei <span class="text-muted pl-3">closed</span>
										</h6>
										<span class="text-muted">Is there any update plan for
											RTL version near future?</span>
									</div>
									<div class="float-right pt-1">
										<small class="text-muted">2 Days Ago</small>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="d-flex">
									<div class="avatar avatar-offline">
										<span
											class="avatar-title rounded-circle border border-white bg-secondary">P</span>
									</div>
									<div class="flex-1 ml-3 pt-1">
										<h6 class="text-uppercase fw-bold mb-1">
											Peter Parker <span class="text-success pl-3">open</span>
										</h6>
										<span class="text-muted">I have some query regarding
											the license issue.</span>
									</div>
									<div class="float-right pt-1">
										<small class="text-muted">2 Day Ago</small>
									</div>
								</div>
								<div class="separator-dashed"></div>
								<div class="d-flex">
									<div class="avatar avatar-away">
										<span
											class="avatar-title rounded-circle border border-white bg-danger">L</span>
									</div>
									<div class="flex-1 ml-3 pt-1">
										<h6 class="text-uppercase fw-bold mb-1">
											Logan Paul <span class="text-muted pl-3">closed</span>
										</h6>
										<span class="text-muted">Is there any update plan for
											RTL version near future?</span>
									</div>
									<div class="float-right pt-1">
										<small class="text-muted">2 Days Ago</small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer">
			<div class="container-fluid">
				<nav class="pull-left">
					<ul class="nav">
						<li class="nav-item"><a class="nav-link"
							href="http://www.themekita.com"> ThemeKita </a></li>
						<li class="nav-item"><a class="nav-link" href="#"> Help </a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">
								Licenses </a></li>
					</ul>
				</nav>
				<div class="copyright ml-auto">
					2018, made with <i class="fa fa-heart heart text-danger"></i> by <a
						href="http://www.themekita.com">ThemeKita</a>
				</div>
			</div>
		</footer>
	</div>

	<div class="quick-sidebar">
		<a href="#" class="close-quick-sidebar"> <i class="flaticon-cross"></i>
		</a>
		<div class="quick-sidebar-wrapper">
			<ul class="nav nav-tabs nav-line nav-color-secondary" role="tablist">
				<li class="nav-item"><a class="nav-link active show"
					data-toggle="tab" href="#messages" role="tab" aria-selected="true">Messages</a>
				</li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#tasks" role="tab" aria-selected="false">Tasks</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#settings" role="tab" aria-selected="false">Settings</a></li>
			</ul>
			<div class="tab-content mt-3">
				<div class="tab-chat tab-pane fade show active" id="messages"
					role="tabpanel">
					<div class="messages-contact">
						<div class="quick-wrapper">
							<div class="quick-scroll scrollbar-outer">
								<div class="quick-content contact-content">
									<span class="category-title mt-0">Contacts</span>
									<div class="avatar-group">
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/jm_denis.jpg" alt="..."
												class="avatar-img rounded-circle border border-white">
										</div>
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
												class="avatar-img rounded-circle border border-white">
										</div>
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/mlane.jpg" alt="..."
												class="avatar-img rounded-circle border border-white">
										</div>
										<div class="avatar">
											<img src="${pageContext.request.contextPath}/assets/img/talha.jpg" alt="..."
												class="avatar-img rounded-circle border border-white">
										</div>
										<div class="avatar">
											<span class="avatar-title rounded-circle border border-white">+</span>
										</div>
									</div>
									<span class="category-title">Recent</span>
									<div class="contact-list contact-list-recent">
										<div class="user">
											<a href="#">
												<div class="avatar avatar-online">
													<img src="${pageContext.request.contextPath}/assets/img/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle border border-white">
												</div>
												<div class="user-data">
													<span class="name">Jimmy Denis</span> <span class="message">How
														are you ?</span>
												</div>
											</a>
										</div>
										<div class="user">
											<a href="#">
												<div class="avatar avatar-offline">
													<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
														class="avatar-img rounded-circle border border-white">
												</div>
												<div class="user-data">
													<span class="name">Chad</span> <span class="message">Ok,
														Thanks !</span>
												</div>
											</a>
										</div>
										<div class="user">
											<a href="#">
												<div class="avatar avatar-offline">
													<img src="${pageContext.request.contextPath}/assets/img/mlane.jpg" alt="..."
														class="avatar-img rounded-circle border border-white">
												</div>
												<div class="user-data">
													<span class="name">John Doe</span> <span class="message">Ready
														for the meeting today with...</span>
												</div>
											</a>
										</div>
									</div>
									<span class="category-title">Other Contacts</span>
									<div class="contact-list">
										<div class="user">
											<a href="#">
												<div class="avatar avatar-online">
													<img src="${pageContext.request.contextPath}/assets/img/jm_denis.jpg" alt="..."
														class="avatar-img rounded-circle border border-white">
												</div>
												<div class="user-data2">
													<span class="name">Jimmy Denis</span> <span class="status">Online</span>
												</div>
											</a>
										</div>
										<div class="user">
											<a href="#">
												<div class="avatar avatar-offline">
													<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
														class="avatar-img rounded-circle border border-white">
												</div>
												<div class="user-data2">
													<span class="name">Chad</span> <span class="status">Active
														2h ago</span>
												</div>
											</a>
										</div>
										<div class="user">
											<a href="#">
												<div class="avatar avatar-away">
													<img src="${pageContext.request.contextPath}/assets/img/talha.jpg" alt="..."
														class="avatar-img rounded-circle border border-white">
												</div>
												<div class="user-data2">
													<span class="name">Talha</span> <span class="status">Away</span>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="messages-wrapper">
						<div class="messages-title">
							<div class="user">
								<div class="avatar avatar-offline float-right ml-2">
									<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
										class="avatar-img rounded-circle border border-white">
								</div>
								<span class="name">Chad</span> <span class="last-active">Active
									2h ago</span>
							</div>
							<button class="return">
								<i class="flaticon-left-arrow-3"></i>
							</button>
						</div>
						<div class="messages-body messages-scroll scrollbar-outer">
							<div class="message-content-wrapper">
								<div class="message message-in">
									<div class="avatar avatar-sm">
										<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
											class="avatar-img rounded-circle border border-white">
									</div>
									<div class="message-body">
										<div class="message-content">
											<div class="name">Chad</div>
											<div class="content">Hello, Rian</div>
										</div>
										<div class="date">12.31</div>
									</div>
								</div>
							</div>
							<div class="message-content-wrapper">
								<div class="message message-out">
									<div class="message-body">
										<div class="message-content">
											<div class="content">Hello, Chad</div>
										</div>
										<div class="message-content">
											<div class="content">What's up?</div>
										</div>
										<div class="date">12.35</div>
									</div>
								</div>
							</div>
							<div class="message-content-wrapper">
								<div class="message message-in">
									<div class="avatar avatar-sm">
										<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
											class="avatar-img rounded-circle border border-white">
									</div>
									<div class="message-body">
										<div class="message-content">
											<div class="name">Chad</div>
											<div class="content">Thanks</div>
										</div>
										<div class="message-content">
											<div class="content">When is the deadline of the
												project we are working on ?</div>
										</div>
										<div class="date">13.00</div>
									</div>
								</div>
							</div>
							<div class="message-content-wrapper">
								<div class="message message-out">
									<div class="message-body">
										<div class="message-content">
											<div class="content">The deadline is about 2 months
												away</div>
										</div>
										<div class="date">13.10</div>
									</div>
								</div>
							</div>
							<div class="message-content-wrapper">
								<div class="message message-in">
									<div class="avatar avatar-sm">
										<img src="${pageContext.request.contextPath}/assets/img/chadengle.jpg" alt="..."
											class="avatar-img rounded-circle border border-white">
									</div>
									<div class="message-body">
										<div class="message-content">
											<div class="name">Chad</div>
											<div class="content">Ok, Thanks !</div>
										</div>
										<div class="date">13.15</div>
									</div>
								</div>
							</div>
						</div>
						<div class="messages-form">
							<div class="messages-form-control">
								<input type="text" placeholder="Type here"
									class="form-control input-pill input-solid message-input">
							</div>
							<div class="messages-form-tool">
								<a href="#" class="attachment"> <i class="flaticon-file"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="tasks" role="tabpanel">
					<div class="quick-wrapper tasks-wrapper">
						<div class="tasks-scroll scrollbar-outer">
							<div class="tasks-content">
								<span class="category-title mt-0">Today</span>
								<ul class="tasks-list">
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" checked=""
											class="custom-control-input"><span
											class="custom-control-label">Planning new project
												structure</span> <span class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											class="custom-control-label">Create the main structure
										</span> <span class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											class="custom-control-label">Add new Post</span> <span
											class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											class="custom-control-label">Finalise the design
												proposal</span> <span class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
								</ul>

								<span class="category-title">Tomorrow</span>
								<ul class="tasks-list">
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											class="custom-control-label">Initialize the project </span> <span
											class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											class="custom-control-label">Create the main structure
										</span> <span class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											class="custom-control-label">Updates changes to GitHub
										</span> <span class="task-action"> <a href="#"
												class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
									<li><label
										class="custom-checkbox custom-control checkbox-secondary">
											<input type="checkbox" class="custom-control-input"><span
											title="This task is too long to be displayed in a normal space!"
											class="custom-control-label">This task is too long to
												be displayed in a normal space! </span> <span class="task-action">
												<a href="#" class="link text-danger"> <i
													class="flaticon-interface-5"></i>
											</a>
										</span>
									</label></li>
								</ul>

								<div class="mt-3">
									<div class="btn btn-primary btn-rounded btn-sm">
										<span class="btn-label"> <i class="fa fa-plus"></i>
										</span> Add Task
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="settings" role="tabpanel">
					<div class="quick-wrapper settings-wrapper">
						<div class="quick-scroll scrollbar-outer">
							<div class="quick-content settings-content">

								<span class="category-title mt-0">General Settings</span>
								<ul class="settings-list">
									<li><span class="item-label">Enable Notifications</span>
										<div class="item-control">
											<input type="checkbox" checked data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">Signin with social
											media</span>
										<div class="item-control">
											<input type="checkbox" data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">Backup storage</span>
										<div class="item-control">
											<input type="checkbox" data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">SMS Alert</span>
										<div class="item-control">
											<input type="checkbox" checked data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
								</ul>

								<span class="category-title mt-0">Notifications</span>
								<ul class="settings-list">
									<li><span class="item-label">Email Notifications</span>
										<div class="item-control">
											<input type="checkbox" checked data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">New Comments</span>
										<div class="item-control">
											<input type="checkbox" checked data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">Chat Messages</span>
										<div class="item-control">
											<input type="checkbox" checked data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">Project Updates</span>
										<div class="item-control">
											<input type="checkbox" data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
									<li><span class="item-label">New Tasks</span>
										<div class="item-control">
											<input type="checkbox" checked data-toggle="toggle"
												data-onstyle="primary" data-style="btn-round">
										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Custom template | don't include it in your project! -->
	<div class="custom-template">
		<div class="title">Settings</div>
		<div class="custom-content">
			<div class="switcher">
				<div class="switch-block">
					<h4>Logo Header</h4>
					<div class="btnSwitch">
						<button type="button" class="changeLogoHeaderColor"
							data-color="dark"></button>
						<button type="button" class="selected changeLogoHeaderColor"
							data-color="blue"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="purple"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="light-blue"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="green"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="orange"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="red"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="white"></button>
						<br />
						<button type="button" class="changeLogoHeaderColor"
							data-color="dark2"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="blue2"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="purple2"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="light-blue2"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="green2"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="orange2"></button>
						<button type="button" class="changeLogoHeaderColor"
							data-color="red2"></button>
					</div>
				</div>
				<div class="switch-block">
					<h4>Sidebar</h4>
					<div class="btnSwitch">
						<button type="button" class="changeSideBarColor" data-color="dark"></button>
						<button type="button" class="selected changeSideBarColor"
							data-color="blue"></button>
						<button type="button" class="changeSideBarColor"
							data-color="purple"></button>
						<button type="button" class="changeSideBarColor"
							data-color="light-blue"></button>
						<button type="button" class="changeSideBarColor"
							data-color="green"></button>
						<button type="button" class="changeSideBarColor"
							data-color="orange"></button>
						<button type="button" class="changeSideBarColor" data-color="red"></button>
						<br />
						<button type="button" class="changeSideBarColor"
							data-color="dark2"></button>
						<button type="button" class="changeSideBarColor"
							data-color="blue2"></button>
						<button type="button" class="changeSideBarColor"
							data-color="purple2"></button>
						<button type="button" class="changeSideBarColor"
							data-color="light-blue2"></button>
						<button type="button" class="changeSideBarColor"
							data-color="green2"></button>
						<button type="button" class="changeSideBarColor"
							data-color="orange2"></button>
						<button type="button" class="changeSideBarColor" data-color="red2"></button>
					</div>
				</div>
				<div class="switch-block">
					<h4>Background</h4>
					<div class="btnSwitch">
						<button type="button" class="changeBackgroundColor"
							data-color="bg2"></button>
						<button type="button" class="changeBackgroundColor selected"
							data-color="bg1"></button>
						<button type="button" class="changeBackgroundColor"
							data-color="bg3"></button>
						<button type="button" class="changeBackgroundColor"
							data-color="dark"></button>
					</div>
				</div>
			</div>
		</div>
		<div class="custom-toggle">
			<i class="flaticon-settings"></i>
		</div>
	</div>
	<!-- End Custom template -->
	</div>
</body>
</html>