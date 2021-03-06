
var mapContainer = document
	.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(
			37.559907, 126.984459), // 지도의 중심좌표
		level: 9
		// 지도의 확대 레벨
	};

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption),
	customOverlay = new kakao.maps.CustomOverlay({}),
	infowindow = new kakao.maps.InfoWindow({removable: true});

var flag = false;

//행정구역 구분
$.getJSON("/resources/assets/guJson.geojson",function(geojson){
	var data = geojson.features;
	//좌표를 저장할 배열
	var coordinates = [];
	// 행정 구 이름
	var name = '';

	$.each(data,function (index,val){
		coordinates = val.geometry.coordinates;
		name = val.properties.A2;
		displayArea(coordinates,name);
	});

})

polygons=[];

//centroid 알고리즘(폴리곤 중심좌표 구하는 것)
function centroid(points){
	var i,j,eln,p1,p2,f,area,x,y;

	area = x = y = 0;

	for(i = 0, len = points.length, j = len -1; i<len; j = i++){
		p1 = points[i];
		p2 = points[j];

		f = p1.y * p2.x - p2.y * p1.x;
		x += (p1.x + p2.x) * f;
		y += (p1.y + p2.y) * f;
		area += f *3;
	}
	return new kakao.maps.LatLng(x/area,y/area);
}

//행정구역 폴리곤
function displayArea(coordinates,name){
	// 폴리곤 그려줄 path
	var path = [];
	// 중심좌표 구하기 위한 지역구 좌표들
	var points = [];

	$.each(coordinates[0][0], function (index,coordinate){
		var point = new Object();
		point.x = coordinate[1];
		point.y = coordinate[0];
		points.push(point);
		path.push(new kakao.maps.LatLng(coordinate[1],coordinate[0]));
	})



	var polygon = new kakao.maps.Polygon({
		map : map,
		path : path,
		strokeWeight : 2,
		strokeColor : '#004c80',
		fillColor : '#fff',
		fillOpacity : 0.7
	});


	//폴리곤을 제거하기 위한 배열
	polygons.push(polygon);

	//다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경한다.
	//지역명을 표시한느 커스텀오버레이를 지도위에 표시한다.
	kakao.maps.event.addListener(polygon,'mouseover',function(mouseEvent){
		polygon.setOptions({
			fillColor : '#09f'
		});

		customOverlay.setContent('<div class="area">'+name+'</div>');

		customOverlay.setPosition(mouseEvent.latLng);
		customOverlay.setMap(map);
		console.log('a');
	});

	//다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경한다.
	kakao.maps.event.addListener(polygon,'mousemove',function (mouseEvent){
		customOverlay.setPosition(mouseEvent.latLng);
	});

	//다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경한다.
	//커스텀 오버레이를 지도에서 제거한다.
	kakao.maps.event.addListener(polygon,'mouseout',function (){
		polygon.setOptions({
			fillColor : '#fff'
		});
		customOverlay.setMap(null);
	});

	//다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당지역을 확대한다.
	kakao.maps.event.addListener(polygon,'click',function(){
		//현재 지도 레벨에서 2레벨 확대한 레벨
		var level = map.getLevel()-2;
		console.log(centroid(points));
		//지도를 클릭된 폴리곤의 중앙 위치를 기준으로 확대한다.
		map.setLevel(level, {anchor: centroid(points), animate:{duration : 350}});

		deletePolygon(polygons);

		flag = true;
	});
}

function deletePolygon(polygons){
	for(var i = 0; i< polygons.length; i++){
		polygons[i].setMap(null);
	}
	polygons = [];
}




