<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b34009d4b541b528531e4544e9856e95"></script>

<script type="text/javascript">
    $(document).ready(function (){
       $('a').click(function(event){
    	   event.preventDefault();
           var url = $(this).attr('href');
           console.log(url);
           var name = $(this).text();
           console.log(name);
       });
    });
</script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">점포이력분석</h2>
                    <h4 class="pb-2 f2-bold">점포</h4>
                </div>
            </div>
        </div>
        <div class="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="card-head-row">
                                <div class="card-title">지도</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="map" style="display: block; widht: 785px; height: 375px;"></div>
                            	<script src="/resources/assets/js/kakaomap/rectangle.js"></script>
                            
                            <!-- <script>
                                var container = document
                                    .getElementById('map');
                                var options = {
                                    center: new kakao.maps.LatLng(
                                    		37.52247501, 126.8158529),
                                    level: 3
                                };

                                map = new kakao.maps.Map(container, options);
                                kakao.maps.event.addListener(map, 'tilesloaded', function () {

                                    var bounds = map.getBounds();
                                    // 영역의 남서쪽 좌표를 얻어옵니다
                                    
                                    console.info(bounds);

                                    /* const serviceKey = "IGbeITLd67yRCztv9r65smZLPw2NfvkXkgh7G6BnB3JbBcn3jnPdQ5x5wRJdqMEg62O9YJ9kvgy4jl%2BwoxA5Fg%3D%3D";

                                    $.ajax({
                                        url: "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInRectangle?ServiceKey=" + serviceKey +
                                            "&minx=" + bounds.da + "&miny=" + bounds.ka + "&maxx=" + bounds.ia +
                                            "&maxy=" + bounds.ja,
                                        success: function (data) {
                                            var jsonData = $.xml2json(data);
                                            var history = jsonData.data;
											if(history == null){
                                                swal({
                                                    icon: "info",
                                                    title : "history 정보가 존재하지 않습니다."
                                                });
                                                
                                                return false;
                                            }
											
											
											console.log(bounds.da);
											
											var positions = [];

											for(var i = 0; i<history.length; i++){
                                                let x = history[i].coordx;
                                                let y = history[i].coordy;
                                                x = x.replace("\"","");
                                                y = y.replace("\"","");

                                                var mapInfo = new Object();
                                                mapInfo.content = '<div style="padding:5px;">' +
                                                    '<a href="'+history[i].bizesNm+'">'+history[i].bizesNm+'</a>' +
                                                    '</div>';
                                                mapInfo.latlng = new kakao.maps.LatLng(y,x);

                                                positions.push(mapInfo);

                                            }

											for (var i = 0; i < positions.length; i ++) {
											    // 마커를 생성합니다
											    var marker = new kakao.maps.Marker({
											        map: map, // 마커를 표시할 지도
											        position: positions[i].latlng // 마커의 위치
											    });

											    // 마커에 표시할 인포윈도우를 생성합니다 
											    var infowindow = new kakao.maps.InfoWindow({
											        content: positions[i].content, // 인포윈도우에 표시할 내용
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

                                        }, error: function (xhr, status) {
                                            console.log(xhr, status);
                                        }

                                    }); */
                                });

                            </script> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>