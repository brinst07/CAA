<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
   name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
   type="image/x-icon" />
<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<style type="text/css">
#logo {
   width: 250px;
   padding-bottom: 20px;
}

.fontsize {
   font-size: 13px;
}

.thfont {
   font-size: 13px;
}
</style>
<script>

   $(function() {
      
      var str = 4;
      
       myFunction(str);
      
       str= "";
   });
   
   function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}
</script>



   <div class="main-panel full-height">
      <div class="container">
         <div class="panel-header">
            <div class="page-inner border-bottom pb-0 mb-3">
               <div class="d-flex align-items-left flex-column">
                  <h2 class="pb-2 fw-bold">상권 분석</h2>

                  <div
                     class="nav nav-line nav-color-info d-flex align-items-center justify-contents-center"
                     id="navmenu">
                    <a class="nav-link" href="/caa/industryanalysis">업종분석</a> 
                    <a class="nav-link active" href="/caa/saleanalysis">매출분석</a> 
                    <a class="nav-link" href="/caa/popAnalysis">인구분석</a>
                  </div>
               </div>
            </div>
            <div class="page-inner" id="emptable">
   <div class="col-md-12">
               <select id="bungi"class="form-control input-fixed" id="notify_placement_align"  onchange="myFunction(this.value)">
                     <option value="4">분기를 선택해주세요</option>
                     <option value="4">4분기</option>
                     <option value="3">3분기</option>
                     <option value="2">2분기</option>
                     <option value="1">1분기</option>
               </select>
   </div>
         <div class="col-md-12">
               <div class="card">
                  <div class="card-header">
                        <div class="card-title">1. 업종별 매출추이</div>
                  </div>
                     <div id="test1" class="card-body">
                     </div>
                  
               </div>
               </div>

               <div class="col-md-12">
                  <div class="card">
                     <div class="card-header">
                        <div class="card-title">2. 요일별 매출추이</div>
                     </div>
                     <div id="test2" class="card-body">
                     </div>
                  
               </div>
               </div>

               <div class="col-md-12">
                  <div class="card">
                     <div class="card-header">
                        <div class="card-title">3. 시간별 매출추이</div>
                     </div>
                     <div id="test3" class="card-body">
                     </div>
                  
               </div>
               </div>

               <div class="col-md-12">
                  <div class="card">
                     <div class="card-header">
                           <div class="card-title">4. 연령별 매출추이</div>
                        </div>
                     <div id="test4" class="card-body">
                     </div>
                  
               </div>
               </div>

               <div class="col-md-12">
                  <div class="card">
                     <div class="card-header">
                           <div class="card-title">5. 성별 매출추이</div>
                        </div>
                        <div id="test5" class="card-body">
                        </div>
                  </div>
               </div>
               
            </div>
         </div>
      </div>
   </div>

