
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
sectorList = [];


// 버튼 클릭 시 호출되는 핸들러 입니다
function selectOverlay(type) {

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
	const smallval = $('select[name="small"]').val();
	const smalltext = $('select[name="small"] option:selected').text();
	
	for(var i = 0; i<sectorList.length; i++){
		if(smallval == sectorList[i]){
			swal({
				icon: "error",
				title: "ERROR",
				text: "업종을 중복해서 선택할 수 없습니다."
			})
			return;
		}
	}
	
	if (!smallval) {
		swal({
			icon: "error",
			title: "ERROR",
			text: "소분류를 선택해주세요!"
		})
		return;
	}

	
	sectorList.push(smalltext);
	
	swal("선택완료!", smalltext + "가 선택되었습니다.");

	$('#sector').append("<li class='list-group-item'>" + $.trim(smalltext) +
					"<i class='flaticon-cross' onclick='deleteSector(\"" + smalltext + "\")'></i></li>");
	

}


function deleteSector(name){
	for(var i = 0; i<sectorList.length; i++){
		if(name == sectorList[i]){
			$('#sector li:contains("' + name + '")').remove();
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

	function inputName() {
		swal({
			title : "이름작성",
			text : "공백을 제외한 이름을 작성해주세요",
			content: "input"

		})
			.then((value) => {
				if (!value){
					swal({
						icon: "error",
						title: "ERROR",
						text: "소분류를 선택해주세요!"
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

	}

	inputName();
});





function test() {


}




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
		console.log(this.value);
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

	$('select[name="middle"]').on('change', function () {
		var small = $('select[name="small"]');
		$.getJSON("/caa/rest/div/" + this.value,
			function (data) {
				small.children('option').remove();
				for (var i = 0; i < data.length; i++) {
					small.append('<option value=' + data[i].cs_code + '>' + data[i].cs_code_name + '</option>');
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
	let polygonArray = [];
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
		circleArray[i].radius = data.circle[i].radius;
		var figureObj = new Object();
		figureObj.name = circleArray[i].name;
		figureObj.type = 'circle';
		figureObj.x = circleArray[i].x;
		figureObj.y = circleArray[i].y;
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

	for(var i = 0; i<data.polygon.length; i++){
		polygonArray[i].points = data.polygon[i].points;
		var figureObj = new Object();
		figureObj.name = polygonArray[i].name;
		figureObj.type = 'polygon';
		figureObj.points = polygonArray[i].points;
		figureArray.push(figureObj);
	}


	let caaInfo = new Object();
	caaInfo.rectangle = rectangleArray;
	caaInfo.circle = circleArray;
	caaInfo.polygon = polygonArray;
	caaInfo.sector = sectorList;

	
	
	var jsonCAA = JSON.stringify(caaInfo);
	console.log(jsonCAA);
	var jsonDATA = JSON.stringify(figureArray);
	//Form을 만들어서 보내는 코드
	var form = document.createElement('form');
	form.setAttribute('method','post');
	form.setAttribute('action','/caa/caaAnalysis');
	document.charset = 'utf-8';
	var hiddenFiled1 = document.createElement('input');
	hiddenFiled1.setAttribute('type','hidden');
	hiddenFiled1.setAttribute('name','json');
	hiddenFiled1.setAttribute('value',jsonCAA);
	var hiddenFiled2 = document.createElement('input');
	hiddenFiled2.setAttribute('type','hidden');
	hiddenFiled2.setAttribute('name','jsonDATA');
	hiddenFiled2.setAttribute('value',jsonDATA);
	form.appendChild(hiddenFiled1);
	form.appendChild(hiddenFiled2);
	document.body.appendChild(form);
	form.submit();
}