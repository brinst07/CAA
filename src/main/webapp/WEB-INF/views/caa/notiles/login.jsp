<%--
  Created by IntelliJ IDEA.
  User: park
  Date: 2020-09-05
  Time: 오후 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport">
    <link rel="icon" href="/resources/assets/img/icon.ico" type="image/x-icon">

    <!-- Fonts and icons -->
    <script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
    <script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
    <!-- jQuery Validation -->
    <script src="/resources/assets/js/validation.js"></script>
    <!-- jQuery Validation -->
    <script src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:300,400,700,900" media="all">
    <link rel="stylesheet" href="/resources/assets/css/fonts.min.css" media="all">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        WebFont.load({
            google: {"families": ["Lato:300,400,700,900"]},
            custom: {
                "families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"],
                urls: ['/resources/assets/css/fonts.min.css']
            },
            active: function () {
                sessionStorage.fonts = true;
            }
        });

        function emailCheck() {
            var client_email = $('#member_email').val();
            var passwordKey = null;
            ``
            if (client_email.validationMAIL()) {

                $.ajax({
                    type: "POST",
                    url: "/member/rest/checkmail",
                    data: 'client_email=' + client_email,
// 				data : client_email,
                    dataType: "text",
                    //contentType : "application/json; charset=utf-8",
                    success: function (result) {
                        $('#hiddenpassword').val(result);
                        passwordKey = result;
                        $('#hiddenpassword').val(passwordKey);
                        swal("발송되었습니다", "이메일을 확인해주세요", "success");
                    }, error: function (e) {
                        alert('street404 we can send email please check your email')
                    }
                });


            } else {
                alert("이메일을 확인해주세요.")
                return false;
            }
        }
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/assets/css/atlantis.css">
    <script type="text/javascript">
        $(function () {
            $('#login').on('click', function () {
                var id = $('#username').val();
                var password = $('#password').val();
                var member = new Object();
                member.member_id = id;
                member.member_password = password;
                var memberJson = JSON.stringify(member);
                $.ajax({
                    url: '/member/login',
                    data: memberJson,
                    type: 'POST',
                    contentType: "application/json",
                    traditional: true,
                    success: function (data) {
                        if (data != "") {
                            location.href = "caa/main";
                        } else {
                            swal("error!", "회원정보를 확인해주세요!", "error");
                        }
                    }, error: function (xhr, status) {
                        console.log(xhr, status);
                    }

                });
            });

            // 아이디 유효성 검사(1 = 중복 / 0 != 중복)
            $("#member_id").keyup(function () {
                // id = "id_reg" / name = "userId"
                var member_id = $('#member_id').val();

                $.ajax({
                    url: '/member/rest/idCheck?member_id=' + member_id,
                    type: 'get',
                    success: function (data) {
                        var over = data.over;
                        console.log(over);
                        if (over == 1) {
                            // 1 : 아이디가 중복되는 문구
                            $("#id_check").text("사용중인 아이디입니다 ");
                            $("#id_check").css("color", "red");
                            $("#id_check").css("font-size", "11px");
                            $("#reg_submit").attr("disabled", true);
                        } else {

                            if (member_id == 0) {
                                // 0 : 아이디 길이 / 문자열 검사
                                $("#id_check").text("");
                                $("#reg_submit").attr("disabled", false);

                            } else if (member_id == "") {

                                $('#id_check').text('아이디를 입력해주세요 )');
                                $('#id_check').css('color', 'red');
                                $("#id_check").css("font-size", "11px");
                                $("#reg_submit").attr("disabled", true);

                            } else if (!member_id.validationID()) {

                                $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
                                $('#id_check').css('color', 'red');
                                $("#id_check").css("font-size", "11px");
                                $("#reg_submit").attr("disabled", true);
                            } else if (member_id.validationID()) {

                                $('#id_check').text("사용 가능한 아이디 입니다.");
                                $('#id_check').css('color', 'blue');
                                $("#id_check").css("font-size", "11px");
                                $("#reg_submit").attr("disabled", true);
                            }
                        }

                    }
                    , error: function () {
                        console.log("실패");
                    }
                });


            });

            // 이메일 유효성 검사(1 = 중복 / 0 != 중복)
            $("#email").keyup(function () {
                var member_email = $('#member_email').val();

                $.ajax({
                    url: '/member/rest/checkmail?member_email=' + member_email,
                    type: 'get',
                    success: function (data) {
                        var eover = data.eover;
                        console.log(eover);
                        if (eover == 1) {
                            // 1 : 아이디가 중복되는 문구
                            $("#email_check").text("사용중인 이메일입니다 ");
                            $("#email_check").css("color", "red");
                            $("#email_check").css("font-size", "11px");
                            $("#email_check").attr("disabled", true);
                        } else {

                            if (member_email == 0) {
                                // 0 : 아이디 길이 / 문자열 검사
                                $("#email_check").text("");
                                $("#reg_submit").attr("disabled", false);

                            } else if (member_email == "") {

                                $('#email_check').text('이메일을 입력해주세요 )');
                                $('#email_check').css('color', 'red');
                                $("#email_check").css("font-size", "11px");
                                $("#reg_submit").attr("disabled", true);

                            } else if (member_email.validationMAIL()) {

                                $('#email_check').text("사용 가능한 이메일입니다.");
                                $('#email_check').css('color', 'blue');
                                $("#email_check").css("font-size", "11px");
                                $("#reg_submit").attr("disabled", true);
                            } else if (!member_email.validationMAIL()) {

                                $('#email_check').text("");
                                $('#email_check').css('color', 'red');
                                $("#email_check").css("font-size", "11px");
                                $("#reg_submit").attr("disabled", true);
                            }

                        }

                    }
                    , error: function () {
                        console.log("실패");
                    }
                });


            });

            $("#exampleValidation").validate(
                {
                    validClass: "success",
                    rules: {
                        gender: {
                            required: true
                        },
                        confirmpassword: {
                            equalTo: "#member_password"
                        },
                        confirmemailword: {
                            equalTo: "#hiddenpassword"
                        },
                        birth: {
                            date: true
                        },
                        uploadImg: {
                            required: true,
                        },
                    },
                    highlight: function (element) {
                        $(element).closest('.form-group').removeClass(
                            'has-success').addClass('has-error');
                    },
                    success: function (element) {
                        $(element).closest('.form-group').removeClass(
                            'has-error').addClass('has-success');
                    },
                });

            $('#login').on('click', function () {
                var member = new Object();
                member.member_id = $('#username').val();
                member.member_password = $('#password').val();

                $.ajax({
                    url: '/member/login',
                    data: member,
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        console.log(data);
                    }, fail: function (xhr, status) {
                        console.log(xhr, status);
                    }
                });
            });
        });



        function captchaCheck() {

            let key = $('input[name=Nkey]').val();
            let inputValue = $('#captchaImageInput').val();


            $.ajax({
                type: "get",
                url: "/member/rest/captchaCompare/" + key + "/" + inputValue,
                dataType: "json",
                success: function (data) {
                    console.log(data);


                    if (data.check == "false") {
                        // 틀렷을 때
                        // 안에 있는 값 지우기
                        $('#capChaImage').empty();
                        var captchaImg = '<img alt="캡차 이미지 입니다" src="' + data.apiURL + '">';
                        captchaImg += '<input type="hidden" name="Nkey" value="' + data.Nkey + '">';
                        $("#reg_submit").attr("disabled", false);
                        $('#capChaImage').append(captchaImg);
                        swal("캡차 실패", "캡차에 실패하였습니다.", "error");
                    }
                    if (data.check == "true") {
                        $("#reg_submit").attr("disabled", true);
                        swal("캡차 성공", "캡차에 성공하였습니다.", "success");
                    }


                }, fail: function (xhr, status) {
                    console.log(xhr, status);
                }
            });
        }
    </script>

