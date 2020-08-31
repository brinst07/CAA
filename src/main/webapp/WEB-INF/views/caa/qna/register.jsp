<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
	type="image/x-icon" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
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
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">
<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="/resources/assets/css/demo.css">
</head>
<body>
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
										<label for="to" class="col-form-label col-md-1">제목 </label>
										<div class="col-md-11">
											<input type="text" class="form-control" id="title"
												name="board_title" value="">
										</div>
									</div>
									<div class="form-group row">
										<!-- 										<label for="cc" class="col-form-label col-md-1">작성자 </label> -->
										<!-- 										<div class="col-md-11"> -->
										<!-- 											<input type="text" class="form-control" id="cc" name="member_id" value="" readonly="readonly"> -->
										<!-- 										</div> -->
										<br> <br>
										<div class="card-body">

											<div class="form-group row">
												<label for="to" class="col-form-label col-md-1">내용 </label>







												<textarea id="editor" name="board_content"></textarea>




												<!-- 												<div class="col-md-11"> -->
												<!-- 													<textarea class="form-control" rows="3" name='board_content'> </textarea> -->
												<!-- 												</div> -->
											</div>


											<!-- --------------- -->
											<form role="form" actions="/qna/register" method="post">


												<input type="hidden" id="board_id" name="board_id"
													value='10'> <input type="hidden" id="member_id"
													name="member_id" value='admin'> <input
													type="hidden" id="board_datetime" name="board_datetime"
													value='2020/08/23'> <input type="hidden"
													id="board_status" name="board_status" value='y'> <input
													type="hidden" id="board_category_id"
													name="board_category_id" value='1'> <input
													type="hidden" id="board_temp_save" name="board_temp_save"
													value='y'> <input type="hidden" id="board_hit"
													name="board_hit" value='10'>
											</form>



											<div class="row">
												<div class="col-lg-12">
													<div class="panel panel-default">

														<div class="panel-heading">File Attach</div>
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







											<form action="/qna/uploadFormAction" enctype="multipart/form"
												method="post" enctype=class="dropzone">

												<div class="dz-message" data-dz-message>

													<label for="cc" class="col-form-label col-md-1">첨부파일
													</label>
													<h4 class="message">첨부파일</h4>
												</div>
												<div class="fallback">
													<input name="file" type="file" multiple />
												</div>
											</form>
										</div>
									</div>


									<div class="email-editor">
										<div id="editor"></div>
										<div class="email-action">
											<button data-oper='register' type="button"
												class="btn btn-primary">확인</button>



											<!-- <button class="btn btn-black">삭제</button> -->
											<button type="reset" class="btn btn-black"
												onclick="location.href='/qna/list'">취소</button>

											<%-- <form id='operform' action="/qna/modify" method="get">
                           	<input type='hidden' id='board_id' name='board_id' value='<c:out value="${board.board_id }"/>'>
                           </form> --%>

										</div>
									</div>






								</form>
							</div>





						</div>
					</div>
				</div>
			</div>
			<!-- <footer class="footer">
            <div class="container-fluid">
               <nav class="pull-left">
                  <ul class="nav">
                     <li class="nav-item">
                        <a class="nav-link" href="http://www.themekita.com">
                           ThemeKita
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">
                           Help
                        </a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">
                           Licenses
                        </a>
                     </li>
                  </ul>
               </nav>
                           
            </div>
         </footer>
      </div> -->
			<div class="quick-sidebar">
				<a href="#" class="close-quick-sidebar"> <i
					class="flaticon-cross"></i>
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
		</div>





	</div>
	<!--   Core JS Files   -->
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
	<script
		src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>
	<!-- Atlantis JS -->
	<script src="/resources/assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="/resources/assets/js/setting-demo.js"></script>
	<script>
		$('#editor').summernote('code', '${board.board_content}');
	
		$('#editor').val("${board.board_content}");
		$('#editor').summernote(
				{
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New' ],
					tabsize : 2,
					height : 300,
					callbacks: {
						onImageUpload: function(files, editor, welEditable) {
							for(var i = files.length -1; i >= 0; i--){
								sendFile(files[i], this);
							}
						}
					}
				});
	</script>

<!-- 	<script> -->
// 		$(document).ready(
// 				function() {
// 							$('#basic-datatables').DataTable({});

