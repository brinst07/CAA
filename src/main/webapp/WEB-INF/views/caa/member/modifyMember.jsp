<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<title>회원정보 수정</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
   name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
   type="image/x-icon" />
<meta charset="UTF-8" />
<style type="text/css">        
   
        #registerForm { width: 600px; }
        #registerForm label.error { margin-left: 10px; color:red; }
        
    </style>


<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">




      <div class="main-panel full-height">
         <div class="container">
            <div class="panel-header">
               <div class="page-inner border-bottom pb-0 mb-3">
                  <div class="d-flex align-items-left flex-column">
                     <h2 class="pb-2 fw-bold">회원정보 수정</h2>
                     <div class="nav-scroller d-flex">
                        <div
                           class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center">
                        </div>

                     </div>
                  </div>
               </div>
            </div>
            <div class="page-inner">
               <div class="page-header">
                  <h4 class="page-title">회원정보 수정</h4>
                  <ul class="breadcrumbs">
                     <li class="nav-home"><a href="#"> <i
                           class="flaticon-home"></i>
                     </a></li>
                     <li class="separator"><i class="flaticon-right-arrow"></i></li>
                     <li class="nav-item"><a href="#">마이페이지</a></li>
                     <li class="separator"><i class="flaticon-right-arrow"></i></li>
                     <li class="nav-item"><a href="#">회원정보 수정</a></li>
                  </ul>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <div class="card">

                        <form role="form" action="/member/updateMember" method="post" action="" id="exampleValidation" novalidate="novalidate">
                           <div class="card-body">
                           
                           
                              <div class="form-group form-show-validation row">
                                 <label for="member_id"
                                       class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">아이디
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <input type="text" class="form-control" id="member_id"
                                       name="member_id" placeholder="" required="" readonly="readonly"  value="${memberInfo.member_id }">
                                       <div class="check_font" id="id_check"></div>
                                 </div>

                          
                              </div>
                              
                              
                              <div class="form-group form-show-validation row">
                                 <label for="username"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이름
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <div class="input-group">
                                       <div class="input-group-prepend">
                                          <span class="input-group-text" id="username-addon">@</span>
                                       </div>
                                       <input type="text" class="form-control"
                                          placeholder="" aria-label="username"
                                          aria-describedby="username-addon" id="username"
                                          name="member_username" required="" readonly="readonly" value="${memberInfo.member_username }">
                                    </div>
                                 </div>
                              </div>
                              
                              
                              <div class="form-group form-show-validation row">
                                 <label for="email"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이메일
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8" style="float: left:">
                                    <input type="email" class="form-control" id="email"
                                       placeholder="Enter Email" name="member_email" required="" value="${memberInfo.member_email }">
                                       <div class="check_font" id="email_check"></div>
                                 </div>
                              <div class="separator-solid"></div>
                              </div>
                              <div class="form-group form-show-validation row">
                                 <label for="password"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">비밀번호
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <input type="password" class="form-control" id="password"
                                       name="member_password" placeholder="Enter Password"
                                       required="">
                                 </div>
                              </div>
                              
                              
                              <div class="form-group form-show-validation row">
                                 <label for="confirmpassword"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">비밀번호 확인 <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <input type="password" class="form-control"
                                       id="confirmpassword" name="confirmpassword"
                                       placeholder="Enter Password" required="">
                                 </div>
                              </div>  
                           </div>
                           
                           <div class="card-action">                                       
                              <div class="row">
                                 <div class="col-md-12">
									<a href="../caa/main" class="btn btn-primary ml-2" style="float: right; margin-left: 15px;"> 목록 </a>
                                    <input data-oper='modifyMember' class="btn btn-success" type="submit" value="확인" style="float: right; margin-left: 15px;">
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>


  
   <script>
      $("#exampleValidation").validate(
            {
               validClass : "success",
               rules : {
                  gender : {
                     required : true
                  },
                  confirmpassword : {
                     equalTo : "#password"
                  },
                  confirmemailword : {
                     equalTo : "#hiddenpassword"
                  },
                  birth : {
                     date : true
                  },
                  uploadImg : {
                     required : true,
                  },
               },
               highlight : function(element) {
                  $(element).closest('.form-group').removeClass(
                        'has-success').addClass('has-error');
               },
               success : function(element) {
                  $(element).closest('.form-group').removeClass(
                        'has-error').addClass('has-success');
               },
            });
   </script>
   
   <script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
   $("#member_id").keyup(function() {
      // id = "id_reg" / name = "userId"
      var member_id = $('#member_id').val();
          
      $.ajax({
         url : '/member/rest/idCheck?member_id='+ member_id,
         type : 'get',
         success : function(data) {
            var over = data.over;
            console.log(over);
            if (over == 1) {
                  // 1 : 아이디가 중복되는 문구
                  $("#id_check").text("사용중인 아이디입니다 ");
                  $("#id_check").css("color", "red");
                  $("#id_check").css("font-size", "11px");
                  $("#reg_submit").attr("disabled", true);
               } else {
                  
                  if(member_id == 0){
                     // 0 : 아이디 길이 / 문자열 검사
                     $("#id_check").text("");
                     $("#reg_submit").attr("disabled", false);
            
                  } else if(member_id == ""){
                     
                     $('#id_check').text('아이디를 입력해주세요 )');
                     $('#id_check').css('color', 'red');
                     $("#id_check").css("font-size", "11px");
                     $("#reg_submit").attr("disabled", true);            
                     
                  }
                  
                  else if(!member_id.validationID()){
                     
                     $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
                     $('#id_check').css('color', 'red');
                     $("#id_check").css("font-size", "11px");
                     $("#reg_submit").attr("disabled", true);
                  }
                  else if(member_id.validationID()){
                     
                     $('#id_check').text("사용 가능한 아이디 입니다.");
                     $('#id_check').css('color', 'blue');
                     $("#id_check").css("font-size", "11px");
                     $("#reg_submit").attr("disabled", true);
                  }
               }
            
            }
             ,error : function(){
                  console.log("실패");
            }
         });
         
         
      });
</script>


<script>

</script>

  <script type="text/javascript">
   $(document).ready(function() {

         var operForm = $("#exampleValidation");


            $("button[data-oper=modifyMember]").on("click",function(e) {

               // 추가한거
               e.preventDefault();

               console.log("Submit clicked");

               var str = "";

               $(".uploadResult ul li").each(function(i, obj) {

                  var jobj = $(obj);

                  console.dir("testtest"+jobj);

                  str += "<input type='hidden' name='attachList["+ i+ "].member_id'value='"+ jobj.data("member_id")+ "'>";
                  str += "<input type='hidden' name='attachList["+ i+ "].member_username'value='"+ jobj.data("member_username")+ "'>";
                  str += "<input type='hidden' name='attachList["+ i+ "].member_email'value='"+ jobj.data("member_email")+ "'>";
                  str += "<input type='hidden' name='attachList["+ i+ "].member_password'value='"+ jobj.data("member_password")+ "'>";

                  });

                  operForm.append(str).attr("action","/member/modifyMember").submit();
                  });
               });
 </script> 
 <script type="text/javascript">
   
   
 
  $(document).ready(function() {
		var formObj = $("#modifyMember");

    $('button').on("click", function(e) {

       e.preventDefault();

	   var operation = $(this).data("oper");
		

       console.log(operation);

       if (operation === 'modifyMember') {
          formObj.attr("action", "/member/modifyMember");
       } else if (operation === 'main') {
          // move to list
           self.location = "caa/mainPage/main";
          return;
       }
       formObj.submit();
    }); 
 });
     </script> 
</html>