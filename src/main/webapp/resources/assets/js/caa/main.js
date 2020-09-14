var myBarChart;
var myHorizonChart;
$(function () {
    chart1('도봉구');

    $('#basic').select2({
        theme: "classic"
    });



    $('#basic').on('change', function () {
        const val = this.value;
        chart1(val);
    });


});

const chart1 = function(val) {
    $.ajax({
        url: '/caa/rest/main/' + val,
        type: 'get',
        success: function (data) {
            var list = [];
            var list2 = [];
            var zero = 0, nine = 0, eight = 0, seven = 0, six = 0, five= 0;
            for (var i = 0; i < data.length; i++) {

                if (data[i].indi_year == 2020) {
                    list.push(data[i].indi_sale_avg - data[i].indi_clos_avg);
                    list2.push(data[i].indi_sale_avg - data[i].indi_clos_avg);
                }
                if (data[i].indi_year == 2019) {
                    nine += (data[i].indi_sale_avg - data[i].indi_clos_avg);
                    if (data[i + 1].indi_year != 2019) {
                        list.push(nine / 4)
                        list2.push(nine / 4)

                    }

                }
                if (data[i].indi_year == 2018) {
                    eight += (data[i].indi_sale_avg - data[i].indi_clos_avg);
                    if (data[i + 1].indi_year != 2018) {
                        list.push(eight / 4)
                        list2.push(eight / 4)
                    }
                }

                if (data[i].indi_year == 2017) {
                    seven += (data[i].indi_sale_avg - data[i].indi_clos_avg);
                    if (data[i + 1].indi_year != 2017) {
                        list2.push(seven / 4)
                    }
                }

                if (data[i].indi_year == 2016) {
                    six += (data[i].indi_sale_avg - data[i].indi_clos_avg);
                    if (data[i + 1].indi_year != 2016) {
                        list2.push(six / 4)
                    }
                }

                if (data[i].indi_year == 2015) {
                    five += (data[i].indi_sale_avg - data[i].indi_clos_avg);
                    if (data[i + 1].indi_year != 2015) {
                        list2.push(five / 4)
                    }
                }

            }

            list.reverse();
            list2.reverse();
            var barChart1 = document.getElementById('barChart1').getContext('2d');

            if (myBarChart != null)
                myBarChart.destroy();

            myBarChart = new Chart(barChart1, {
                type: 'bar',
                data: {
                    labels: ["2018", "2019", "2020"],
                    datasets: [{
                        label: val,
                        backgroundColor: 'rgb(23, 125, 255)',
                        borderColor: 'rgb(23, 125, 255)',
                        data: list,
                    }],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                }
            });

            myBarChart.update();

            var barChart2 = document.getElementById('barChart2').getContext('2d');

            if (myHorizonChart != null)
                myHorizonChart.destroy();

            myHorizonChart = new Chart(barChart2, {
                type: 'horizontalBar',
                data: {
                    labels: ["2015","2016","2017","2018", "2019", "2020"],
                    datasets: [{
                        label: val,
                        backgroundColor: 'rgb(23, 125, 255)',
                        borderColor: 'rgb(23, 125, 255)',
                        data: list2,
                    }],
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    },
                }
            });

            myHorizonChart.update();

            let change = data[0].indi_change_name;
            // change = encodeURI(encodeURIComponent(change));

            $('#trafficLight').attr("src","/resources/assets/img/"+change+".png");

        },
        error: function (xhr, status) {
            console.log(xhr, status);
        }
    });


}

