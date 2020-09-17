<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $(".animation").hover(function () {
            $(this).addClass('animated pulse');
        }, function () {
            $(this).removeClass('animated pulse');
        });

        $('.owl-carousel').owlCarousel({
            nav: true, // Show next and prev buttons
            autoplay: true,
            autoplaySpeed: 3000,
            autoplayHoverPause: true,
            navSpeed: 400,
            loop: true,
            items: 1
        })
    })
</script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="owl-carousel owl-theme owl-img-responsive">
                <div class="item"><img src="/resources/assets/img/1.png"></div>
                <div class="item"><img src="/resources/assets/img/2.png"></div>
                <div class="item"><img src="/resources/assets/img/3.png"></div>
            </div>
        </div>
        <div class="row row-card-no-pd">
            <div class="col-sm-6 col-md-2 animation">
                <div class="card card-stats card-round">
                    <div class="card-body" style="cursor: pointer" onclick="location.href='/caa/caaSelect'">
                        <div class="row">
                            <div class="col-5">
                                <div class="icon-big text-center">
                                    <i class="flaticon-presentation text-secondary"></i>
                                </div>
                            </div>
                            <div class="col-7 col-stats">
                                <div class="numbers">
                                    <h6 class="card-title">상권분석</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2 animation">
                <div class="card card-stats card-round">
                    <div class="card-body" style="cursor: pointer" onclick="location.href='/sns/snsAnalysisFirst'">
                        <div class="row">
                            <div class="col-5">
                                <div class="icon-big text-center">
                                    <i class="flaticon-twitter text-primary"></i>
                                </div>
                            </div>
                            <div class="col-7 col-stats">
                                <div class="numbers">
                                    <h5 class="card-title">SNS 분석</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2 animation">
                <div class="card card-stats card-round">
                    <div class="card-body" style="cursor: pointer" onclick="location.href='/history/selectHistory'">
                        <div class="row">
                            <div class="col-5">
                                <div class="icon-big text-center">
                                    <i class="icon-location-pin text-danger"></i>
                                </div>
                            </div>
                            <div class="col-7 col-stats">
                                <div class="numbers">
                                    <h5 class="card-title">점포분석</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2 animation">
                <div class="card card-stats card-round">
                    <div class="card-body" style="cursor: pointer" onclick="location.href='/cctv/CCTVAnalysis'">
                        <div class="row">
                            <div class="col-5">
                                <div class="icon-big text-center">
                                    <i class="icon-camrecorder"></i>
                                </div>
                            </div>
                            <div class="col-7 col-stats">
                                <div class="numbers">
                                    <h6 class="card-title">CCTV</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2 animation">
                <div class="card card-stats card-round">
                    <div class="card-body" style="cursor: pointer" onclick="location.href='/ir/irSelectPage'">
                        <div class="row">
                            <div class="col-5">
                                <div class="icon-big text-center">
                                    <i class="icon-magic-wand text-warning"></i>
                                </div>
                            </div>
                            <div class="col-7 col-stats">
                                <div class="numbers">
                                    <h5 class="card-title">업종 유형</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-2 animation">
                <div class="card card-stats card-round">
                    <div class="card-body" style="cursor: pointer" onclick="location.href='/caa/survive'">
                        <div class="row">
                            <div class="col-5">
                                <div class="icon-big text-center">
                                    <i class="flaticon-list text-success"></i>
                                </div>
                            </div>
                            <div class="col-7 col-stats">
                                <div class="numbers">
                                    <h5 class="card-title">생존률</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>