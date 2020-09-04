<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

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

   function sendEmail() {

   };
</script>

<!-- CSS Files -->
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

CSS Just for demo purpose, don't include it in your project
<link rel="stylesheet" href="/resources/assets/css/demo.css">
 -->
</head>
<style>
    .btn-wrapper{
      display: inline-block;
    }
    .custom-control {
      float: left;
      width: 150px;
    }
</style>
<body>

   <div class="wrapper fullheight-side sidebar_minimize">

      <div class="main-panel full-height">
         <div class="container">
            <div class="panel-header">
               <div class="page-inner border-bottom pb-0 mb-3">
                  <div class="d-flex align-items-left flex-column">
                     <h2 class="pb-2 fw-bold">공지 사항</h2>
						
                  </div>
               </div>
            </div>
            <div class="page-inner">
               <div class="card-body">
                  <div class="table-responsive">
                     <div id="multi-filter-select_wrapper"
                        class="dataTables_wrapper container-fluid dt-bootstrap4">
                        <div class="row">
                           <div class="col-sm-12 col-md-6">
                              
                           </div>
                           <div id="btn-wrapper" class="col-sm-12 col-md-6">
                             
                              <div id="custom-control">
                                   
                              </div>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-sm-12">
                              <table id="multi-filter-select"
                                 class="display table table-striped table-hover dataTable"
                                 role="grid" aria-describedby="multi-filter-select_info">
                                 <thead>
                                    <tr role="row">
                                       <th class="sorting_asc" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1" aria-sort="ascending"
                                          aria-label="Name: activate to sort column descending"
                                          style="width: 76px;">번호</th>
                                       <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Position: activate to sort column ascending"
                                          style="width: 96px;">제목</th>
                                       <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Office: activate to sort column ascending"
                                          style="width: 70px;">작성자</th>
                                       <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Age: activate to sort column ascending"
                                          style="width: 27px;">등록일</th>
                                           <th class="sorting" tabindex="0"
                                          aria-controls="multi-filter-select" rowspan="1"
                                          colspan="1"
                                          aria-label="Age: activate to sort column ascending"
                                          style="width: 27px;">조회수</th>
                                    </tr>
                                 </thead>
                                 <tfoot>
                                      
                                 </tfoot>
                                 <tbody>
                               
                                     <c:forEach items="${list }" var="board">
                                             <tr>
                                                <td><c:out value="${board.board_id }" /></td>
                                                <td><a class="move"
                                                   href='/notice/get?board_id=<c:out value="${board.board_id }"></c:out>'><c:out
                                                         value="${board.board_title }"></c:out><b>[<c:out
                                                            value="${board.board_reply_count } " />]
                                                   </b></a></td>
                                                <td><c:out value="${board.member_id }" /></td>
                                                <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                      value="${board.board_datetime }" /></td>
                                                <td><c:out value="${board.board_hit }" /></td>
                                             </tr>
                                          </c:forEach>
                                 </tbody>
                                   
                              </table>
                           </div>
                        </div>
                          <div class="email-action">
                           <button class="btn btn-primary" onclick="location.href='/notice/register?board_id=<c:out value="${board.board_id }"/>'">등록</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>

   </div>



   <script>
	$(document)
	.ready(
			function() {
				$('#basic-datatables').DataTable({});

				$('#multi-filter-select')
						.DataTable(
								{
									"pageLength" : 5,
									initComplete : function() {
										this
												.api()
												.columns()
												.every(
														function() {
															var column = this;
															var select = $(
																	'<select class="form-control"><option value=""></option></select>')
																	.appendTo(
																			$(
																					column
																							.footer())
																					.empty())
																	.on(
																			'change',
																			function() {
																				var val = $.fn.dataTable.util
																						.escapeRegex($(
																								this)
																								.val());

																				column
																						.search(
																								val ? '^'
																										+ val
																										+ '$'
																										: '',
																								true,
																								false)
																						.draw();
																			});

															column
																	.data()
																	.unique()
																	.sort()
																	.each(
																			function(
																					d,
																					j) {
																				select
																						.append('<option value="'+d+'">'
																								+ d
																								+ '</option>')
																			});
														});
									}
								});

			});
      $('#lineChart').sparkline([ 102, 109, 120, 99, 110, 105, 115 ], {
         type : 'line',
         height : '70',
         width : '100%',
         lineWidth : '2',
         lineColor : '#177dff',
         fillColor : 'rgba(23, 125, 255, 0.14)'
      });

      $('#lineChart2').sparkline([ 99, 125, 122, 105, 110, 124, 115 ], {
         type : 'line',
         height : '70',
         width : '100%',
         lineWidth : '2',
         lineColor : '#f3545d',
         fillColor : 'rgba(243, 84, 93, .14)'
      });

      $('#lineChart3').sparkline([ 105, 103, 123, 100, 95, 105, 115 ], {
         type : 'line',
         height : '70',
         width : '100%',
         lineWidth : '2',
         lineColor : '#ffa534',
         fillColor : 'rgba(255, 165, 52, .14)'
      });
   </script>