</div>

      <!-- jQuery UI -->
      <script
         src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
      <script
         src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

      <!-- jQuery Scrollbar -->
      <script
         src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

      <!-- Moment JS -->
      <script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

      <!-- Chart JS -->
      <script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

      <!-- jQuery Sparkline -->
      <script
         src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

      <!-- Chart Circle -->
      <script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

      <!-- Datatables -->
      <script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

      <!-- Bootstrap Notify -->
      <script
         src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

      <!-- Bootstrap Toggle -->
      <script
         src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

      <!-- jQuery Vector Maps -->
      <script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
      <script
         src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

      <!-- Google Maps Plugin -->
      <script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

      <!-- Dropzone -->
      <script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

      <!-- Fullcalendar -->
      <script
         src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

      <!-- DateTimePicker -->
      <script
         src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

      <!-- Bootstrap Tagsinput -->
      <script
         src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

      <!-- Bootstrap Wizard -->
      <script
         src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

      <!-- jQuery Validation -->
      <script
         src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

      <!-- Summernote -->
      <script
         src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

      <!-- Select2 -->
      <script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

      <!-- Sweet Alert -->
      <script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

      <!-- Owl Carousel -->
      <script
         src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

      <!-- Magnific Popup -->
      <script
         src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

      <!-- Atlantis JS -->
      <script src="/resources/assets/js/atlantis.min.js"></script>


      <!-- jQuery UI -->

      <script
         src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
      <script
         src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

      <!-- jQuery Scrollbar -->
      <script
         src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

      <!-- Moment JS -->
      <script src="/resources/assets/js/plugin/moment/moment.min.js"></script>

      <!-- Chart JS -->
      <script src="/resources/assets/js/plugin/chart.js/chart.min.js"></script>

      <!-- jQuery Sparkline -->
      <script
         src="/resources/assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

      <!-- Chart Circle -->
      <script src="/resources/assets/js/plugin/chart-circle/circles.min.js"></script>

      <!-- Datatables -->
      <script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>

      <!-- Bootstrap Notify -->
      <script
         src="/resources/assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

      <!-- Bootstrap Toggle -->
      <script
         src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>

      <!-- jQuery Vector Maps -->
      <script src="/resources/assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
      <script
         src="/resources/assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

      <!-- Google Maps Plugin -->
      <script src="/resources/assets/js/plugin/gmaps/gmaps.js"></script>

      <!-- Dropzone -->
      <script src="/resources/assets/js/plugin/dropzone/dropzone.min.js"></script>

      <!-- Fullcalendar -->
      

               
      <script
         src="/resources/assets/js/plugin/fullcalendar/fullcalendar.min.js"></script>

      <!-- DateTimePicker -->
      <script
         src="/resources/assets/js/plugin/datepicker/bootstrap-datetimepicker.min.js"></script>

      <!-- Bootstrap Tagsinput -->
      <script
         src="/resources/assets/js/plugin/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

      <!-- Bootstrap Wizard -->
      <script
         src="/resources/assets/js/plugin/bootstrap-wizard/bootstrapwizard.js"></script>

      <!-- jQuery Validation -->
      <script
         src="/resources/assets/js/plugin/jquery.validate/jquery.validate.min.js"></script>

      <!-- Summernote -->
      <script
         src="/resources/assets/js/plugin/summernote/summernote-bs4.min.js"></script>

      <!-- Select2 -->
      <script src="/resources/assets/js/plugin/select2/select2.full.min.js"></script>

      <!-- Sweet Alert -->
      <script src="/resources/assets/js/plugin/sweetalert/sweetalert.min.js"></script>

      <!-- Owl Carousel -->
      <script
         src="/resources/assets/js/plugin/owl-carousel/owl.carousel.min.js"></script>

      <!-- Magnific Popup -->
      <script
         src="/resources/assets/js/plugin/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>

      <!-- Atlantis JS -->
      <script src="/resources/assets/js/atlantis.min.js"></script>


      
      <script type="text/javascript">
      function myFunction(str) {
         
         //아작스 다시 실행시 기존 데이터 삭제 
         var cell1 = document.getElementById("test1"); 
         while ( cell1.hasChildNodes() ) { cell1.removeChild( cell1.firstChild ); }
         var cell2 = document.getElementById("test2"); 
         while ( cell2.hasChildNodes() ) { cell2.removeChild( cell2.firstChild ); }
         var cell3 = document.getElementById("test3"); 
         while ( cell3.hasChildNodes() ) { cell3.removeChild( cell3.firstChild ); }
         var cell4 = document.getElementById("test4"); 
         while ( cell4.hasChildNodes() ) { cell4.removeChild( cell4.firstChild ); }
         var cell5 = document.getElementById("test5"); 
         while ( cell5.hasChildNodes() ) { cell5.removeChild( cell5.firstChild ); }

         var bungi = str;
         // 사용자가 선택한 값을 가져오는 코드
         var sectorDATA = '${sector}';
         var json = '${jsonMapList}';
         var jsonMapList = JSON.parse(json);
         var sectorList = JSON.parse(sectorDATA);
         

         //업종별 분석을 하기위해 상권을 조회하는 부분
         var d = {
            jsonMapList : jsonMapList,
            sectors : sectorList,
            bungi : bungi
         };
         $.ajax({
            url : '/caa/rest/sales',
            type : 'POST',
            traditional : true,
            contentType : "application/json",
            data : JSON.stringify(d)
         }).done(function(data) {
            
         
            
            //JAVA단에서 받아온 데이터로 차트 출력한다.
            const totalStore = data.totalStore;
            const ubsoList = data.ubsoList;
            console.log(totalStore);
             
            let html1 =  '';
            
            html1 +='<br>';   
            html1 +='                            <div class="chart-container"> ';
            html1 +='                               <div class="chartjs-size-Tueitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
            html1 +='                                     <div class="chartjs-size-Tueitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
            html1 +='                                        <div style="position: absolute; width: 50000px; height: 1000000px; left: 0; top: 0"></div> ';
            html1 +='                                     </div> ';
            html1 +='                                     <div class="chartjs-size-Tueitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
            html1 +='                                        <div style="position: absolute; width: 50%; height: 200%; left: 0; top: 0"></div> ';
            html1 +='                                     </div> ';
            html1 +='                               </div> ';
            html1 +='                                  <canvas id="multipleLineChart1" width="500" height="300" class="chartjs-render-Tueitor" style="display: block; width: 306px; height: 300px;"></canvas> ';
            html1 +='                            </div> ';
            html1 += '                        </div>';
            for(var i=0; i<totalStore.length ; i++){
            html1 += '<div id="table1">';
            html1 += '<div style="width:100%;  overflow:auto">';
            html1 += '<table class="table table-bordered">';
            html1 += '<thead>';
            html1 += '<tr>';
            html1 += '               <th scope="col" colspan="7" style="text-align: left;" >'+ jsonMapList[i].name +'구역 <div style="float: right">';
            html1 += '                  </div></th>';
            html1 += '            </tr>';
            html1 += '            <tr>';
            html1 += '               <th scope="col" class="thfont" align="center"';
            html1 += '      style="text-align: center;">분기</th>';
            html1 += '               <th scope="col" class="thfont" align="center"';
            html1 += '      style="text-align: center;">업종</th>';
            html1 += '               <th scope="col" class="thfont" style="text-align: center;">당월 매출 금액</th>';
            html1 += '               <th scope="col" class="thfont" style="text-align: center;"center" ><span>당월매출건수</th>';
            html1 += '               <th scope="col" class="thfont" style="text-align: center;"center" ><span>점포수</th>';
            html1 += '               <th scope="col" class="thfont" style="text-align: center;"center" ><span>주중 매출 비율</th>';
            html1 += '               <th scope="col" class="thfont" style="text-align: center;"center" ><span>주말 매출 비율</th>';
            html1 += '            </tr>';
            html1 += '         </thead>';
            html1 += '         <tbody>';
                  if (totalStore[i] != null){
                     for(var j=0; j<totalStore[i].length ; j++){
                        html1 += '<tr>';
                        html1 += '<td style="text-align: center;">19년 '+bungi+'분기</td>';
                        html1 += '                  <td style="text-align: center;">'+totalStore[i][j].upjongName+'</td>';
                        html1 += '                  <td style="text-align: right;">'+comma(totalStore[i][j].avgPrice)+'원</td>';   
                        html1 += '                  <td style="text-align: center;">'+comma(totalStore[i][j].avgCount)+'건</td>';   
                        html1 += '                  <td style="text-align: center;">'+totalStore[i][j].sumStore+'개점</td>';   
                        html1 += '                  <td style="text-align: center;">'+totalStore[i][j].avgWDrati+'%</td>';   
                        html1 += '                  <td style="text-align: center;">'+totalStore[i][j].avgWKrati+'%</td>';   
                        html1 += '               </tr>';   
                     }
                   }else {
                      
                        html1 += '<tr>';
                        html1 += '<td style="text-align: center;">19년 '+bungi+'분기</td>';
                        html1 += '                  <td colspan = "7" style="text-align: center;">데이터가 존재하지 않습니다.</td>';
                        html1 += '               </tr>';   
                     }
               html1 += '         </tbody>';   
               html1 += '      </table>';   
               html1 +='</div>';
            }
            $('#test1').append(html1);
            
            
            let html2 = '';
               html2+='                         <div class="chart-container"> ';
               html2 +='                            <div class="chartjs-size-Tueitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html2 +='                                     <div class="chartjs-size-Tueitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html2 +='                                        <div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div> ';
               html2 +='                            </div> ';
               html2 +='                            <div class="chartjs-size-Tueitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html2 +='                            <div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div> ';
               html2 +='                         </div> ';
               html2 +='                      </div> ';
               html2 +='                         <canvas id="multipleLineChart2" width="306" height="300" class="chartjs-render-Tueitor" style="display: block; width: 306px; height: 300px;"></canvas> ';
               html2 +='                      </div> ';
               html2 +='<br>';
               html2 += '</div>';   
            for(var i=0; i<totalStore.length ; i++){
               html2 +='<br>'
               html2 += '<div style="width:100%;  overflow:auto">';
               html2 +='<table  class="table table-bordered">';
            html2 += '                     <thead>';
            html2 += '                        <tr>';
            html2 += '                           <th scope="col" colspan="26" style="text-align: left;"center" >'+ jsonMapList[i].name +'구역</th>';
            html2 += '                        </tr>';
            html2 += '                        <tr>';
            html2 += '                           <th scope="col" rowspan="2" align="center"';
            html2 += '                              style="text-align: center;"><span class="thfont">분기</span></th>';
            html2 += '                           <th scope="col" rowspan="2" align="center"';
            html2 += '                              style="text-align: center;"><span class="thfont">업종</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"><span class="thfont">월</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"center" ><span class="thfont">화</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"center" ><span class="thfont">수</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"center" ><span class="thfont">목</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"center" ><span class="thfont">금</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"center" ><span class="thfont">토</span></th>';
            html2 += '                           <th scope="col" colspan="3" style="text-align: center;"center" ><span class="thfont">일</span></th>';
            html2 += '                        </tr>';
            html2 += '                        <tr>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</th>';
            html2 += '                           <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>건수</th>';
            html2 += '                           <th scope="col" style="text-align: center;"center" ><span>비율</th>';
            html2 += '                        </tr>';
            html2 += '                     </thead>';
                  html2 += '                     <tbody>';
            if (totalStore[i] != null){
               for(var j=0; j<totalStore[i].length ; j++){
                  html2 += '                           <tr>';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">19년';
                  html2 += '                                    '+ bungi+' 분기</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+totalStore[i][j].upjongName+'</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgMonPrice)+'원</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgMonCount)+'건</span></td>';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgMonRati+'%</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgTuePrice)+'원</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgTueCount)+'건</span></td>';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgTueRati+'%</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgWedPrice)+'원</span></td>';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgWedCount)+'건</span></td>';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgWedRati+'%</span></td>  ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgThuPrice)+'원</span></td> ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgThuCount)+'건</span></td> ';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgThuRati+'%</span></td>  ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgTuePrice)+'원</span></td> ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgTueCount)+'건</span></td> ';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgTueRati+'%</span></td>  ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgSatPrice)+'원</span></td> ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgSatCount)+'건</span></td> ';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgSatRati+'%</span></td>  ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgSunPrice)+'원</span></td> ';
                  html2 += '                              <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgSunCount)+'건</span></td> ';
                  html2 += '                              <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgSunRati+'%</span></td>  ';
                  html2 += '                           </tr>';
               }
            }else{
               html2 += '                           <tr>';
               html2 += '                              <td style="text-align: center;"><span class="fontsize">19년';
               html2 += '                                    '+ bungi+' 분기</span></td>';
               html2 += '                              <td style="text-align: center;" colspan="14"><span class="fontsize">데이터가 존재하지 않습니다.</span></td>';
               html2 += '                           </tr>';
               
            }
               html2 += '                     </tbody>';
            html2 += '                  </table>';
            html2 +='</div>';
            }
            $('#test2').append(html2);
            html2 = '';
            let html3 = '';
               html3 +='                         <div class="chart-container"> ';
               html3 +='                            <div class="chartjs-size-Tueitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html3 +='                                     <div class="chartjs-size-Tueitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html3 +='                                        <div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div> ';
               html3 +='                            </div> ';
               html3 +='                            <div class="chartjs-size-Tueitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html3 +='                            <div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div> ';
               html3 +='                         </div> ';
               html3 +='                      </div> ';
               html3 +='                         <canvas id="multipleLineChart3" width="306" height="300" class="chartjs-render-Tueitor" style="display: block; width: 306px; height: 300px;"></canvas> ';
               html3 +='                      </div> ';
               html3 +='<br>';
               html3 += '</div>';   
            for(var i=0; i<totalStore.length ; i++){
               html3 +='<br>'
               html3 += '<div style="width:100%;  overflow:auto">';
               html3 +='<table id="table3" class="table table-bordered">';
            html3 += '                           <thead>';
            html3 += '                              <tr>';
            html3 += '                                 <th scope="col" colspan="25" style="text-align: left;"left" ><span>'+ jsonMapList[i].name +'구역</th>';
            html3 += '                              </tr>';
            html3 += '                              <tr>';
            html3 += '                                 <th scope="col" rowspan="2" align="center" style="text-align: center;"><span class="thfont">분기</span></th>';
            html3 += '                                 <th scope="col" rowspan="2" align="center" style="text-align: center;"><span class="thfont">업종</span></th>';
            html3 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">00~06</span></th>';
            html3 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">06~11</span></th>';
            html3 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">11~14</span></th>';
            html3 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">14~17</span></th>';
            html3 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">17~21</span></th>';
            html3 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">21~24</span></th>';
            html3 += '                              </tr>';
            html3 += '                              <tr>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">건수</span></th>';
            html3 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">건수</span></th>';
            html3 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">건수</span></th>';
            html3 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">건수</span></th>';
            html3 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">건수</span></th>';
            html3 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html3 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">건수</span></th>';
            html3 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</th>';
            html3 += '                              </tr>';
            html3 += '                           <tbody>';
            if (totalStore[i] != null){
               for(var j=0; j<totalStore[i].length ; j++){   
            html3 += '                                 <tr>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">19년 '+bungi+' 분기</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+totalStore[i][j].upjongName+'</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg0006Price)+'원</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg0006Count)+'건</span></td>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg0006Rati+'%</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg0611Price)+'원</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg0611Count)+'건</span></td>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg0611Rati+'%</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg1114Price)+'원</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg1114Count)+'건</span></td>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg1114Rati+'%</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg1417Price)+'원</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg1417Count)+'건</span></td>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg1417Rati+'%</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg1721Price)+'원</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg1721Count)+'건</span></td>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg1721Rati+'%</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg2124Price)+'원</span></td>';
            html3 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg2124Count)+'건</span></td>';
            html3 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg2124Rati+'%</span></td>';
            html3 += '                                 </tr>';
               }
            }else{
               
               html3 += '                           <tr>';
               html3 += '                              <td style="text-align: center;"><span class="fontsize">19년';
               html3 += '                                    '+ bungi+' 분기</span></td>';
               html3 += '                              <td style="text-align: center;" colspan="13"><span class="fontsize">데이터가 존재하지 않습니다.</span></td>';
               html3 += '                           </tr>';
               }
            
            html3 += '                           </tbody>';
            html3 += '                        </table>';
            html3 +='</div>';
            }
            $('#test3').append(html3);
            html3 = '';

            let html4 = '';
               html4 +='                         <div class="chart-container"> ';
               html4 +='                            <div class="chartjs-size-Tueitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html4 +='                                     <div class="chartjs-size-Tueitor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html4 +='                                        <div style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div> ';
               html4 +='                            </div> ';
               html4 +='                            <div class="chartjs-size-Tueitor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html4 +='                            <div style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div> ';
               html4 +='                         </div> ';
               html4 +='                      </div> ';
               html4 +='                         <canvas id="multipleLineChart4" width="306" height="300" class="chartjs-render-Tueitor" style="display: block; width: 306px; height: 300px;"></canvas> ';
               html4 +='                      </div> ';
               html4 +='<br>';
               html4 += '</div>';   
            for(var i=0; i<totalStore.length ; i++){
               html4 +='<br>'
            html4 += '<div style="width:100%;  overflow:auto">';
            html4 += '                        <table class="table table-bordered">';
            html4 += '                           <thead>';
            html4 += '                              <tr>';
            html4 += '                                 <th scope="col" colspan="25" style="text-align: left;"center" ><span>'+ jsonMapList[i].name +'구역</th>';
            html4 += '                              </tr>';
            html4 += '                              <tr>';
            html4 += '                                 <th scope="col" rowspan="2" align="center" style="text-align: center;"><span class="thfont">분기</span></th>';
            html4 += '                                 <th scope="col" rowspan="2" align="center" style="text-align: center;"><span class="thfont">업종</span></th>';
            html4 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">10대</span></th>';
            html4 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">20대</span></th>';
            html4 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">30대</span></th>';
            html4 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">40대</span></th>';
            html4 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">50대</span></th>';
            html4 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">60대</span></th>';
            html4 += '                              </tr>';
            html4 += '                              <tr>';
            html4 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html4 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html4 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html4 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html4 += '                                 <th scope="col" align="center" style="text-align: center;"><spanclass="thfont">금액</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html4 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</th>';
            html4 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</th>';
            html4 += '                              </tr>';
            html4 += '                           <tbody>';
            if (totalStore[i] != null){
               for(var j=0; j<totalStore[i].length ; j++){   
            html4 += '                                 <tr>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">19년 '+bungi+' 분기</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+totalStore[i][j].upjongName+'</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg10Price)+'원</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg10Count)+'건</span></td>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg10Rati+'%</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg20Price)+'원</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg20Count)+'건</span></td>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg20Rati+'%</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg30Price)+'원</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg30Count)+'건</span></td>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg30Rati+'%</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg40Price)+'원</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg40Count)+'건</span></td>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg40Rati+'%</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg50Price)+'원</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg50Count)+'건</span></td>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg50Rati+'%</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg60Price)+'원</span></td>';
            html4 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avg60Count)+'건</span></td>';
            html4 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avg60Rati+'%</span></td>';
            html4 += '                                 </tr>';
               }
            }else{
               
               html4 += '                           <tr>';
               html4 += '                              <td style="text-align: center;"><span class="fontsize">';
               html4 += '                                    19년'+ bungi+' 분기</span></td>';
               html4 += '                              <td style="text-align: center;" colspan="13"><span class="fontsize">데이터가 존재하지 않습니다.</span></td>';
               html4 += '                           </tr>';
               }
            
            html4 += '                           </tbody>';
            html4 += '                        </table>';
            html4 +='</div>';
            }
            $('#test4').append(html4);
            html4 = '';

            html5 = '';
            html5 +='<div  style="display: flex;">';
            for(var i=0; i<totalStore.length ; i++){
   
               html5 +='<br>'
               html5 +='                         <div style="text-align:left;"><h4>'+jsonMapList[i].name+'</h4></div> ';
               html5 +='                   <div class="chart-container item"  > ';
               html5 +='                         <div class="chartjs-size-Tueitor" ';
               html5 +='                               style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html5 +='                               <div class="chartjs-size-Tueitor-expand" ';
               html5 +='                               style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html5 +='                               <div ';
               html5 +='                                  style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div> ';
               html5 +='                            </div> ';
               html5 +='                            <div class="chartjs-size-Tueitor-shrink" ';
               html5 +='                                  style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"> ';
               html5 +='                               <div ';
               html5 +='                                  style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div> ';
               html5 +='                            </div> ';
               html5 +='                         </div> ';
//                html5 +='                      <canvas id="multipleBarChart"style="width: 438px; height: 300px; display: block; width="438" align:"center" height="300" class="chartjs-render-Tueitor"></canvas> ';
               html5 +='                      <canvas id="doughnutChart2'+i+'"style="width: 438px; height: 300px; display: block; width="438" align:"center" height="300" class="chartjs-render-Tueitor"></canvas> ';
               html5 +='                      </div> ';
            }
            html5 +='</div>';//flex
            for(var i=0; i<totalStore.length ; i++){

            html5 += '<div style="width:100%;  overflow:auto">';
            html5 += '                        <table class="table table-bordered">';
            html5 += '                           <thead>';
            html5 += '                              <tr>';
            html5 += '                                 <th scope="col" colspan="21" style="text-align: left;"center" ><span>'+ jsonMapList[i].name +'구역</th>';
            html5 += '                              </tr>';
            html5 += '                              <tr>';
            html5 += '                                 <th scope="col" rowspan="2" align="center" style="text-align: center;"><span class="thfont">분기</span></th>';
            html5 += '                                 <th scope="col" rowspan="2" align="center" style="text-align: center;"><span class="thfont">업종</span></th>';
            html5 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">남자</span></th>';
            html5 += '                                 <th scope="col" colspan="3" style="text-align: center;" ><span class="thfont">여자</span></th>';
            html5 += '                              </tr>';
            html5 += '                              <tr>';
            html5 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html5 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html5 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html5 += '                                 <th scope="col" align="center" style="text-align: center;"><span class="thfont">금액</span></th>';
            html5 += '                                 <th scope="col" style="text-align: center;"center" ><span>건수</span></th>';
            html5 += '                                 <th scope="col" style="text-align: center;"center" ><span>비율</span></th>';
            html5 += '                              </tr>';
            html5 += '                           <tbody>';
            if (totalStore[i] != null){
               for(var j=0; j<totalStore[i].length ; j++){   
            html5 += '                                 <tr>';
            html5 += '                                    <td style="text-align: center;"><span class="fontsize">19년 '+bungi+' 분기</span></td>';
            html5 += '                                    <td style="text-align: right;"><span class="fontsize">'+totalStore[i][j].upjongName+'</span></td>';
            html5 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgMenPrice)+'원</span></td>';
            html5 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgMenCount)+'건</span></td>';
            html5 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgMenRati+'%</span></td>';
            html5 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgWomPrice)+'원</span></td>';
            html5 += '                                    <td style="text-align: right;"><span class="fontsize">'+comma(totalStore[i][j].avgWomCount)+'건</span></td>';
            html5 += '                                    <td style="text-align: center;"><span class="fontsize">'+totalStore[i][j].avgWomRati+'%</span></td>';
            html5 += '                                 </tr>';
               }
            }else{
               
               html5 += '                           <tr>';
               html5 += '                              <td style="text-align: center;"><span class="fontsize">';
               html5 += '                                    19년'+ bungi+' 분기</span></td>';
               html5 += '                              <td style="text-align: center;" colspan="13"><span class="fontsize">데이터가 존재하지 않습니다.</span></td>';
               html5 += '                           </tr>';
               }
            
            html5 += '                           </tbody>';
            html5 += '                        </table>';
            html5 +='</div>';
            }
            $('#test5').append(html5);
            html5 = '';
            
            
                let color = ["#1d7af3","#f02e2e","#ff9900"];
                
                 var labelData1 = [];
            let datasets1 = [];
               
               for(var i = 0; i<totalStore.length; i++){
                    labelData1.push(jsonMapList[i].name);
                    if(totalStore[i] != null){
                       var avgData = 0;
                       for(var j=0; j<totalStore[i].length; j++){
                          avgData = parseInt(avgData) + parseInt(totalStore[i][j].avgPrice);
                       }
                       resultData = avgData/totalStore[i].length;
                       datasets1.push(resultData);
                    }
                    else{datasets1.push(null)}
               }
                  
                  
                  var myBarChart = new Chart(multipleLineChart1, {
                     type: 'bar',
                     data: {
                        labels: labelData1,
                        datasets : [{
                           backgroundColor: color,
                           borderColor: color,
                           data: datasets1
                        }
                        ]
                  
                  ,
                     },
                     options:
                        {
                        title: {
                        display: true,
                        text: '매출 그래프'
                        },
                        legend : {
                            position : 'hidden'
                         },
                        responsive: true, 
                        maintainAspectRatio: false,
                        scales: {
                            xAxes: [{
                                    barPercentage: 0.3
                                }],
                           yAxes: [{
                        	   ticks: {
                                   beginAtZero:true,
                                   callback: function(value, index, values) {
                                       if(parseInt(value) >= 1000){
                                          return  value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
                                       } else {
                                          return  value;
                                       }
                                  }                            
                               }
                           }]
                        },
                     }
                  });


                  
         let datasets2 = [];
            for(var i = 0; i<totalStore.length; i++){
                    if(totalStore[i] != null){
                       var avgMon= 0;
                       var avgTue= 0;
                       var avgWen= 0;
                       var avgThr= 0;
                       var avgFri= 0;
                       var avgSat= 0;
                       var avgSun= 0;
                       var result2 =null;
                       for(var j = 0; j<totalStore[i].length; j++){
                               avgMon = parseInt(avgMon)+parseInt(totalStore[i][j].avgMonPrice)
                               avgTue = parseInt(avgTue)+parseInt(totalStore[i][j].avgTuePrice)
                               avgWen = parseInt(avgWen)+parseInt(totalStore[i][j].avgWedPrice)
                               avgThr = parseInt(avgThr)+parseInt(totalStore[i][j].avgThuPrice)
                               avgFri = parseInt(avgFri)+parseInt(totalStore[i][j].avgFriPrice)
                               avgSat = parseInt(avgSat)+parseInt(totalStore[i][j].avgSatPrice)
                               avgSun = parseInt(avgSun)+parseInt(totalStore[i][j].avgSunPrice)

                          }
                            result2 = [ parseInt(avgMon)/parseInt(totalStore[i].length), parseInt(avgTue)/parseInt(totalStore[i].length), parseInt(avgWen)/parseInt(totalStore[i].length),parseInt(avgThr)/parseInt(totalStore[i].length), parseInt(avgFri)/parseInt(totalStore[i].length), parseInt(avgSat)/parseInt(totalStore[i].length), parseInt(avgSun)/parseInt(totalStore[i].length) ]
                          
                           var data ={
                                label : labelData1[i],
                                borderColor : color[i],
                                pointBorderColor : "#FFF",
                                pointBackgroundColor : color[i],
                                pointBorderWidth : 2,
                                pointHoverRadius : 4,
                                pointHoverBorderWidth : 1,
                                pointRadius : 4,
                                backgroundColor : 'transparent',
                                fill : true,
                                borderWidth : 2,
                                data :result2
                             } 
                          datasets2.push(data);
                   }
            }
                  
                   var multipleLineChart2 ="multipleLineChart2" ;
                   var myMultipleLineChart1 = new Chart(multipleLineChart2, {
                      type : 'line',
                      data : {
                         labels : [ "월", "화", "수", "목","금","토","일" ],
                         datasets : datasets2
                      },
                      options :    
                         {
                         title: {
                         display: true,
                         text: '요일별 매출 그래프'
                         },
                         responsive : true,
                         maintainAspectRatio : false,
                         legend : {
                            position : 'bottom',
                         },
                         tooltips : {
                            bodySpacing : 4,
                            mode : "nearest",
                            intersect : 0,
                            position : "nearest",
                            xPadding : 10,
                            yPadding : 10,
                            caretPadding : 10
                         },
                         layout : {
                            padding : {
                               left : 15,
                               right : 15,
                               top : 15,
                               bottom : 15
                            }
                         },
                         scales: {
                             yAxes: [{
                                 ticks: {
                                     beginAtZero:true,
                                     callback: function(value, index, values) {
                                         if(parseInt(value) >= 1000){
                                            return   value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
                                         } else {
                                            return  value;
                                         }
                                    }                            
                                 }
                             }]
                         }
                      }
                   });
                   
                   // 밑
                   
         let datasets3 = [];
            for(var i = 0; i<totalStore.length; i++){
                    if(totalStore[i] != null){
                         var avg0006= 0;
                      var avg0611= 0;
                      var avg1114= 0;
                      var avg1417= 0;
                      var avg1721= 0;
                      var avg2124= 0;
                      
                      var result3 =null;
                      
                       for(var j = 0; j<totalStore[i].length; j++){
                          
                              avg0006 = parseInt(avg0006)+parseInt(totalStore[i][j].avg0006Price)
                               avg0611 = parseInt(avg0611)+parseInt(totalStore[i][j].avg0611Price)
                               avg1114 = parseInt(avg1114)+parseInt(totalStore[i][j].avg1114Price)
                               avg1417 = parseInt(avg1417)+parseInt(totalStore[i][j].avg1417Price)
                               avg1721 = parseInt(avg1721)+parseInt(totalStore[i][j].avg1721Price)
                               avg2124 = parseInt(avg2124)+parseInt(totalStore[i][j].avg2124Price)
                          
                          }
                       
                        result3 = [ parseInt(avg0006)/parseInt(totalStore[i].length), parseInt(avg0611)/parseInt(totalStore[i].length), parseInt(avg1114)/parseInt(totalStore[i].length),parseInt(avg1417)/parseInt(totalStore[i].length), parseInt(avg1721)/parseInt(totalStore[i].length), parseInt(avg2124)/parseInt(totalStore[i].length) ]

                          var data ={
                                label : labelData1[i],
                                borderColor : color[i],
                                pointBorderColor : "#FFF",
                                pointBackgroundColor : color[i],
                                pointBorderWidth : 2,
                                pointHoverRadius : 4,
                                pointHoverBorderWidth : 1,
                                pointRadius : 4,
                                backgroundColor : 'transparent',
                                fill : true,
                                borderWidth : 2,
                               data : result3
                              
                             }         
                          datasets3.push(data);
                   }
            }
                  
                   var myMultipleLineChart1 = new Chart(multipleLineChart3, {
                      type : 'line',
                      data : {
                         labels : [ "00~06", "06~11", "11~14", "14~17","17~21","21~24" ],
                         datasets : datasets3
                      },
                      options :
                         {
                         title: {
                         display: true,
                         text: '시간별 매출 그래프'
                         },
                         responsive : true,
                         maintainAspectRatio : false,
                         legend : {
                            position : 'bottom',
                         },
                         tooltips : {
                            bodySpacing : 4,
                            mode : "nearest",
                            intersect : 0,
                            position : "nearest",
                            xPadding : 10,
                            yPadding : 10,
                            caretPadding : 10
                         },
                         layout : {
                            padding : {
                               left : 15,
                               right : 15,
                               top : 15,
                               bottom : 15
                            }
                         },
                         scales: {
                             yAxes: [{
                                 ticks: {
                                     beginAtZero:true,
                                     callback: function(value, index, values) {
                                         if(parseInt(value) >= 1000){
                                            return   value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
                                         } else {
                                            return  value;
                                         }
                                    }                            
                                 }
                             }]
                         }
                      }
                   });
                   
         let datasets4 = [];
            for(var i = 0; i<totalStore.length; i++){
                    if(totalStore[i] != null){
                       var avg10= 0;
                      var avg20= 0;
                      var avg30= 0;
                      var avg40= 0;
                      var avg50= 0;
                      var avg60= 0;
                      
                      var result4 =null;

                       for(var j = 0; j<totalStore[i].length; j++){
                          
                         avg10 = parseInt(avg10)+parseInt(totalStore[i][j].avg10Price)
                         avg20 = parseInt(avg20)+parseInt(totalStore[i][j].avg20Price)
                         avg30 = parseInt(avg30)+parseInt(totalStore[i][j].avg30Price)
                         avg40 = parseInt(avg40)+parseInt(totalStore[i][j].avg40Price)
                         avg50 = parseInt(avg50)+parseInt(totalStore[i][j].avg50Price)
                         avg60 = parseInt(avg60)+parseInt(totalStore[i][j].avg60Price)
                         
                          }
                        result4 = [ parseInt(avg10)/parseInt(totalStore[i].length), parseInt(avg20)/parseInt(totalStore[i].length), parseInt(avg30)/parseInt(totalStore[i].length),parseInt(avg40)/parseInt(totalStore[i].length), parseInt(avg50)/parseInt(totalStore[i].length), parseInt(avg60)/parseInt(totalStore[i].length) ]

                          var data ={
                                label : labelData1[i],
                                borderColor : color[i],
                                pointBorderColor : "#FFF",
                                pointBackgroundColor : color[i],
                                pointBorderWidth : 2,
                                pointHoverRadius : 4,
                                pointHoverBorderWidth : 1,
                                pointRadius : 4,
                                backgroundColor : 'transparent',
                                fill : true,
                                borderWidth : 2,
                         data : result4
//                                data : [ totalStore[i][j].avg10Price, totalStore[i][j].avg20Price, totalStore[i][j].avg30Price, totalStore[i][j].avg40Price, totalStore[i][j].avg50Price, totalStore[i][j].avg60Price]
                              
                             }         
                          datasets4.push(data);
                   }
            }
                  
                   var myMultipleLineChart1 = new Chart(multipleLineChart4, {
                      type : 'line',
                      data : {
                         labels : [ "10대", "20대", "30대", "40대","50대","60대" ],
                         datasets : datasets4
                      },
                      options :
                         {
                         title: {
                         display: true,
                         text: '연령별 매출 그래프'
                         },
                         responsive : true,
                         maintainAspectRatio : false,
                         legend : {
                            position : 'bottom',
                         },
                         tooltips : {
                            bodySpacing : 4,
                            mode : "nearest",
                            intersect : 0,
                            position : "nearest",
                            xPadding : 10,
                            yPadding : 10,
                            caretPadding : 10
                         },
                         layout : {
                            padding : {
                               left : 15,
                               right : 15,
                               top : 15,
                               bottom : 15
                            }
                         },
                         scales: {
                             yAxes: [{
                                 ticks: {
                                     beginAtZero:true,
                                     callback: function(value, index, values) {
                                         if(parseInt(value) >= 1000){
                                            return   value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
                                         } else {
                                            return  value;
                                         }
                                    }                            
                                 }
                             }]
                         }
                      }
                   });
                     
         ///////////마지막 크래프
                  for(var i =0; i<totalStore.length;i++){
                    if(totalStore[i] != null){
                      var avgMenRati = 0;
                      var avgWomRati = 0;
                         var result =null;

                          for(var j = 0; j<totalStore[i].length; j++){
                                
                             avgMenRati = parseInt(avgMenRati)+parseInt(totalStore[i][j].avgMenRati)
                               avgWomRati = parseInt(avgWomRati)+parseInt(totalStore[i][j].avgWomRati)
                         
                               
                                }
                              result = [ parseInt(avgMenRati)/parseInt(totalStore[i].length), parseInt(avgWomRati)/parseInt(totalStore[i].length) ]

                                      var dataset =[{
                                            data :result,
                                            backgroundColor : ['#f3545d', '#1d7af3']
                                   }]
                               
                               var doughnutChart2 ="doughnutChart2"+i;
                               var myDoughnutChart = new Chart(doughnutChart2, {
                                  type : 'doughnut',
                                  data : {
                                     datasets :dataset,
                
                                     labels : [ '남', '여' ]
                                  },
                                  options : {
                                     responsive : true,
                                     maintainAspectRatio : false,
                                     legend : {
                                        position : 'bottom'
                                     },
                                     layout : {
                                        padding : {
                                           left : 20,
                                           right : 20,
                                           top : 20,
                                           bottom : 20
                                        }
                                     }
                                  }
                               });
                         }
                         } //for문
                   

         }).fail(function(xhr, status) {
            alert(xhr);
         });
         }
      </script>
</html>
