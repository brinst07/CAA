<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/assets/js/caa/main.js" charset="UTF-8"></script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">한눈에 알아보는 생존율</h2>
                </div>
            </div>
        </div>
        <div class="page-inner">
            <div class="d-flex">
                <div class="select2-input " style="margin:0 auto">
                    <label for = "basic">지역</label>
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
                                <div class="col-md-12">
                                    <img id="trafficLight" src="" style="height: 100%; width: 100%">
                                </div>
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
    </div>
</div>