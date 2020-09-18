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


//function callArea(area){
//    location.href = "/history/recommendSectorsLevel?areaName="+area;
//}

polygons = [];


//이동 이벤트
kakao.maps.event.addListener(map, 'dragend', function () {


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
        url: '/history/rest/boundSelect',
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

				 console.log("=========================polygonPoints.csName:" + polygonPoints.csName);

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
				console.log("=========================polygonPoints.csName:" + polygonPoints);

            }
			
			for (var i = 0; i < areas.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: areas[i].polygonPoints // 마커의 위치
			    });
			
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: areas[i].content // 인포윈도우에 표시할 내용
			    });
////////////////////////////////////////////////////////////////////





            }
        }, error(xhr, status) {
            console.log(xhr, status);
        }
    })

});