var mapContainer = document
        .getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(
            37.559907, 126.984459), // 지도의 중심좌표
        level: 1
        // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true}); // 지도를 생성합니다

function deletePolygon(polygons) {
    for (var i = 0; i < polygons.length; i++) {
        polygons[i].setMap(null);
    }
}

function callArea(area){
    location.href = "/ir/recommendSectorsLevel?areaName="+area;
}

polygons = [];


//이동 이벤트
kakao.maps.event.addListener(map, 'dragend', function () {

    if(polygons.length>0){
        for(var k = 0; k<polygons.length; k++){
            polygons[k].setMap(null);
        }
    }
    polygons = [];

    // 지도 영역정보를 얻어옵니다
    var bounds = map.getBounds();

    var da = bounds.da;
    var ka = bounds.ka;
    var ia = bounds.ia;
    var ja = bounds.ja;

    var squarePoint = {
        minx: da,
        miny: ka,
        maxx: ia,
        maxy: ja
    }
    var areas = [];
    $.ajax({
        url: '/ir/rest/boundSelect',
        type: 'POST',
        data: JSON.stringify(squarePoint),
        contentType: 'application/json',
        success: function (data) {
            areas = [];
            for (var key in data) {
                //상권의 이름을 추출
                const csName = key;
                //상권의 좌표를 추출
                var polygonPoints;
                polygonPoints = data[csName];

                var path = [];
                console.log("======================================================polygonPoints.length:" + polygonPoints.length);
                //다각형을 구성하는 좌표 배열을 동적으로 삽입한다.
                for (var i = 0; i < polygonPoints.length; i++) {
                    path.push(new kakao.maps.LatLng(polygonPoints[i].y, polygonPoints[i].x));


                }


                var polygonObj = new Object();
                polygonObj.name = csName;
                polygonObj.path = path;
                areas.push(polygonObj);


            }

            // 지도에 영역데이터를 폴리곤으로 표시합니다
            for (var i = 0, len = areas.length; i < len; i++) {
                displayArea(areas[i]);
            }

            // 다각형을 생상하고 이벤트를 등록하는 함수입니다
            function displayArea(area) {

                console.log("======================================================================");
                console.log(area);

                // 다각형을 생성합니다
                var polygon = new kakao.maps.Polygon({
                    map: map, // 다각형을 표시할 지도 객체
                    path: area.path,
                    strokeWeight: 2,
                    strokeColor: '#004c80',
                    strokeOpacity: 0.8,
                    fillColor: '#fff',
                    fillOpacity: 0.7
                });

                polygons.push(polygon);

                // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
                // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
                kakao.maps.event.addListener(polygon, 'mouseover', function (mouseEvent) {
                    polygon.setOptions({fillColor: '#09f'});

                    customOverlay.setContent('<div class="area">' + area.name + '</div>');

                    customOverlay.setPosition(mouseEvent.latLng);
                    customOverlay.setMap(map);
                });

                // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다
                kakao.maps.event.addListener(polygon, 'mousemove', function (mouseEvent) {

                    customOverlay.setPosition(mouseEvent.latLng);
                });

                // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
                // 커스텀 오버레이를 지도에서 제거합니다
                kakao.maps.event.addListener(polygon, 'mouseout', function () {
                    polygon.setOptions({fillColor: '#fff'});
                    customOverlay.setMap(null);
                });

                // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
                kakao.maps.event.addListener(polygon, 'click', function (mouseEvent) {
                    var content = '<div class="info">' +
                        '   <div class="title"><button onclick="callArea(\''+area.name+'\')">' + area.name + '</button></div>' +
                        '</div>';

                    infowindow.setContent(content);
                    infowindow.setPosition(mouseEvent.latLng);
                    infowindow.setMap(map);
                });


            }
        }, error(xhr, status) {
            console.log(xhr, status);
        }
    })

});