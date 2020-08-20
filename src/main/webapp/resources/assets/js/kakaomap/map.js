// Create a closure
(function () {
	// Your base, I'm in it!
	var originalAddClassMethod = jQuery.fn.addClass;
	var originalRemoveClassMethod = jQuery.fn.removeClass;

	jQuery.fn.addClass = function () {
		// Execute the original method.
		var result = originalAddClassMethod.apply(this, arguments);

		// trigger a custom event
		jQuery(this).trigger('cssClassChanged');

		// return the original result
		return result;
	}

	jQuery.fn.removeClass = function () {
		// Execute the original method.
		var result = originalRemoveClassMethod.apply(this, arguments);

		// trigger a custom event
		jQuery(this).trigger('cssClassChanged');

		// return the original result
		return result;
	}
})();



var mapContainer = document
	.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(
			33.450701, 126.570667), // 지도의 중심좌표
		level: 3
		// 지도의 확대 레벨
	};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer,
	mapOption);

var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
	map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
	drawingMode: [ // drawing manager로 제공할 그리기 요소 모드입니다
		kakao.maps.drawing.OverlayType.POLYLINE,
		kakao.maps.drawing.OverlayType.RECTANGLE,
		kakao.maps.drawing.OverlayType.CIRCLE,
		kakao.maps.drawing.OverlayType.POLYGON],
	// 사용자에게 제공할 그리기 가이드 툴팁입니다
	// 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
	guideTooltip: ['draw', 'drag', 'edit'],
	markerOptions: { // 마커 옵션입니다 
		draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
		removable: true
		// 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
	},
	polylineOptions: { // 선 옵션입니다
		draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
		removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
		editable: true, // 그린 후 수정할 수 있도록 설정합니다 
		strokeColor: '#39f', // 선 색
		hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
		hintStrokeOpacity: 0.5
		// 그리중 마우스를 따라다니는 보조선의 투명도
	},
	rectangleOptions: {
		draggable: true,
		removable: true,
		editable: true,
		strokeColor: '#39f', // 외곽선 색
		fillColor: '#39f', // 채우기 색
		fillOpacity: 0.5
		// 채우기색 투명도
	},
	circleOptions: {
		draggable: true,
		removable: true,
		editable: true,
		strokeColor: '#39f',
		fillColor: '#39f',
		fillOpacity: 0.5
	},
	polygonOptions: {
		draggable: true,
		removable: true,
		editable: true,
		strokeColor: '#39f',
		fillColor: '#39f',
		fillOpacity: 0.5,
		hintStrokeStyle: 'dash',
		hintStrokeOpacity: 0.5
	}
};

// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.drawing.DrawingManager(
	options);
	list = [];
	data = manager.getData();


// 버튼 클릭 시 호출되는 핸들러 입니다
function selectOverlay(type) {

	if(list.length>=3){
		swal("error", "더이상 영역을 선택할 수 없습니다!!!", "error");
		return;
	}

	// 그리기 중이면 그리기를 취소합니다
	manager.cancel();

	// 클릭한 그리기 요소 타입을 선택합니다
	manager.select(kakao.maps.drawing.OverlayType[type]);


}




manager.addListener('drawend', function (data) {
	console.log('drawend', data);

	swal("선택영역의 이름을 입력해주세요:", {
		content: "input",

	})
		.then((value) => {

			data.name = value;
			list.push(data);
			console.log(list);
		});

});

manager.addListener('remove', function (e) {
	console.log(e.overlayType);
	console.log(e);
});



function test() {
	var data = manager.getData();
	console.log(data);
	console.log(data[kakao.maps.drawing.OverlayType.POLYLINE]);
	console.log(data[kakao.maps.drawing.OverlayType.RECTANGLE]);
	console.log(data[kakao.maps.drawing.OverlayType.CIRCLE]);
	console.log(data[kakao.maps.drawing.OverlayType.POLYGON]);


}


var drawingFlag = false; // 원이 그려지고 있는 상태를 가지고 있을 변수입니다
var centerPosition; // 원의 중심좌표 입니다
var drawingCircle; // 그려지고 있는 원을 표시할 원 객체입니다
var drawingLine; // 그려지고 있는 원의 반지름을 표시할 선 객체입니다
var drawingOverlay; // 그려지고 있는 원의 반경을 표시할 커스텀오버레이 입니다
var drawingDot; // 그려지고 있는 원의 중심점을 표시할 커스텀오버레이 입니다

var circles = []; // 클릭으로 그려진 원과 반경 정보를 표시하는 선과 커스텀오버레이를 가지고 있을 배열입니다