var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
	map: map, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
	drawingMode: [ // drawing manager로 제공할 그리기 요소 모드입니다
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
		draggable: false,
		removable: false,
		editable: false,
		strokeColor: '#39f', // 외곽선 색
		fillColor: '#39f', // 채우기 색
		fillOpacity: 0.5
		// 채우기색 투명도
	},
	circleOptions: {
		draggable: false,
		removable: false,
		editable: false,
		strokeColor: '#39f',
		fillColor: '#39f',
		fillOpacity: 0.5
	},
	polygonOptions: {
		draggable: false,
		removable: false,
		editable: false,
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
data = manager.getData();

// Java단으로 전달해줄 객체를 생성한다.
// 영역선택 리스트
list = [];

// 업종선택 리스트
let sectorList = [];


// 버튼 클릭 시 호출되는 핸들러 입니다
function selectOverlay(type) {

	if(flag != true){
		//active 제거
		$('.nav-link').removeClass('active show');
		swal("error", "먼저 폴리곤을 클릭해 영역을 선택해주세요!!!", "error");
		return;
	}

	if (list.length >= 3) {
		swal("error", "더이상 영역을 선택할 수 없습니다!!!", "error");
		return;
	}

	// 그리기 중이면 그리기를 취소합니다
	manager.cancel();

	// 클릭한 그리기 요소 타입을 선택합니다
	manager.select(kakao.maps.drawing.OverlayType[type]);


}





function selectSector() {
	
	if(sectorList.length>=3){
		swal({
			icon: "error",
			title: "ERROR",
			text: "업종은 3개까지 선택이 가능합니다.!"
		})
		return;
	}
	const middletext = $('select[name="middle"] option:selected').text();
	const largetext = $('select[name="large"] option:selected').text();
	
	for(var i = 0; i<sectorList.length; i++){
		if(middletext == sectorList[i].middle){
			swal({
				icon: "error",
				title: "ERROR",
				text: "업종을 중복해서 선택할 수 없습니다."
			})
			return;
		}
	}
	
	if (!middletext) {
		swal({
			icon: "error",
			title: "ERROR",
			text: "중분류를 선택해주세요!"
		})
		return;
	}
	var sectorObj = new Object();
	sectorObj.middle = middletext;
	sectorList.push(sectorObj);
	swal("선택완료!", middletext + "가 선택되었습니다.");

	$('#sector3').append("<li class='list-group-item'>" + $.trim(middletext) +
					"<i class='flaticon-cross' onclick='deleteSector(\"" + middletext + "\")'></i></li>");
	

}


function deleteSector(name){
	for(var i = 0; i<sectorList.length; i++){
		if(name == sectorList[i].middle){
			$('#sector3 li:contains("' + name + '")').remove();
			swal("삭제완료!", name + "가 삭제되었습니다.");
			sectorList.splice(i,1);
		}
	}
}

function deleteData(name) {
	for (var i = 0; i < list.length; i++) {
		if (name == list[i].name) {
			manager.remove(list[i].target);
			$('#middleul li:contains("' + name + '")').remove();
			swal("삭제완료!", name + "가 삭제되었습니다.");
			list.splice(i,1);
		}
	}


}


manager.addListener('drawend', function (data) {
	console.log('drawend', data);

	(function () {
		swal({
			title: "이름작성",
			text: "공백을 제외한 이름을 작성해주세요",
			content: "input"

		})
			.then((value) => {
				if (!value) {
					swal({
						icon: "error",
						title: "ERROR",
						text: "중분류를 선택해주세요!"
					})
					inputName();
					return false;
				}
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {

						if (value == list[i].name) {

							swal({
								icon: "error",
								title: "ERROR",
								text: "영역이름이 중복되었습니다. 다른 이름으로 다시 시도해주세요"

							});
							manager.remove(data.target);


							return;

						}
					}
				}
				data.name = value;

				console.log(data);

				list.push(data);

				$('#middleul').append("<li class='list-group-item'>" + $.trim(data.name) +
					"<i class='flaticon-cross' onclick='deleteData(\"" + data.name + "\")'></i></li>");
				swal("선택완료!", data.name + "가 선택되었습니다.");

			});

	}());

});



$(function () {

	$('#circle').attr('class', 'nav-link');

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

	$('select[name="large"]').on('change', function () {
		var middle = $('select[name="middle"]');

		$.getJSON("/caa/rest/div/" + this.value,
			function (data) {
				middle.children('option').remove();
				for (var i = 0; i < data.length; i++) {
					middle.append('<option value=' + data[i].cs_code + '>' + data[i].cs_code_name + '</option>');
				}
			}).fail(function (xhr, status, err) {
				if (error) {
					error();
				}
			});
	});

});


