<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style type="text/css">
#logo {
	width: 250px;
	padding-bottom: 20px;
}

.findid{
	padding-left: 30%;
}
</style>
<script>
	function emailSend() {
			var name = document.getElementById("username").value;
			var clientemail = document.getElementById("email").value;
			
			console.log('입력 이메일' + clientemail );
			
			$.ajax({
				type:"GET",
				url:"/member/rest/emailSend/"+clientemail+"/"+name,
				contentType : "application/json; charset=utf-8",
				success : function(data){
                    swal("발송 성공", clientemail+"이메일을 확인해주세요", "success");
				}, error : function(e){
                    swal("발송 실패", "이메일 혹은 이름을 확인해주세요", "error");

				}
			});
			
		};
		
	

</script>
		<div class="main-panel full-height">
			<div class="container">
				<div class="panel-header">
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">
							<h2 class="pb-2 fw-bold">회원정보 찾기</h2>
							<div class="nav-scroller d-flex">
								<div
									class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
									<a class="nav-link active" href="/member/findID">아이디 찾기</a>
									 <a class="nav-link" href="/member/findPW">비밀번호 찾기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="page-inner">
					<!-- 이름 /이메일 /아이디 입력란 -->
				
						<div class="form-group" align="center">
							<!-- thinpeopleLogo -->
							<div>
								<img id="logo" alt="logo"
									src="/resources/assets/img/thinkpeopleLogo.png">
							</div>
							<br>
							<br>
								  <div class="form-group form-show-validation row">
                                 <label  class="findid" for="username"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이름
                                    <span class="required-label">*&nbsp&nbsp&nbsp</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <div class="input-group">
                                       <div class="input-group-prepend">
                                          <span class="input-group-text" id="username-addon">@</span>
                                       </div>
                                       <input type="text" class="form-control"
                                          placeholder="username" aria-label="username"
                                          aria-describedby="username-addon" id="username"
                                          name="member_username" required="">
                                    </div>
                                 </div>
                              </div>
						</div>

							<br>
						  <div class="form-group form-show-validation row ">
                                 <label class="findid" for="email"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right findid">이메일
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8" style="float: left:">
                                    <input type="email" class="form-control" id="email"
                                       placeholder="Enter Email" name="member_email" required="">
                                       <div class="check_font" id="email_check"></div>
                                 </div>
                              </div>
						<div></div>
						<br>
						<br>
						<!-- 버튼 -->
						<div class="card-action" align="center">
							<button id="btnConfirm" type="button" class="btn btn-primary" onclick="emailSend()">찾기</button>
							<button type="reset" class="btn btn-black">취소</button>
							<div>ThinkPeople은 회원님의 개인정보를 보호합니다.</div>
						</div>
				</div>
			</div>
		</div>