</head>
<body class="login">
<div class="wrapper wrapper-login wrapper-login-full p-0">
    <div class="login-aside w-50 d-flex flex-column align-items-center justify-content-center text-center bg-primary-gradient">
        <h1 class="title fw-bold text-white mb-3">Join Our Community</h1>
        <p class="subtitle text-white op-7">CAA 상권분석 서비스에 회원가입 해주세요</p>
    </div>
    <div class="login-aside w-50 d-flex align-items-center justify-content-center bg-white">
        <div class="container container-login container-transparent animated fadeIn" style="display: block;">
            <h3 class="text-center">LOGIN</h3>

            <div class="login-form">

                <div class="form-group">
                    <label for="member_id" class="placeholder"><b>ID</b></label>
                       <a href="/member/findID" class="link float-right">아이디찾기</a>
                    <input id="username" name="member_id" type="text" class="form-control" required="">
                </div>
                <div class="form-group">
                    <label for="password" class="placeholder"><b>Password</b></label>
                    <a href="/member/findPW" class="link float-right">비밀번호찾기</a>
                    <div class="position-relative">
                        <input id="password" name="member_password" type="password" class="form-control" required="">
                        <div class="show-password">
                            <i class="icon-eye"></i>
                        </div>
                    </div>
                </div>
                <div class="form-group form-action-d-flex mb-3">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="rememberme">
                        <label class="custom-control-label m-0" for="rememberme">Remember Me</label>
                    </div>
                    <button class="btn btn-secondary col-md-5 float-right mt-3 mt-sm-0 fw-bold" id="login">
                        Sign In
                    </button>
                </div>
                <div class="login-account">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=4c12c1d51d4e0fe19ee7a9427689835a&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/kakao_login_medium_wide.png">
                    </a>
                </div>
                <div class="login-account">
                    <span class="msg">CAA에 가입하시겠습니까?</span>
                    <a href="#" id="show-signup" class="link">Sign Up</a>
                </div>
            </div>

        </div>
        <div class="container container-signup container-transparent animated fadeIn" style="display: none;">
            <h3 class="text-center">Sign Up</h3>
            <form role="form" action="/member/insertMember" method="post" id="exampleValidation"
                  novalidate="novalidate">
                <div class="login-form">
                    <div class="form-group form-show-validation">
                        <label for="member_id" class="placeholder">아이디
                            <span class="required-label">*</span>
                        </label>
                        <div class="position-relative">
                            <input type="text" class="form-control" id="member_id" name="member_id" placeholder="ID">
                            <div class="check_font" id="id_check"></div>
                        </div>
                    </div>
                    <div class="form-group form-show-validation">
                        <label for="member_username" class="placeholder"><b>이름</b></label>
                        <input id="member_username" name="member_username" type="text" class="form-control" required="">
                    </div>
                    <div class="form-group form-show-validation">
                        <label for="member_email" class="placeholder"><b>Email</b></label>
                        <input id="member_email" name="member_email" type="email" class="form-control" required="">
                        <button class="btn btn-primary btn-round btn-lg"
                                type="button" onclick="emailCheck()" style="float: right;">인증번호
                        </button>
                    </div>
                    <div class="form-group form-show-validation">
                        <label for="confirmpassword"
                               class="placeholder">인증번호 확인
                        </label>
                        <div class="position-relative">
                            <input type="hidden" class="form-control" id="hiddenpassword"
                                   name="member_emailword" value="">
                            <input type="password" class="form-control" id="confirmemailword"
                                   name="confirmemailword" placeholder="Enter PasswordKey"
                                   required="">
                        </div>
                    </div>
                    <div class="form-group form-show-validation">
                        <label for="member_password" class="placeholder"><b>비밀번호</b></label>
                        <div class="position-relative">
                            <input id="member_password" name="member_password" type="password" class="form-control"
                                   placeholder="비밀번호를 입력해주세요" required="">
                            <div class="show-password">
                                <i class="icon-eye"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-show-validation">
                        <label for="confirmpassword" class="placeholder"><b>비밀번호 확인</b></label>
                        <div class="position-relative">
                            <input id="confirmpassword" name="confirmpassword" type="password" class="form-control"
                                   placeholder="비밀번호를 재입력해주세요" required="">
                            <div class="show-password">
                                <i class="icon-eye"></i>
                            </div>
                        </div>
                    </div>
                    <div class="form-group form-show-validation">
                        <label for="confirmpassword" class="placeholder"><b>캡차</b></label>
                        <div id="capChaImage">
                            <img src="${capCha.apiURL}">
                            <input type="hidden" name="Nkey" value="${capCha.Nkey}">
                        </div>
                        <div class="position-relative" style="padding-top: 10px">
                            <input id="captchaImageInput" name="captchaImageValue" class="form-control"
                                   placeholder="사진에 보이는 문자를 입력해주세요" required="">
                            <button class="btn btn-primary btn-round btn-lg"
                                    type="button" onclick="captchaCheck()" style="float: right;">확인
                            </button>
                        </div>
                    </div>
                    <div class="form-group form-show-validation" style="padding: 30px">
                    </div>
                    <div class="row form-action">
                        <div class="col-md-6">
                            <a href="#" id="show-signin" class="btn btn-danger btn-link w-100 fw-bold">Cancel</a>
                        </div>
                        <div class="col-md-6">
                            <input class="btn btn-success" type="submit" value="Sign Up">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/resources/assets/js/core/popper.min.js"></script>
<script src="/resources/assets/js/core/bootstrap.min.js"></script>
<script src="/resources/assets/js/atlantis.min.js"></script>



</body>
</html>