//**************************************************************************************************************** */
//											상권분석 JS구현 부분
//**************************************************************************************************************** */

function analysis(){
	const data = manager.getData();
	// 일시적으로 담았던 list에서 도형별로 추출하기 위한 배열을 생성한다.
	let circleArray = [];
	let rectangleArray = [];
	let figureArray = [];

	//도형별로 추출한다.
	for(var i = 0; i<list.length; i++){
		if(list[i].overlayType == 'circle'){
			var circleObj = new Object();
			circleObj.name = list[i].name;
			circleObj.x = 0;
			circleObj.y = 0;
			circleArray.push(circleObj);
		}

		if(list[i].overlayType == 'rectangle'){
			let rectangle = new Object();
			rectangle.name = list[i].name;
			rectangleArray.push(rectangle);
		}

		if(list[i].overlayType == 'polygon'){
			let polygon = new Object();
			polygon.name = list[i].name;
			polygonArray.push(polygon);
		}
	}

	//data 객체에 들어있는 좌표값을 각 도형배열에 넣는다.
	for(var i = 0; i< data.circle.length; i++){
		circleArray[i].x = data.circle[i].center.x;
		circleArray[i].y = data.circle[i].center.y;
		circleArray[i].ex = data.circle[i].ePoint.x;
		circleArray[i].ey = data.circle[i].ePoint.y;
		circleArray[i].sx = data.circle[i].sPoint.x;
		circleArray[i].sy = data.circle[i].sPoint.y;
		circleArray[i].radius = data.circle[i].radius;
		var figureObj = new Object();
		figureObj.name = circleArray[i].name;
		figureObj.type = 'circle';
		figureObj.cx = circleArray[i].x;
		figureObj.cy = circleArray[i].y;
		figureObj.ex = circleArray[i].ex;
		figureObj.ey = circleArray[i].ey;
		figureObj.sx = circleArray[i].sx;
		figureObj.sy = circleArray[i].sy;
		figureObj.radius = circleArray[i].radius;
		
		figureArray.push(figureObj);
	};

	for(var i = 0; i<data.rectangle.length; i++){
		rectangleArray[i].minx = data.rectangle[i].sPoint.x;
		rectangleArray[i].miny = data.rectangle[i].sPoint.y;
		rectangleArray[i].maxx = data.rectangle[i].ePoint.x;
		rectangleArray[i].maxy = data.rectangle[i].ePoint.y;
		var figureObj = new Object();
		figureObj.name = rectangleArray[i].name;
		figureObj.type = 'rectangle';
		figureObj.minx = rectangleArray[i].minx;
		figureObj.miny = rectangleArray[i].miny;
		figureObj.maxx = rectangleArray[i].maxx;
		figureObj.maxy = rectangleArray[i].maxy;
		figureArray.push(figureObj);
	}





	let caaInfo = new Object();
	caaInfo.rectangle = rectangleArray;
	caaInfo.circle = circleArray;



	
	var sectorList1 = JSON.stringify(sectorList);
	var jsonCAA = JSON.stringify(caaInfo);
	var jsonDATA = JSON.stringify(figureArray);
	//Form을 만들어서 보내는 코드
	var form = document.createElement('form');
	form.setAttribute('method','post');
	form.setAttribute('action','/caa/caaAnalysis');
	document.charset = 'utf-8';
	var hiddenFiled1 = document.createElement('input');
	hiddenFiled1.setAttribute('type','hidden');
	hiddenFiled1.setAttribute('name','sector');
	hiddenFiled1.setAttribute('value',sectorList1);
	var hiddenFiled2 = document.createElement('input');
	hiddenFiled2.setAttribute('type','hidden');
	hiddenFiled2.setAttribute('name','jsonDATA');
	hiddenFiled2.setAttribute('value',jsonDATA);
	form.appendChild(hiddenFiled1);
	form.appendChild(hiddenFiled2);
	document.body.appendChild(form);
	form.submit();
}