// 							$('#multi-filter-select').DataTable({"pageLength" : 5, 
// 								initComplete : function() {
// 													this
// 															.api()
// 															.columns()
// 															.every(
// 																	function() {
// 																		var column = this;
// 																		var select = $(
// 																				'<select class="form-control"><option value=""></option></select>')
// 																				.appendTo(
// 																						$(
// 																								column
// 																										.footer())
// 																								.empty())
// 																				.on(
// 																						'change',
// 																						function() {
// 																							var val = $.fn.dataTable.util
// 																									.escapeRegex($(
// 																											this)
// 																											.val());

// 																							column
// 																									.search(
// 																											val ? '^'
// 																													+ val
// 																													+ '$'
// 																													: '',
// 																											true,
// 																											false)
// 																									.draw();
// 																						});

// 																		column
// 																				.data()
// 																				.unique()
// 																				.sort()
// 																				.each(
// 																						function(
// 																								d,
// 																								j) {
// 																							select
// 																									.append('<option value="'+d+'">'
// 																											+ d
// 																											+ '</option>')
// 																						});
// 																	});
// 												}
// 											});

// 						});
<!-- 	</script> -->

	<script type="text/javascript">
		$(document).ready(function() {

			var operForm = $("#operForm");
			
			var textareaVal = $("textarea[name=board_content]").text();

			console.log(textareaVal);

			$("button[data-oper='register']").on("click", function(e) {
				
				// 추가한거
				e.preventDefault();
				
				
				
				console.log("Submit clicked");
					
				operForm.attr("action", "/qna/register").submit();
			});
			
			
			
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			  var maxSize = 5242880; //5MB
			  
			  function checkExtension(fileName, fileSize){
			    
			    if(fileSize >= maxSize){
			      alert("파일 사이즈 초과");
			      return false;
			    }
			    
			    if(regex.test(fileName)){
			      alert("해당 종류의 파일은 업로드할 수 없습니다.");
			      return false;
			    }
			    return true;
			  }
			  
			  $("input[type='file']").change(function(e){

			    var formData = new FormData();
			    
			    var inputFile = $("input[name='uploadFile']");
			    
			    var files = inputFile[0].files;
			    
			    for(var i = 0; i < files.length; i++){

			      if(!checkExtension(files[i].name, files[i].size) ){
			        return false;
			      }
			      formData.append("uploadFile", files[i]);
			      
			    }
			    
			    $.ajax({
			      url: '/qna/uploadAjaxAction',
			      processData: false, 
			      contentType: false,
			      data:formData,
			      type: 'POST',
			        success: function(result){
			          console.log(result); 
			        showUploadResult(result); //업로드 결과 처리 함수 
			      }
			    }); //$.ajax
			    
			  });  
			  
			  function showUploadResult(uploadResultArr){
			       
			    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
			    
			    var uploadUL = $(".uploadResult ul");
			    
			    var str ="";
			    
			    $(uploadResultArr).each(function(i, obj){
			    
			        /* //image type
			        if(obj.image){
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			          str += "<li><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/display?fileName="+fileCallPath+"'>";
			          str += "</div>";
			          str +"</li>";
			        }else{
			          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
			            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			              
			          str += "<li><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "<img src='/resources/img/attach.png'></a>";
			          str += "</div>";
			          str +"</li>";
			        } */
			      //image type
			      
			      if(obj.image){
			         var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.file_id +"_"+obj.fileName);
			         str += "<li data-path='"+obj.uploadPath+"'";
			         str +=" data-file_id='"+obj.file_id+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			         str +" ><div>";
			         str += "<span> "+ obj.fileName+"</span>";
			         str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			         str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			         str += "<img src='/display?fileName="+fileCallPath+"'>";
			         str += "</div>";
			         str +"</li>";
			      }else{
			         var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.file_id +"_"+obj.fileName);               
			          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			            
			         str += "<li "
			         str += "data-path='"+obj.uploadPath+"' data-file_id='"+obj.file_id+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			         str += "<span> "+ obj.fileName+"</span>";
			         str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			         str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			         str += "<img src='/resources/img/attach.png'></a>";
			         str += "</div>";
			         str +"</li>";
			      }

			    });
			    
			    uploadUL.append(str);
			  }
			
			

			/* $("button[data-oper='list']").on("click", function(e) {

				openForm.find("#board_id").remove();
				openForm.attr("action", "/qna/list")
				openForm.submit();
			}); */

		});
		
		
		
	</script>


	<!-- 	<script type="text/javascript">
	
	$(document).ready(function(e){

    
  var formObj = $("#operForm");
  
  $("button[data-oper='register']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
  });


    
    console.log(str);
    
    formObj.append(str).submit();
    
  }); -->

	</script>




























</body>
</html>