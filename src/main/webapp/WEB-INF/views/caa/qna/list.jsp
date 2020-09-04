<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
	<div class="wrapper fullheight-side sidebar_minimize">

                                            </table>
                                            <!-- <button data-oper='register' class="btn btn-black" onclick="location.href='/qna/register'">등록</button> -->

						</div>
						
					</div>
				</div>
				<div class="page-inner">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header"></div>
							<div class="card-body">
								<div class="table-responsive">
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
																style="width: 76px;">번호</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Position: activate to sort column ascending"
																style="width: 96px;">제목</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Office: activate to sort column ascending"
																style="width: 70px;">작성자</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Age: activate to sort column ascending"
																style="width: 27px;">등록일</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Start date: activate to sort column ascending"
																style="width: 83px;">조회수</th>
															
														</tr>
													</thead>
													<tfoot>
														<tr>
															<th rowspan="1" colspan="1">번호</th>
															<th rowspan="1" colspan="1">제목</th>
															<th rowspan="1" colspan="1">작성자</th>
															<th rowspan="1" colspan="1">등록일</th>
															<th rowspan="1" colspan="1">조회수</th>
														</tr>
													</tfoot>
													<tbody>

                                            <button data-oper='register' class="btn btn-primary"
                                                    onclick="location.href='/qna/register'">등록
                                            </button>
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

														<c:forEach items="${list }" var="board">
															<tr>
																<td><c:out value="${board.board_id }" /></td>
																<%-- <td><a href='/qna/get?board_id=<c:out value="${board.board_id }"/>'>
																<c:out value="${board.board_title }" /></a></td> --%>
																<td><a class="move" href='/qna/get?board_id=<c:out value="${board.board_id }"></c:out>'>
																<c:out value="${board.board_title }"></c:out></a><b>[<c:out
																				value="${board.board_reply_count } " />]
																	</b></a></td>
																<td><c:out value="${board.member_id }" /></td>
																<td><fmt:formatDate pattern="yyyy-MM-dd"
																		value="${board.board_datetime }" /></td>
																<%-- <td><fmt:formatDate pattern="yyyy-MM-dd"
																		value="${board.board_datetime }" /></td> --%>
																<td><c:out value="${board.board_hit }" /></td>
															</tr>
														</c:forEach>
														
													</tbody>
													
												</table>
												<!-- <button data-oper='register' class="btn btn-black" onclick="location.href='/qna/register'">등록</button> -->
												
												
												
												<hr>
												
												<div style='width:80px;float: right;'>
													<button data-oper='register' class="btn btn-primary" onclick="location.href='/qna/register'">등록</button>
												</div>
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
<!-- Core JS Files -->
<script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
<script src="/resources/assets/js/core/popper.min.js"></script>
<script src="/resources/assets/js/core/bootstrap.min.js"></script>
<!-- jQuery UI -->
<script
        src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script
        src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
<!-- Bootstrap Toggle -->
<script
        src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<!-- jQuery Scrollbar -->
<script
        src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<!-- Datatables -->
<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>
<!-- Atlantis JS -->
<script src="/resources/assets/js/atlantis.min.js"></script>

<script>
    $(document)
        .ready(
            function () {
                $('#basic-datatables').DataTable({});

                $('#multi-filter-select')
                    .DataTable(
                        {
                            "pageLength": 5,
                            initComplete: function () {
                                this
                                    .api()
                                    .columns()
                                    .every(
                                        function () {
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
                                                    function () {
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
                                                    function (
                                                        d,
                                                        j) {
                                                        select
                                                            .append('<option value="' + d + '">'
                                                                + d
                                                                + '</option>')
                                                    });
                                        });
                            }
                        });

            });
</script>
</body>
</html>