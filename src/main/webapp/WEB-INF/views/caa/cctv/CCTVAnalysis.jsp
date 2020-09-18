<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a3acaea52f8fb01b6a85dfd59092f27"></script>
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

    function cctv(url){
        $('#video').attr('src',url);
    }
</script>
<div class="main-panel full-height">
    <div class="container">
        <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
                <div class="d-flex align-items-left flex-column">
                    <h2 class="pb-2 fw-bold">유동차량 분석</h2>
                    <h4 class="pb-2 f2-bold">실시간 CCTV영상으로 유동차량을 분석합니다.</h4>
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
                            <script>
                                var container = document
                                    .getElementById('map');
                                var options = {
                                    center: new kakao.maps.LatLng(
                                    		37.52247501, 126.8158529),
                                    level: 3
                                };

                                map = new kakao.maps.Map(container, options);
                                kakao.maps.event.addListener(map, 'dragend', function () {

                                    var bounds = map.getBounds();
                                    // 영역의 남서쪽 좌표를 얻어옵니다

                                    const serviceKey = "1598838983717";

                                    $.ajax({
                                        url: "http://openapi.its.go.kr:8081/api/NCCTVInfo?key=" + serviceKey +
                                            "&ReqType=2&MinX=" + bounds.da + "&MinY=" + bounds.ka + "&MaxX=" + bounds.ia +
                                            "&MaxY=" + bounds.ja + "&type=ex",
                                        success: function (data) {
                                            var jsonData = $.xml2json(data);
                                            var cctv = jsonData.data;
											if(cctv == null){
                                                swal({
                                                    icon: "info",
                                                    title : "cctv 정보가 존재하지 않습니다."
                                                });
                                                
                                                return false;
                                            }
											
											

											var positions = [];

											for(var i = 0; i<cctv.length; i++){
                                                let x = cctv[i].coordx;
                                                let y = cctv[i].coordy;
                                                x = x.replace("\"","");
                                                y = y.replace("\"","");

                                                var mapInfo = new Object();
                                                mapInfo.content = '<div style="padding:5px;">' +
                                                    '<a onclick="cctv(\''+cctv[i].cctvurl+'\')" data-toggle="modal" data-target="#exampleModalCenter">'+cctv[i].cctvname+'</a>' +
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

                                    });
                                });

                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">CCTV 영상 출력</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <video id="video" autoplay width="100%" height="100%"></video>
            </div>

        </div>
    </div>
</div>