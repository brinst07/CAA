var mapContainer = document
        .getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(
            37.497876, 127.027566), // 지도의 중심좌표
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



//function callArea(area){
//    location.href = "/history/recommendSectorsLevel?areaName="+area;
//}

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
    var positions = [];
    
    $.ajax({
        url: '/history/rest/boundSelect',
        type: 'POST',
        data: JSON.stringify(squarePoint),
        contentType: 'application/json',
        success: function (data) {
            
////////////////////////////////////////////////////////////////////

			var jsonData = $.xml2json(data);
			//var history = jsonData.data;
			
			//var positions = [];
			
			
			for (var i = 0; i < data.length; i++) {
			
			var imageSrc = '/resources/assets/img/food_marker.png', // 마커이미지의 주소입니다    
    		imageSize = new kakao.maps.Size(50, 50), // 마커이미지의 크기입니다
    		imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
   			markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
			
			
			
			const position = new kakao.maps.LatLng(data[i].y, data[i].x);


				if (data[i].type==="음식"){
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				map: map, // 마커를 표시할 지도
				position: position, // 마커의 위치
				image: markerImage
				
				});
				} else {
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: position // 마커의 위치
				
				});
				}

				var iwContent = '<div style="padding:5px; height:120px; width:300px; text-align:center;"><div style="color:#E71D36; font-weight:bold;">'+ data[i].storeNm + '</div><div style="font-size:12px;">(' +data[i].category+ ')</div><div style="font-weight:bold; font-size:13px;">' + data[i].storeAddr + 
								'</div><br><a href="https://map.kakao.com/link/map/'+data[i].storeNm+','+data[i].y+','+data[i].x+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+data[i].storeNm+','+data[i].y+','+data[i].x+'" style="color:blue" target="_blank">길찾기</a></div>';
			

				// 마커에 표시할 인포윈도우를 생성합니다 
				var infowindow = new kakao.maps.InfoWindow({
				content: iwContent, // 인포윈도우에 표시할 내용
				removable : true							        
				});
				
				
				// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
				// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				(function(marker, infowindow) {
					// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
					kakao.maps.event.addListener(marker, 'click', function() {
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);  
					});
				})(marker, infowindow);
				
			}
			
			 polygons.push(marker);





            
        }, error(xhr, status) {
            console.log(xhr, status);
        }
    })

});