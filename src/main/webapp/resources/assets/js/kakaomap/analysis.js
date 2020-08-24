// Drawing Manager에서 데이터를 가져와 도형을 표시할 아래쪽 지도 div

function createMap(mapId){
    var container = document
        .getElementById('map');
    var options = {
        center : new kakao.maps.LatLng(
            33.450701, 126.570667),
        level : 3
    };

    var map = new kakao.maps.Map(container,
        options);
}