<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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
</script>


<div class="wrapper sidebar_minimize fullheight-side">
	<!-- Logo Header -->
	<div class="logo-header position-fixed" data-background-color="blue">

		<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"> <i class="icon-menu"></i>
			</span>
		</button>
		<button class="topbar-toggler more">
			<i class="icon-options-vertical"></i>
		</button>
		<div class="nav-toggle">
			<button class="btn btn-toggle toggle-sidebar">
				<i class="icon-menu"></i>
			</button>
		</div>
	</div>
	<!-- End Logo Header -->





	<div class="main-panel full-height">
		<div class="container container-full">
			<div class="page-inner">
				<div class="page-with-aside mail-wrapper bg-white">
					<div class="page-content mail-content">
						<div class="email-head d-lg-flex d-block">
							<h2>
								<i class="flaticon-round mr-1"></i> 공지사항
							</h2>
						</div>
						<div class="email-compose-fields">
							<form>
								<div class="form-group row">
									<label for="to" class="col-form-label col-md-1">제목 </label>
									<div class="col-md-11">
										<input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.board_title }"/>' readonly="readonly">
									</div>
								</div>
								<div class="form-group row">
									<label for="cc" class="col-form-label col-md-1">작성자 </label>
									<div class="col-md-11">
										<input type="text" class="form-control" id="member_id" name="member_id" value='<c:out value="${board.member_id }"/>' readonly="readonly">
									</div>
									<br>
									<br>
									<div class="card-body"></div>
								</div>
							</form>
						</div>
						<div class="email-editor">
							<div class="form-group row">
								<label for="to" class="col-form-label col-md-1">내용 </label>
								<textarea class="form-control" rows="4" name="board_content" id="board_content" readonly="readonly"><c:out value="${board.board_content }"></c:out> </textarea>


							</div>



							<form role="form" actions="/notice/noticeView" method="post">


								<input type="hidden" id="board_id" name="board_id" value='10'> <input type="hidden" id="member_id" name="member_id" value='admin'> <input type="hidden" id="board_datetime" name="board_datetime" value='2020/08/23'> <input type="hidden" id="board_status" name="board_status" value='y'> <input type="hidden" id="board_category_id" name="board_category_id" value='1'> <input type="hidden" id="board_temp_save" name="board_temp_save" value='y'> <input
									type="hidden" id="board_hit" name="board_hit" value='10'>
							</form>



							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<label for="cc" class="col-form-label col-md-3">첨부파일</label>
										</div>
										<!-- /.panel-heading -->
										<div class="panel-body">
											<div class="form-group uploadDiv">
												<input type="file" name='uploadFile' multiple>
											</div>
											<div class='uploadResult'>
												<ul>
												</ul>
											</div>
										</div>
										<!--  end panel-body -->
									</div>
									<!--  end panel-body -->
								</div>
								<!-- end panel -->
							</div>
							<!-- /.row -->





							<div class="dz-message" data-dz-message></div>


							<div class="email-action">
								<button class="btn btn-default" onclick="location.href='/notice/modify?board=<c:out value="${board.board_id }"/>'">수정</button>
								<button class="btn btn-info" onclick="location.href='/notice/noticeList'">목록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</div>

<div class="quick-sidebar">
	<a href="#" class="close-quick-sidebar"> <i class="flaticon-cross"></i>
	</a>
</div>




<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#board_id").remove();
			operForm.attr("action", "/notice/noticeList")
			operForm.submit();
		});

	});
</script>

<script>
	$(document)
			.ready(
					function() {
						(function() {

							var board_id = '<c:out value="${board.board_id}"/>';

							$
									.getJSON(
											"/notice/getAttachList",
											{
												board_id : board_id
											},
											function(arr) {

												console.log(arr);

												var str = "";

												$(arr)
														.each(
																function(i,
																		attach) {

																	//image type
																	if (attach.fileType) {
																		var fileCallPath = encodeURIComponent(attach.uploadPath
																				+ "/s_"
																				+ attach.uuid
																				+ "_"
																				+ attach.fileName);

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<img src='/notice/display?fileName="
																				+ fileCallPath
																				+ "'>";
																		str += "</div>";
																		str
																				+ "</li>";
																	} else {

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
																		str += "<span> "
																				+ attach.fileName
																				+ "</span><br/>";
																		str += "<img src='/resources/img/attach.png'></a>";
																		str += "</div>";
																		str
																				+ "</li>";
																	}
																});

												$(".uploadResult ul").html(str);

											});//end getjson

						})(); // end function
					});
</script>

</body>
</html>