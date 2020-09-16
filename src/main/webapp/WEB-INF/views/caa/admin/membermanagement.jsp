<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
var userid ="";
$(function(){
	
	$("#basic-datatables tr").click(function(){
	            
	        // 현재 클릭된 Row(<tr>)
	        var tr = $(this);
	        var td = tr.children();

	        
	        userid = td.eq(1).text();
	  		
	       
	  })
});

function Delete(){
	if(userid != ""){
		
		location.href = "/admin/deletemember?userid="+userid;
		alert("삭제완료");
		userid="";
	}else alert("선택해주세요.")
}
function Modify(){
	if(userid != ""){
		location.href = "/admin/modifymember?userid="+userid;
		userid="";
	}else alert("선택해주세요.")
}
</script>

<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">회원관리</h2>
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
                                                    style="width: 76px;">번호
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Position: activate to sort column ascending"
                                                    style="width: 96px;">아이디
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Office: activate to sort column ascending"
                                                    style="width: 70px;">이름
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Age: activate to sort column ascending"
                                                    style="width: 27px;">이메일
                                                </th>
                                                <th class="sorting" tabindex="0"
                                                    aria-controls="basic-datatables" rowspan="1" colspan="1"
                                                    aria-label="Start date: activate to sort column ascending"
                                                    style="width: 83px;">등급
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody id="table">
											<c:set value="1" var="index"></c:set>

                                            <c:forEach items="${memberList }" var="memberInfo" varStatus="i">
                                                <tr id="table">
                                                    <td>${i.index+1 }</td>

                                                    <td><c:out value="${memberInfo.member_id}"></c:out></td>
                                                    <td><c:out value="${memberInfo.member_username }"/></td>
                                                    <td><c:out value="${memberInfo.member_email }"/></td>
                                                    <td><c:out value="${memberInfo.member_auth}"/></td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>

                                        </table>

										<div style="text-align: center;">
                                        <button data-oper='register' class="btn btn-primary"
                                                onclick="Modify()">수정
                                        </button>
                                        
                                        <button data-oper='register' class="btn btn-danger"
                                                onclick="Delete()">삭제
                                        </button>
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

</div>


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