$(function () {
	$('#circle').attr('class','nav-link');

	$('#radius').on("cssClassChanged", function () {
		//비활성화 ==> 활성화
		if ($('#radius').hasClass('active')) {
			initRadius();
		}
		//활성화==>비활성화
		else {
			destoryRadius();
		}
	});

});

var radiusClick = function (mouseEvent) {

	// 클릭 이벤트가 발생했을 때 원을 그리고 있는 상태가 아니면 중심좌표를 클릭한 지점으로 설정합니다
	if (!drawingFlag) {

		// 상태를 그리고있는 상태로 변경합니다
		drawingFlag = true;

		// 원이 그려질 중심좌표를 클릭한 위치로 설정합니다 
		centerPosition = mouseEvent.latLng;

		// 그려지고 있는 원의 반경을 표시할 선 객체를 생성합니다
		if (!drawingLine) {
			drawingLine = new kakao.maps.Polyline({
				strokeWeight: 3, // 선의 두께입니다
				strokeColor: '#00a0e9', // 선의 색깔입니다
				strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle: 'solid' // 선의 스타일입니다
			});
		}

		// 그려지고 있는 원을 표시할 원 객체를 생성합니다
		if (!drawingCircle) {
			drawingCircle = new kakao.maps.Circle({
				strokeWeight: 1, // 선의 두께입니다
				strokeColor: '#00a0e9', // 선의 색깔입니다
				strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
				strokeStyle: 'solid', // 선의 스타일입니다
				fillColor: '#00a0e9', // 채우기 색깔입니다
				fillOpacity: 0.2 // 채우기 불투명도입니다 
			});
		}

		// 그려지고 있는 원의 반경 정보를 표시할 커스텀오버레이를 생성합니다
		if (!drawingOverlay) {
			drawingOverlay = new kakao.maps.CustomOverlay({
				xAnchor: 0,
				yAnchor: 0,
				zIndex: 1
			});
		}
	}
}

var radiusMouseMove = function (mouseEvent) {

	// 마우스무브 이벤트가 발생했을 때 원을 그리고있는 상태이면
	if (drawingFlag) {

		// 마우스 커서의 현재 위치를 얻어옵니다 
		var mousePosition = mouseEvent.latLng;

		// 그려지고 있는 선을 표시할 좌표 배열입니다. 클릭한 중심좌표와 마우스커서의 위치로 설정합니다
		var linePath = [centerPosition, mousePosition];

		// 그려지고 있는 선을 표시할 선 객체에 좌표 배열을 설정합니다
		drawingLine.setPath(linePath);

		// 원의 반지름을 선 객체를 이용해서 얻어옵니다 
		var length = drawingLine.getLength();

		if (length > 0) {

			// 그려지고 있는 원의 중심좌표와 반지름입니다
			var circleOptions = {
				center: centerPosition,
				radius: length,
			};

			// 그려지고 있는 원의 옵션을 설정합니다
			drawingCircle.setOptions(circleOptions);

			// 반경 정보를 표시할 커스텀오버레이의 내용입니다
			var radius = Math.round(drawingCircle.getRadius()),
				content = '<div class="info">반경 <span class="number">' + radius + '</span>m</div>';

			// 반경 정보를 표시할 커스텀 오버레이의 좌표를 마우스커서 위치로 설정합니다
			drawingOverlay.setPosition(mousePosition);

			// 반경 정보를 표시할 커스텀 오버레이의 표시할 내용을 설정합니다
			drawingOverlay.setContent(content);

			// 그려지고 있는 원을 지도에 표시합니다
			drawingCircle.setMap(map);

			// 그려지고 있는 선을 지도에 표시합니다
			drawingLine.setMap(map);

			// 그려지고 있는 원의 반경정보 커스텀 오버레이를 지도에 표시합니다
			drawingOverlay.setMap(map);

		} else {

			drawingCircle.setMap(null);
			drawingLine.setMap(null);
			drawingOverlay.setMap(null);

		}
	}
}

