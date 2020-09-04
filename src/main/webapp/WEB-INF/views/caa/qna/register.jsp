<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style type="text/css">
.uploadResult ul li {
	display: inline-block;
	margin: 10px;
}
</style>

<div class="wrapper sidebar_minimize fullheight-side">
	<!-- Logo Header -->
	<div class="logo-header position-fixed" data-background-color="blue">

		<a href="index.html" class="logo"> <img
			src="/resources/assets/img/logo.svg" alt="navbar brand"
			class="navbar-brand">
		</a>
		<button class="navbar-toggler sidenav-toggler ml-auto" type="button"
			data-toggle="collapse" data-target="collapse" aria-expanded="false"
			aria-label="Toggle navigation">
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
								<i class="flaticon-round mr-1"></i> QnA
							</h2>
						</div>
						<div class="email-compose-fields">

							<form id="operForm" role="form" action="/qna/register"
								method="post">

								<div class="form-group row">
									<label for="to" class="col-form-label col-md-1">&nbsp;&nbsp;&nbsp;&nbsp; 제목 </label>
									<div class="col-md-11">
										<input type="text" class="form-control" id="title"
											name="board_title" value="">
									</div>
									
									
								
								<!-- <div class="form-group row"> -->
									<br> <br>
									<div class="card-body">


										<div class="form-group row">
											<label  for="to" class="col-form-label col-md-1">&nbsp;&nbsp;내용 </label>







											<!-- <textarea id="editor" name="board_content"></textarea> -->
										</div>
										
										


										<!-- --------------- -->
<!-- 										<form role="form" actions="/qna/register" method="post"> -->


<!-- 												<input typfe="hidden" id="board_id" name="board_id" value='10'>  -->
<!-- 												<input type="hidden" id="member_id" name="member_id" value='admin'>  -->
<!-- 												<input type="hidden" id="board_datetime" name="board_datetime" value='2020/08/23'>  -->
<!-- 												<input type="hidden" id="board_status" name="board_status" value='y'>  -->
<!-- 												<input type="hidden" id="board_category_id" name="board_category_id" value='1'>  -->
<!-- 												<input type="hidden" id="board_temp_save" name="board_temp_save" value='y'>  -->
<!-- 												<input type="hidden" id="board_hit" name="board_hit" value='10'> -->
<!-- 											</form> -->
						
						
						<div class="row">
											<div class="col-lg-12">
												<div class="panel panel-default">
													<label for="cc" class="col-form-label col-md-1">첨부파일 </label>
													<!-- <div class="panel-heading">File Attach</div> -->
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



						<hr>
							<div class="email-editor">
						<div id="editor"></div>
						<div class="email-action">
							<button data-oper='register' type="button" class="btn btn-primary">확인</button>
							<button type="reset" class="btn btn-black" onclick="location.href='/qna/list'">취소</button>

							<%-- <form id='operform' action="/qna/modify" method="get">
                           	<input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>

						</div>
					</div>
				</div>
</div>





										<!-- 원래 여기 File Attach -->
										
										
										
										<!-- <button data-oper='register' type="button"
											class="btn btn-primary">확인</button>

										<button class="btn btn-black">삭제</button>
										<button type="reset" class="btn btn-black"
											onclick="location.href='/qna/list'">취소</button> -->
											
									
							
							
							<!-- <div class="email-editor">
						<div id="editor"></div>
						<div class="email-action"> -->
							<!-- <button data-oper='register' type="button" class="btn btn-primary">확인</button> -->
							<!-- 							<button class="btn btn-black">삭제</button> -->
							<!-- 							<button type="reset" class="btn btn-black" -->
							<!-- 								onclick="location.href='/qna/list'">취소</button> -->

							<%-- <form id='operform' action="/qna/modify" method="get">
                           	<input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>

						<!-- </div>
					</div>

					여기다 폼끝나는거
				</div> -->
											
											
											
											
											
											
							</form>


						<!-- 요깅 -->
						





