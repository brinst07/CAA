<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {
        $(".animation").hover(function () {
            $(this).addClass('animated pulse');
        }, function () {
            $(this).removeClass('animated pulse');
        });
    })
</script>
<script src="/resources/assets/js/caa/main.js"></script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header bg-primary-gradient">
            <div class="d-flex">
                <div class="select2-input " style="margin:0 auto"> 
                        <select id="basic" name="basic" class="form-control">
                            <option value="도봉구">도봉구</option>
                            <option value="성북구">성북구</option>
                            <option value="동대문구">동대문구</option>
                            <option value="서대문구">서대문구</option>
                            <option value="중랑구">중랑구</option>
                            <option value="성동구">성동구</option>
                            <option value="영등포구">영등포구</option>
                            <option value="마포구">마포구</option>
                            <option value="강북구">강북구</option>
                            <option value="관악구">관악구</option>
                            <option value="동작구">동작구</option>
                            <option value="구로구">구로구</option>
                            <option value="강서구">강서구</option>
                            <option value="중구">중구</option>
                            <option value="송파구">송파구</option>
                            <option value="노원구">노원구</option>
                            <option value="강남구">강남구</option>
                            <option value="양천구">양천구</option>
                            <option value="은평구">은평구</option>
                            <option value="은평구">강동구</option>
                            <option value="강동구">서초구</option>
                            <option value="금천구">금천구</option>
                            <option value="광진구">광진구</option>
                            <option value="용산구">용산구</option>
                            <option value="종로구">종로구</option>
                        </select>
                 
                </div>
            </div>
            <div class="page-inner py-5">
                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
                    <div class="col-md-4">
                        <div class="card card-round">
                            <div class="card-header" style="background: #4ea1d3">
                                <h4 class="card-title" style="text-align: center; color: white">3년 생존율 추이</h4>
                            </div>
                            <div class="card-body">
                                <div id="chart-container1">
                                    <canvas id="barChart1"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-round">
                            <div class="card-header" style="background: #4ea1d3">
                                <h4 class="card-title" style="text-align: center; color: white">창업위험도</h4>
                            </div>
                            <div class="card-body">
                                <div id="trafficLight"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card card-round">
                            <div class="card-header" style="background: #4ea1d3">
                                <h4 class="card-title" style="text-align: center; color: white">1~5년 생존율</h4>
                            </div>
                            <div class="card-body">
                                <div id="chart-container2">
                                    <canvas id="barChart2"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-inner mt--5">
            <div class="row">
                <div class="col-sm-6 col-md-4 animation">
                    <div class="card card-stats card-round" style="cursor: pointer">
                        <div class="card-body" onclick="location.href = '/caa/caaSelect'">
                            <div class="row">
                                <div class="col-5">
                                    <div class="icon-big text-center">
                                        <i class="flaticon-presentation text-secondary"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-stats">
                                    <div class="numbers">
                                        <p class="card-category">Commercial area analysis</p>
                                        <h4 class="card-title">상권분석</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 animation">
                    <div class="card card-stats card-round">
                        <div class="card-body" style="cursor: pointer" onclick="location.href = '/sns/snsAnalysisFirst'">
                            <div class="row">
                                <div class="col-5">
                                    <div class="icon-big text-center">
                                        <i class="flaticon-twitter text-primary"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-stats">
                                    <div class="numbers">
                                        <p class="card-category">SNS Analysis</p>
                                        <h4 class="card-title">SNS 분석</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 animation">
                    <div class="card card-stats card-round">
                        <div class="card-body" style="cursor: pointer">
                            <div class="row">
                                <div class="col-5">
                                    <div class="icon-big text-center">
                                        <i class="icon-location-pin text-danger"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-stats">
                                    <div class="numbers">
                                        <p class="card-category">Store Analysis</p>
                                        <h4 class="card-title">점포 분석</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 animation">
                    <div class="card card-stats card-round">
                        <div class="card-body" style="cursor: pointer">
                            <div class="row">
                                <div class="col-5">
                                    <div class="icon-big text-center">
                                        <i class="icon-camrecorder"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-stats">
                                    <div class="numbers">
                                        <p class="card-category">CCTV Analysis</p>
                                        <h4 class="card-title">CCTV 분석</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 animation">
                    <div class="card card-stats card-round">
                        <div class="card-body" style="cursor: pointer">
                            <div class="row">
                                <div class="col-5">
                                    <div class="icon-big text-center">
                                        <i class="icon-magic-wand text-warning"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-stats">
                                    <div class="numbers">
                                        <p class="card-category">Sector Recommend</p>
                                        <h4 class="card-title">업종 추천</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 animation">
                    <div class="card card-stats card-round" style="cursor: pointer">
                        <div class="card-body ">
                            <div class="row">
                                <div class="col-5">
                                    <div class="icon-big text-center">
                                        <i class="flaticon-list text-success"></i>
                                    </div>
                                </div>
                                <div class="col-7 col-stats">
                                    <div class="numbers">
                                        <p class="card-category">Survey</p>
                                        <h4 class="card-title">설문조사</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>