var radiusRightClick = function (mouseEvent) {

	if (drawingFlag) {

		// 마우스로 오른쪽 클릭한 위치입니다 
		var rClickPosition = mouseEvent.latLng;

		// 원의 반경을 표시할 선 객체를 생성합니다
		var polyline = new kakao.maps.Polyline({
			path: [centerPosition, rClickPosition], // 선을 구성하는 좌표 배열입니다. 원의 중심좌표와 클릭한 위치로 설정합니다
			strokeWeight: 3, // 선의 두께 입니다
			strokeColor: '#00a0e9', // 선의 색깔입니다
			strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle: 'solid' // 선의 스타일입니다
		});

		// 원 객체를 생성합니다
		var circle = new kakao.maps.Circle({
			center: centerPosition, // 원의 중심좌표입니다
			radius: polyline.getLength(), // 원의 반지름입니다 m 단위 이며 선 객체를 이용해서 얻어옵니다
			strokeWeight: 1, // 선의 두께입니다
			strokeColor: '#00a0e9', // 선의 색깔입니다
			strokeOpacity: 0.1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			strokeStyle: 'solid', // 선의 스타일입니다
			fillColor: '#00a0e9', // 채우기 색깔입니다
			fillOpacity: 0.2  // 채우기 불투명도입니다 
		});

		var radius = Math.round(circle.getRadius()), // 원의 반경 정보를 얻어옵니다
			content = getTimeHTML(radius); // 커스텀 오버레이에 표시할 반경 정보입니다


		// 반경정보를 표시할 커스텀 오버레이를 생성합니다
		var radiusOverlay = new kakao.maps.CustomOverlay({
			content: content, // 표시할 내용입니다
			position: rClickPosition, // 표시할 위치입니다. 클릭한 위치로 설정합니다
			xAnchor: 0,
			yAnchor: 0,
			zIndex: 1
		});

		// 원을 지도에 표시합니다
		circle.setMap(map);

		// 선을 지도에 표시합니다
		polyline.setMap(map);

		// 반경 정보 커스텀 오버레이를 지도에 표시합니다
		radiusOverlay.setMap(map);

		// 배열에 담을 객체입니다. 원, 선, 커스텀오버레이 객체를 가지고 있습니다
		var radiusObj = {
			'polyline': polyline,
			'circle': circle,
			'overlay': radiusOverlay
		};

		// 배열에 추가합니다
		// 이 배열을 이용해서 "모두 지우기" 버튼을 클릭했을 때 지도에 그려진 원, 선, 커스텀오버레이들을 지웁니다
		circles.push(radiusObj);
		
		swal("선택영역의 이름을 입력해주세요:", {
		content: "input",

		})
		.then((value) => {

			circles.name = value;
			list.push(circles);
			console.log(list);
		});

		// 그리기 상태를 그리고 있지 않는 상태로 바꿉니다
		drawingFlag = false;

		// 중심 좌표를 초기화 합니다  
		centerPosition = null;

		// 그려지고 있는 원, 선, 커스텀오버레이를 지도에서 제거합니다
		drawingCircle.setMap(null);
		drawingLine.setMap(null);
		drawingOverlay.setMap(null);
	}
}

function initRadius() {
	// 지도에 클릭 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', radiusClick);

	// 지도에 마우스무브 이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
	kakao.maps.event.addListener(map, 'mousemove', radiusMouseMove);

	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	kakao.maps.event.addListener(map, 'rightclick', radiusRightClick);

}

function destoryRadius() {
	// 지도에 클릭 이벤트를 등록합니다
	kakao.maps.event.removeListener(map, 'click', radiusClick);


	// 지도에 마우스무브 이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 원의 위치와 반경정보를 동적으로 보여주도록 합니다
	kakao.maps.event.removeListener(map, 'mousemove', radiusMouseMove);


	// 지도에 마우스 오른쪽 클릭이벤트를 등록합니다
	// 원을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면
	// 마우스 오른쪽 클릭한 위치를 기준으로 원과 원의 반경정보를 표시하는 선과 커스텀 오버레이를 표시하고 그리기를 종료합니다
	kakao.maps.event.removeListener(map, 'rightclick', radiusRightClick);

}

// 지도에 표시되어 있는 모든 원과 반경정보를 표시하는 선, 커스텀 오버레이를 지도에서 제거합니다
function removeCircles() {
	for (var i = 0; i < circles.length; i++) {
		circles[i].circle.setMap(null);
		circles[i].polyline.setMap(null);
		circles[i].overlay.setMap(null);
	}
	circles = [];
}

// 마우스 우클릭 하여 원 그리기가 종료됐을 때 호출하여 
// 그려진 원의 반경 정보와 반경에 대한 도보, 자전거 시간을 계산하여
// HTML Content를 만들어 리턴하는 함수입니다
function getTimeHTML(distance) {

	// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	var walkkTime = distance / 67 | 0;
	var walkHour = '', walkMin = '';

	// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	if (walkkTime > 60) {
		walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	}
	walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	var bycicleTime = distance / 227 | 0;
	var bycicleHour = '', bycicleMin = '';

	// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	if (bycicleTime > 60) {
		bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	}
	bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	var content = '<ul class="info">';
	content += '    <li>';
	content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	content += '    </li>';
	content += '    <li>';
	content += '        <span class="label">도보</span>' + walkHour + walkMin;
	content += '    </li>';
	content += '    <li>';
	content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	content += '    </li>';
	content += '</ul>'

	return content;
}


