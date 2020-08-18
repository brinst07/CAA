<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div class="main-panel full-height">
		<div class="container">
			<div class="page-inner mt--5">
				<div class="row">
					<div class="col-md-4">
						<div class="card" style="width: 450px;">
							<img class="card-img-top" src="/resources/assets/img/one.png" alt="Card image cap" width="450px" height="300px">
							<div class="card-body">
								<p class="card-text" align="center">상권분석</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card" style="width: 450px;">
							<img class="card-img-top" src="/resources/assets/img/ubjong.png" alt="Card image cap" width="450px" height="300px">
							<div class="card-body">
								<p class="card-text" align="center">업종추천</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card" style="width: 450px;">
							<img class="card-img-top" src="/resources/assets/img/vote.jpg" alt="Card image cap" width="450px" height="300px">
							<div class="card-body">
								<h3 class="card-title">설문조사</h3>
								<div class="separator-solid"></div>
								<p class="card-text">
								설문조사에 대한 내용을 길게 써보면 좋을거 같은데 어떻게 생각해?
								
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt--2">
					<div class="col-md-4">
						<div class="card" style="width: 450px;">
							<div class="card-body">
								<p class="card-text">설문조사</p>
							</div>
							<img class="card-img-top" src="/resources/assets/img/blogpost.jpg" alt="Card image cap">
						</div>
					</div>
					<div class="col-md-4">
						<div class="card" style="width: 450px;">
							<div class="card-body">
								<p class="card-text">설문조사</p>
							</div>
							<img class="card-img-top" src="/resources/assets/img/blogpost.jpg" alt="Card image cap">
						</div>
					</div>
					<div class="col-md-4">
						<div class="card" style="width: 450px;">
							<div class="card-body">
								<p class="card-text">설문조사</p>
							</div>
							<img class="card-img-top" src="/resources/assets/img/blogpost.jpg" alt="Card image cap">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#basic-datatables').DataTable({
			});

			$('#multi-filter-select').DataTable( {
				"pageLength": 5,
				initComplete: function () {
					this.api().columns().every( function () {
						var column = this;
						var select = $('<select class="form-control"><option value=""></option></select>')
						.appendTo( $(column.footer()).empty() )
						.on( 'change', function () {
							var val = $.fn.dataTable.util.escapeRegex(
								$(this).val()
								);

							column
							.search( val ? '^'+val+'$' : '', true, false )
							.draw();
						} );

						column.data().unique().sort().each( function ( d, j ) {
							select.append( '<option value="'+d+'">'+d+'</option>' )
						} );
					} );
				}
			});

			// Add Row
			$('#add-row').DataTable({
				"pageLength": 5,
			});

			var action = '<td> <div class="form-button-action"> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

			$('#addRowButton').click(function() {
				$('#add-row').dataTable().fnAddData([
					$("#addName").val(),
					$("#addPosition").val(),
					$("#addOffice").val(),
					action
					]);
				$('#addRowModal').modal('hide');

			});
		});
	</script>
	
</body>
</html>