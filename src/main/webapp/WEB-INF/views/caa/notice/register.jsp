<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />

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

		<a href="index.html" class="logo"> <img src="../assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
		</a>
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
							<form id="operForm" role="form" action="/notice/register" method="post">
								<div class="form-group row">
									<label for="to" class="col-form-label col-md-1">제목 </label>
									<div class="col-md-11">
										<input type="text" class="form-control" id="title" name="board_title">
									</div>
								</div>
								<div class="form-group row">
									<label for="cc" class="col-form-label col-md-1">작성자 </label>
									<div class="col-md-11">
										<input type="text" class="form-control" id="member_id" name="member_id" readonly="readonly">
									</div>
									<br>
									<br>
									<div class="card-body"></div>
								</div>
								<div class="email-editor">
									<div class="form-group row">
										<label for="to" class="col-form-label col-md-1">내용 </label>
										<textarea class="form-control" rows="4" id="board_content" name="board_content"></textarea>



										<input type="hidden" id="board_id" name="board_id" value='10'> 
										<input type="hidden" id="member_id" name="member_id" value='admin'>
										<input type="hidden" id="board_datetime" name="board_datetime" value='2020/08/23'>
										<input type="hidden" id="board_status" name="board_status" value='y'> 
										<input type="hidden" id="board_category_id" name="board_category_id" value='1'> 
										<input type="hidden" id="board_temp_save" name="board_temp_save" value='y'> <input
											type="hidden" id="board_hit" name="board_hit" value='10'>
							</form>



							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<label for="cc" class="col-form-label col-md-1">첨부파일 </label>
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





							<form action="/notice/uploadFormAction" enctype="multipart/form" method="post" enctype=class="dropzone">
								<div class="dz-message" data-dz-message></div>

							</form>
						</div>
					</div>




					<div class="email-action">
						<button data-oper='register' type="button" class="btn btn-default">등록</button>
						<button class="btn btn-info" onclick="location.href='/notice/noticeList'">목록</button>
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


<script>
	$('#editor').summernote('code', '${board.board_content}');

	$('#editor').val("${board.board_content}");
	$('#editor').summernote({
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
		tabsize : 2,
		height : 300
	});
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var operForm = $("#operForm");

						var textareaVal = $("textarea[name=board_content]")
								.text();

						console.log(textareaVal);

						$("button[data-oper='register']")
								.on(
										"click",
										function(e) {

											// 추가한거
											e.preventDefault();

											console.log("Submit clicked");

											var str = "";

											$(".uploadResult ul li")
													.each(
															function(i, obj) {

																var jobj = $(obj);

																console
																		.dir(jobj);

																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName'value='"
																		+ jobj
																				.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid'value='"
																		+ jobj
																				.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath'value='"
																		+ jobj
																				.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType'value='"
																		+ jobj
																				.data("type")
																		+ "'>";

															});

											operForm.append(str).attr("action",
													"/notice/register")
													.submit();
										});

						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
						var maxSize = 5242880; //5MB

						function checkExtension(fileName, fileSize) {

							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}

							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								return false;
							}
							return true;
						}

						$("input[type='file']")
								.change(
										function(e) {

											var formData = new FormData();

											var inputFile = $("input[name='uploadFile']");

											var files = inputFile[0].files;

											for (var i = 0; i < files.length; i++) {

												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);

											}

											$
													.ajax({
														url : '/notice/uploadAjaxAction',
														processData : false,
														contentType : false,
														data : formData,
														type : 'POST',
														success : function(
																result) {
															console.log(result);
															showUploadResult(result); //업로드 결과 처리 함수 
														}
													}); //$.ajax

										});

						function showUploadResult(uploadResultArr) {

							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}

							var uploadUL = $(".uploadResult ul");

							var str = "";

							$(uploadResultArr)
									.each(
											function(i, obj) {

												//image type

												if (obj.image) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/s_"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													str += "<li data-path='"+obj.uploadPath+"'";
			         					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			         					str +" ><div>";
													str += "<span> "
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			         					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
													str += "<img src='/notice/display?fileName="
															+ fileCallPath
															+ "'>";
													str += "</div>";
													str + "</li>";
												} else {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													var fileLink = fileCallPath
															.replace(
																	new RegExp(
																			/\\/g),
																	"/");

													str += "<li "
			        					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
													str += "<span> "
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			         					str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
													str += "<img src='/resources/img/attach.png'></a>";
													str += "</div>";
													str + "</li>";
												}

											});

							uploadUL.append(str);
						}

						$(".uploadResult").on("click", "button", function(e) {

							console.log("delete file");

							var targetFile = $(this).data("file");
							var type = $(this).data("type");
							console.log(targetFile);

							var targetLi = $(this).closest("li");

							$.ajax({
								url : '/notice/deleteFile',
								data : {
									fileName : targetFile,
									type : type
								},
								dataType : 'text',
								type : 'POST',
								success : function(result) {
									alert(result);
									targetLi.remove();
								}
							}); //$.ajax

						});



					});
</script>