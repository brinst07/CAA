<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Core JS Files -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/assets/js/core/popper.min.js"></script>
<script src="/resources/assets/js/core/bootstrap.min.js"></script>
<script src="/resources/assets/js/jquery.xml2json.js"></script>

<!-- jQuery UI -->
<script src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<script src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

<!-- Moment JS -->
<script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

<!-- Chart JS -->
<script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

<!-- jQuery Sparkline -->
<script src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

<!-- Chart Circle -->
<script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

<!-- Datatables -->
<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

<!-- Bootstrap Notify -->
<script src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- Bootstrap Toggle -->
<script src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
<script src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

<!-- Google Maps Plugin -->
<script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

<!-- Dropzone -->
<script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

<!-- Fullcalendar -->
<script src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

<!-- DateTimePicker -->
<script src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

<!-- Bootstrap Tagsinput -->
<script src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

<!-- Bootstrap Wizard -->
<script src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

<!-- jQuery Validation -->
<script src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

<!-- Summernote -->
<script src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

<!-- Select2 -->
<script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

<!-- Sweet Alert -->
<script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Owl Carousel -->
<script src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

<!-- Magnific Popup -->
<script src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Atlantis JS -->
<script src="/resources/assets/js/atlantis.min.js"></script>

<!-- -->
<%--<script src="/resources/assets/js/core/jquery.ajax-cross-origin.min.js"></script>--%>

<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">
<script src="/resources/assets/js/jquery.oLoader.js"></script>
<script>
$(function(){
	if(${member.member_auth == "ROLE_ADMIN"}){
		var div = "";
		div += '<a href="/admin/memberList" class="dropdown-item" id="memberController">회원관리</a>';
		$('#hidden').append(div);
	}
})
    WebFont.load({
        google: {
            "families": ["Lato:300,400,700,900"]
        },
        custom: {
            "families": ["Flaticon", "Font Awesome 5 Solid",
                "Font Awesome 5 Regular", "Font Awesome 5 Brands",
                "simple-line-icons"],
            urls: ['/resources/assets/css/fonts.min.css']
        },
        active: function () {
            sessionStorage.fonts = true;
        }
    });

    $(function () {
        $('#logout').on('click', function () {
            $.ajax({
                url: '/member/logout',
                success: function (data) {
                    location.href = "/caa/main";
                }, fail: function (xhr, status) {
                    console.log(xhr, status);
                }


            });
        });
        $(document).ajaxStart(function(){
            $('body').oLoader({
                wholeWindow: true, //makes the loader fit the window size
                lockOverflow: true, //disable scrollbar on body
                backgroundColor: '#000',
                fadeInTime: 1000,
                fadeLevel: 0.4,
                image: '/resources/assets/img/Spin-1s-51px.gif'
            });
        }).ajaxStop(function(){
            $('body').oLoader('hide');
        });

    });
</script>
<div id="loading-custom-overlay"></div>
<div class="wrapper fullheight-side sidebar_minimize">
    <!-- Logo Header -->
    <div class="logo-header position-fixed" data-background-color="blue">


        <button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse"
                data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
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
    <nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg">

        <div class="container-fluid">
            <!-- 요기다가 로고를 넣으면 될듯 -->
            <div class="collapse" id="search-nav">
                <a href="/caa/main"><img alt=".." src="/resources/assets/img/caa.png"
                                         style="width: 100px; height: auto"></a>
            </div>
            <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                <c:if test="${member ne null}">
                    <c:out value="${member.member_username}"></c:out>

                    <li class="nav-item dropdown hidden-caret">
                        <a class="dropdown-toggle profile-pic" data-toggle="dropdown" aria-expanded="false">
                            <div class="avatar-sm">
                                <c:if test="${member.member_thumnail ne null}">
                                    <img src="<c:out value="${member.member_thumnail}"/>" alt="..."
                                         class="avatar-img rounded-circle">
                                </c:if>
                                <c:if test="${member.member_thumnail eq null}">
                                    <img src="/resources/assets/img/user.png" class="avatar-img rounded-circle">
                                </c:if>
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-user animated fadeIn">
                            <div class="dropdown-user-scroll scrollbar-outer">
                                <li>
                                    <div class="user-box">
                                        <div class="avatar-lg">
                                            <c:if test="${member.member_thumnail ne null}">
                                                <img src="<c:out value="${member.member_thumnail}"/>" alt="..."
                                                     class="avatar-img rounded-circle">
                                            </c:if>
                                            <c:if test="${member.member_thumnail eq null}">
                                                <img src="/resources/assets/img/user.png"
                                                     class="avatar-img rounded-circle">
                                            </c:if>
                                        </div>
                                        <div class="u-text">
                                            <h4><c:out value="${member.member_id}"/></h4>
                                            <p class="text-muted"><c:out value="${member.member_email}"/></p>
                                            <a href="/member/modifyMember?member_id=${member.member_id }" class="btn btn-xs btn-secondary btn-sm">View
                                                Profile</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                    <div id="hidden"></div>
                                    <a class="dropdown-item" id="logout">Logout</a>
                                </li>
                            </div>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${member eq null}">
                    <button class="btn btn-primary btn-border btn-round" onclick="location.href='/login'">
                        <span class="btn-label"><i class="flaticon-user"></i></span>Login/SignUp
                    </button>
                </c:if>
            </ul>
        </div>
    </nav>
    <!-- End Navbar -->