<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8" />
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
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<script src="/resources/assets/js/validation.js"></script>
<script>
$(function() {
	var select = "";
	if(${userInfo.member_auth == "ROLE_ADMIN"}){
		select += "<option selected value='ROLE_ADMIN'>ROLE_ADMIN</option>";
		select += "<option value='ROLE_MEMBER'>ROLE_MEMBER</option>";
	}else {select += "<option value='ROLE_ADMIN'>ROLE_ADMIN</option>";
		select += "<option selected value='ROLE_MEMBER'>ROLE_MEMBER</option>";
	}
	$('#role').append(select);
})

function modify(){
	var selectOption = $("#role option:selected").val();
	var selectOptionName=$("#username").val();
	location.href = "/admin/update?user_auth="+selectOption+"&user_id=${userInfo.member_id}&user_name="+selectOptionName;
}
</script>


<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="/resources/assets/css/demo.css">



      <div class="main-panel full-height">
         <div class="container">
            <div class="panel-header">
               <div class="page-inner border-bottom pb-0 mb-3">
                  <div class="d-flex align-items-left flex-column">
                     <h2 class="pb-2 fw-bold">관리자 페이지</h2>
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

                        <form role="form" action="" method="post" action="" id="exampleValidation" novalidate="novalidate">
                           <div class="card-body">
                           
                           
                              <div class="form-group form-show-validation row">
                                 <label for="member_id"
                                       class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">아이디
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8">
                                    <input type="text" class="form-control" id="member_id"
                                       name="member_id" placeholder="" required="" readonly="readonly"  value="${userInfo.member_id }">
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
                                       <input id="username" type="text" class="form-control"
                                          placeholder="" aria-label="username"
                                          aria-describedby="username-addon" id="username"
                                          name="member_username" required=""  value="${userInfo.member_username }">
                                    </div>
                                 </div>
                              </div>
                              
                              
                              <div class="form-group form-show-validation row">
                                 <label for="email"
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">이메일
                                    <span class="required-label">*</span>
                                 </label>
                                 <div class="col-lg-4 col-md-9 col-sm-8" style="float: left:">
                                    <input type="email" class="form-control" id="email" readonly="readonly"
                                       placeholder="Enter Email" name="member_email" required="" value="${userInfo.member_email }">
                                       <div class="check_font" id="email_check"></div>
                                 </div>
                              <div class="separator-solid"></div>
                              </div>
                              <div class="form-group form-show-validation row">
                                 <label for=""
                                    class="col-lg-3 col-md-3 col-sm-4 mt-sm-2 text-right">등급
                                    <span class="required-label">*</span>
                                 </label>
                                  <select id="role" style="width: 200px; margin-left: 15px;" id="sel1" name="sel1" class="form-control form-control-sm"  onchange="selectedSido()">
                                  			
								  </select> 
                              <div class="separator-solid"></div>
                              </div>
                             
                           </div>
                           
                           <div class="card-action">                                       
                              <div class="row">
                                 <div class="col-md-12">
									<a href="/admin/memberList" class="btn btn-primary ml-2" style="float: right; margin-left: 15px;"> 목록 </a>
                                    <input data-oper='modifyMember' class="btn btn-success" type="button" onclick="modify()" value="수정" style="float: right; margin-left: 15px;">
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

   <!-- jQuery Scrollbar -->
   <script
      src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

   <!-- Moment JS -->
   <script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

   <!-- Chart JS -->
   <script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

   <!-- jQuery Sparkline -->
   <script
      src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

   <!-- Chart Circle -->
   <script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

   <!-- Datatables -->
   <script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

   <!-- Bootstrap Notify -->
   <script
      src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

   <!-- Bootstrap Toggle -->
   <script
      src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

   <!-- jQuery Vector Maps -->
   <script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
   <script
      src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

   <!-- Google Maps Plugin -->
   <script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

   <!-- Dropzone -->
   <script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

   <!-- Fullcalendar -->
   <script
      src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

   <!-- DateTimePicker -->
   <script
      src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

   <!-- Bootstrap Tagsinput -->
   <script
      src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

   <!-- Bootstrap Wizard -->
   <script
      src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

   <!-- jQuery Validation -->
   <script
      src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

   <!-- Summernote -->
   <script
      src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

   <!-- Select2 -->
   <script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>                                                            

   <!-- Sweet Alert -->
   <script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

   <!-- Owl Carousel -->
   <script
      src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

   <!-- Magnific Popup -->
   <script
      src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

   <!-- Atlantis JS -->
   <script src="/resources/assets/js/atlantis.min.js"></script>


   <script>
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
   
   
 
//   $(document).ready(function() {
// 		var formObj = $("#modifyMember");

//     $('button').on("click", function(e) {

//        e.preventDefault();

// 	   var operation = $(this).data("oper");
		

//        console.log(operation);

//        if (operation === 'modifyMember') {
//           formObj.attr("action", "/member/modifyMember");
//        } else if (operation === 'main') {
//           // move to list
//            self.location = "caa/mainPage/main";
//           return;
//        }
//        formObj.submit();
//     }); 
//  });
    </script>
</html>