<!-- 							<form action="/qna/uploadFormAction" enctype="multipart/form" -->
<!-- 								method="post" enctype=class="dropzone"> -->

<!-- 								<div class="dz-message" data-dz-message> -->

<!-- 									<label for="cc" class="col-form-label col-md-1">첨부파일 </label> -->
<!-- 									<h4 class="message">첨부파일</h4> -->
<!-- 								</div> -->
<!-- 								<div class="fallback"> -->
<!-- 									<input name="file" type="file" multiple /> -->
<!-- 								</div> -->
<!-- 							</form> -->
						</div>
					</div>


					<div class="email-editor">
						<div id="editor"></div>
						<div class="email-action">
							<!-- 							<button data-oper='register' type="button" -->
							<!-- 								class="btn btn-primary">확인</button> -->



							<!-- 							<button class="btn btn-black">삭제</button> -->
							<!-- 							<button type="reset" class="btn btn-black" -->
							<!-- 								onclick="location.href='/qna/list'">취소</button> -->

							<%-- <form id='operform' action="/qna/modify" method="get">
                           	<input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>

						</div>
					</div>

					<!-- 여기다 폼끝나는거 -->
				</div>





			</div>
		</div>
	</div>
</div>

<div class="quick-sidebar">
	<a href="#" class="close-quick-sidebar"> <i class="flaticon-cross"></i>
	</a>


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





<script>
	$('#editor').summernote('code', '${board.board_content}');

	$('#editor').val("${board.board_content}");
	$('#editor').summernote({
		fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New' ],
		tabsize : 2,
		height : 300,
// 	    minHeight: 1000,      // 최소 높이값(null은 제한 없음)
// 	    maxHeight: null,      // 최대 높이값(null은 제한 없음)
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {

			var operForm = $("#operForm");

			var textareaVal = $("textarea[name=board_content]").text();

			console.log(textareaVal);

				$("button[data-oper='register']").on("click",function(e) {

					// 추가한거
					e.preventDefault();

					console.log("Submit clicked");

					var str = "";

					$(".uploadResult ul li").each(function(i, obj) {

						var jobj = $(obj);

						console.dir(jobj);

						str += "<input type='hidden' name='attachList["+ i+ "].fileName'value='"+ jobj.data("filename")+ "'>";
						str += "<input type='hidden' name='attachList["+ i+ "].uuid'value='"+ jobj.data("uuid")+ "'>";
						str += "<input type='hidden' name='attachList["+ i+ "].uploadPath'value='"+ jobj.data("path")+ "'>";
						str += "<input type='hidden' name='attachList["+ i+ "].fileType'value='"+ jobj.data("type")+ "'>";

						});

						operForm.append(str).attr("action","/qna/register").submit();
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

											$.ajax({
												url : '/qna/uploadAjaxAction',
												processData : false,
												contentType : false,
												data : formData,
												type : 'POST',
												success : function(result) {
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

							$(uploadResultArr).each(function(i, obj) {

								//image type

								if (obj.image) {
									var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
										str += "<li data-path='"+obj.uploadPath+"'";
			         					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			         					str +" ><div>";
										str += "<span> " + obj.fileName + "</span>";
										str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			         					str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
										str += "<img src='/qna/display?fileName=" + fileCallPath + "'>";
										str += "</div>";
										str + "</li>";
										} else {
											var fileCallPath = encodeURIComponent(obj.uploadPath +"/"+ obj.uuid+"_"+ obj.fileName);
											var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");

										str += "<li "
			        					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
										str += "<span> "+ obj.fileName+ "</span>";
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
								url : '/qna/deleteFile',
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

						/* $("button[data-oper='list']").on("click", function(e) {

							openForm.find("#board_id").remove();
							openForm.attr("action", "/qna/list")
							openForm.submit();
						}); */

					});
</script>





























</body>
</html>