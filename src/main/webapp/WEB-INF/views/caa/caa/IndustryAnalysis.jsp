<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function () {

        $(document).ajaxStop(function () {
            alert('ajax stop!');
        });

        // 차트 색을 정해주기 위한 배열 선언
        const color = [];
        var colorObj = new Object();
        colorObj.borderColor = "#1d7af3";
        colorObj.pointBorderColor = "#1d7af3";
        color.push(colorObj);
        var colorObj = new Object();
        colorObj.borderColor = "#89e32d";
        colorObj.pointBorderColor = "#89e32d";
        color.push(colorObj);
        var colorObj = new Object();
        colorObj.borderColor = "#f9320c";
        colorObj.pointBorderColor = "#f9320c";
        color.push(colorObj);

        // 사용자가 선택한 값을 가져오는 코드
        var sectorDATA = '${sector}';
        var json = '${jsonMapList}';
        var jsonMapList = JSON.parse(json);
        var sectorList = JSON.parse(sectorDATA);
        //업종별 분석을 하기위해 상권을 조회하는 부분
        var d = {
            jsonMapList: jsonMapList,
            sectors: sectorList
        };
        console.log(d);
        $
            .ajax({
                url: '/caa/rest/sector',
                type: 'POST',
                traditional: true,
                contentType: "application/json",
                data: JSON.stringify(d)
            })
            .done(
                function (data) {
                    //Map에 key가 선택영역의 이름이고 value의 List이다.
                    //선택영역으로 for문을 도는 부분
                    for (var key in data) {
                        //선택영역의 이름
                        const csName = key;

                        //DB에서 추출해낸 데이터
                        const csList = data[csName];

                        //차트를 동적으로 생성해주기 위해 필요한 태그들을 삽입해준다.
                        //차트마다 이름이 달라야하기 때문에 숫자를 삽입해서 관리한다.

                        var lineChartName = "multipleLineChart" + csName;

                        let chartTags =
                            '                        <div class="chart-container">\n' +
                            '                            <div class="chartjs-size-monitor"\n' +
                            '                                 style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">\n' +
                            '                                <div class="chartjs-size-monitor-expand"\n' +
                            '                                     style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">\n' +
                            '                                    <div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>\n' +
                            '                                </div>\n' +
                            '                                <div class="chartjs-size-monitor-shrink"\n' +
                            '                                     style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">\n' +
                            '                                    <div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                            <canvas id="' + lineChartName + '" width="306" height="300" class="chartjs-render-monitor"\n' +
                            '                                    style="display: block; width: 306px; height: 300px;"></canvas>\n' +
                            '                        </div>\n';

                        $('#chartDiv').append(chartTags);

                        var myMultipleLineChart = new Chart(
                            lineChartName, {
                                type: 'line',
                                data: {
                                    labels: [],
                                    datasets: []
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    legend: {
                                        position: 'top',
                                    },
                                    tooltips: {
                                        bodySpacing: 4,
                                        mode: "nearest",
                                        intersect: 0,
                                        position: "nearest",
                                        xPadding: 10,
                                        yPadding: 10,
                                        caretPadding: 10
                                    },
                                    layout: {
                                        padding: {
                                            left: 15,
                                            right: 15,
                                            top: 15,
                                            bottom: 15
                                        }
                                    }
                                }
                            });


                        //차트 하단에 년도 분기별 데이터를 넣기 위한 작업을 한다.
                        for (let i = 0; i < csList[0].length; i++) {
                            myMultipleLineChart.data.labels.push
                            (csList[0][i].store_YEAR + "-" + csList[0][i].store_BUNGI)
                        }

                        //본격적으로 차트에 데이터를 삽입한다.
                        //업종별 개수로 for문을 돈다.
                        for (let j = 0; j < csList.length; j++) {

                            //차트를 생성하고 차트안에 데이터를 삽입하는 부분이다.
                            //업종안에 있는 개수만큼 for문을 돈다.
                            let dataList = [];
                            for (let k = 0; k < csList[j].length; k++) {
                                dataList.push(csList[j][k].store_COUNT);
                            }

                            //업종명을 추출한다.
                            const ser_name = csList[j][0].store_SER_CODE_NAME;

                            //chart에 데이터를 삽입한다.
                            myMultipleLineChart.data.datasets
                                .push({
                                    label: ser_name,
                                    borderColor: color[j].borderColor,
                                    pointBorderColor: color[j].pointBorderColor,
                                    pointBackGroundColor: color[j].pointBackGroundColor,
                                    pointBorderWidth: 2,
                                    pointHoverRadius: 4,
                                    pointHoverBorderWidth: 1,
                                    pointRadius: 4,
                                    backgroundColor: 'transparent',
                                    fill: true,
                                    borderWidth: 2,
                                    data: dataList
                                });
                            // 차트의 데이터를 update해준다.
                            myMultipleLineChart.update();
                        }
                    }

                }).fail(function (xhr, status) {
            alert(xhr);
        });

    });
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27"></script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">상권분석</h2>
                    <div class="nav-scroller d-flex">
                        <div class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center"
                             id="navmenu">
                            <a class="nav-link active" href="/caa/commercialanalysis">상권분석</a> <a class="nav-link"
                                                                                                  href="/caa/industryanalysis">업종분석</a>
                            <a class="nav-link" href="/caa/SaleAnalysis">매출분석</a> <a
                                class="nav-link" href="/caa/popAnalysis">인구분석</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-inner">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">1. 업종별 추이</div>
                    </div>
                    <div class="card-body" id="chartDiv">

                    </div>
                </div>
            </div>
            <div class="row" id="tablediv">

            </div>
            <div class="row" id="douChart">

            </div>


        </div>
    </div>
</div>
<script type="text/javascript">


</script>