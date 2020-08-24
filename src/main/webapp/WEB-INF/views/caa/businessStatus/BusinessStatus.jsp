<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

#selectStatus {
	margin-right: 15px;
}
</style>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '/resources/assets/css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});


	
	
</script>



<!-- CSS Files -->
<!-- <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

CSS Just for demo purpose, don't include it in your project
<link rel="stylesheet" href="/resources/assets/css/demo.css">
 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Atlantis Bootstrap 4 Admin Dashboard</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<link rel="icon" href="/resources/assets/img/icon.ico"
	type="image/x-icon" />

<!-- Fonts and icons -->
<script src="/resources/assets/js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google : {
			"families" : [ "Lato:300,400,700,900" ]
		},
		custom : {
			"families" : [ "Flaticon", "Font Awesome 5 Solid",
					"Font Awesome 5 Regular", "Font Awesome 5 Brands",
					"simple-line-icons" ],
			urls : [ '/resources/assets/css/fonts.min.css' ]
		},
		active : function() {
			sessionStorage.fonts = true;
		}
	});
	
	
</script>
<script type="text/javascript">

$(document).ready(function() {

	var sel1 = {
			
			"1168" : "강남구",
			"1174" : "강동구",
			"1130" : "강북구",
			"1150" : "강서구",
			"1162" : "관악구",
			"1121" : "광진구",
			"1153" : "구로구",
			"1154" : "금천구",
			"1135" : "노원구",
			"1132" : "도봉구",
			"1123" : "동대문구",
			"1159" : "동작구",
			"1144" : "마포구",
			"1141" : "서대문구",
			"1165" : "서초구",
			"1120" : "성동구",
			"1129" : "성북구",
			"1171" : "송파구",
			"1147" : "양천구",
			"1156" : "영등포구",
			"1117" : "용산구",
			"1138" : "은평구",
			"1111" : "종로구",
			"1114" : "중구",
			"1126" : "중랑구",
			"1000":"서울 지역선택"
	};
	
	var sel2_1 = {
		      "" : "" 
		};
		         
		var sel2_2 = { // 강남구
				"1000":"서울 지역선택",
		      "9275" : "강남구청역_1",
		      "9276" : "강남구청역_2",
		      "9277" : "강남역_3",
		      "9278" : "강남역_4",
		      "9368" : "강남역_5",
		      "9279" : "논현역_1",
		      "9280" : "논현역_2",
		      "9283" : "대치역_1",
		      "9284" : "대치역_2",
		      "9285" : "도산공원사거리_1",
		      "9286" : "뱅뱅사거리_1",
		      "9287" : "뱅뱅사거리_2",
		      "9288" : "삼성역_1",
		      "9289" : "삼성역_2",
		      "9290" : "삼성역_3",
		      "9291" : "선릉역_1",
		      "9292" : "선릉역_2",
		      "9293" : "선릉역_3",
		      "9294" : "선릉역_4",
		      "9295" : "선정릉역_1",
		      "9296" : "선정릉역_2",
		      "9297" : "수서역",
		      "9298" : "신사동가로수길_1",
		      "9370" : "신사동사로수길_2",
		      "9371" : "신사동사로수길_3",
		      "9300" : "신사역_2",
		      "9301" : "압구정 로데오거리_1",
		      "9302" : "압구정 로데오거리_2",
		      "9303" : "압구정역",
		      "9304" : "양재역_2",
		      "9305" : "언주역_1",
		      "9306" : "언주역_2",
		      "9307" : "역삼역_1",
		      "9308" : "역삼역_2",
		      "9309" : "역삼역_3",
		      "9310" : "역삼역_4",
		      "9311" : "은마아파트 앞",
		      "9312" : "은마아파트입구사거리_1",
		      "9313" : "은마아파트입구사거리_2",
		      "9314" : "은마아파트입구사거리_3",
		      "9315" : "은마아파트입구사거리_4",
		      "9316" : "청담사거리_1",
		      "9317" : "청담사거리_2",
		      "9318" : "청담사거리_3",
		      "9319" : "청담역_1",
		      "9320" : "청담역_2",
		      "9322" : "포스코사거리_1",
		      "9323" : "포스코사거리_2",
		      "9324" : "포이사거리",
		      "9326" : "학동사거리_1",
		      "9327" : "학동사거리_2",
		      "9328" : "학동역_1",
		      "9329" : "학동역_2",
		      "9330" : "학동역_3",
		      "9331" : "학동역_4",
		      "9332" : "한티역"
		}
		var sel2_3 = { // 강동구
				"1000":"서울 지역선택",
		"9248" : "고덕역",
		"9249" : "길동역",
		"9250" : "둔촌동역",
		"9251" : "명일역",
		"9252" : "천호역_1",
		"9253" : "천호역_2"
		}

		var sel2_4 = { // 강북구
				"1000":"서울 지역선택",  
		"9374" : "미아사거리역_1",                                    
		"9375" : "수유역_1",                                          
		"9376" : "수유역_2",                                          
		"9377" : "수유역_3"                                    
		}

		var sel_5 = { // 강서구
		"1000":"서울 지역선택",
		"9210" : "강서구청",
		"9211" : "발산역",  
		"9212" : "송정역"  
		}

		var sel2_6 = { // 관안구
				"1000":"서울 지역선택",	
				"9333" : "대학동",
		    "9334" : "사당역_1",
		    "9336" : "서울대입구역_1",
		    "9337" : "서울대입구역_2",
		    "9372" : "서울대입구역_3",
		    "9338" : "신림역_1",
		    "9339" : "신림역_2",
		    "9340" : "신림역_3",
		    "9341" : "신림역_4"
		    
		}

		var sel2_7 = { // 광진구
				"1000":"서울 지역선택",	
				"9254" :"강변테크노마트",
		      "9255" :"건대입구역_1",
		      "9256" :"건대입구역_2",
		      "9257" :"구의역",
		      "9258" :"군자역",
		      "9259" :"어린이대공원_1",
		      "9260" :"어린이대공원_2"
		    
		}

		var sel2_8 = { // 구로구
		      
		   
				"1000":"서울 지역선택",		
				"9213" : "가리봉시장(구로디지털오거리)",                    
		    "9216" : "개봉동 현대아파트",                               
		    "9217" : "구로기계공구상_1",                                
		    "9218" : "구로기계공구상_2",                                
		    "9220" : "구로역",                                          
		    "9222" : "대림역",                                          
		    "9219" : "디지털단지오거리",                                
		    "9223" : "신도림역",                                        
		    "9224" : "오류동"                                          
		    
		}

		var sel2_9 = { // 금천구
				"1000":"서울 지역선택",	
				"9225" :  "가산디지털단지역_1", 
		    "9214" :  "가산디지털단지역_2", 
		    "9215" :  "가산디지털단지역_3", 
		    "9226" :  "독산1동",            
		    "9227" :  "시흥1동",            
		    "9228" :  "시흥3동",            
		    "9229" :  "시흥4동"            
		    

		}

		var sel2_10 = { // 노원구
		   
				"1000":"서울 지역선택",	
				"9378" : "노원역_1",                                       
		    "9379" : "노원역_2",                              
		    "9380" : "노원역_3",                              
		    "9381" : "등나무근린공원"                      
		}      
		      
		var sel2_11 = { //도봉구
		      
				"1000":"서울 지역선택",		
				"9382" : "창동역"
		    
		}

		var sel2_12 = { // 동대문구
				"1000":"서울 지역선택",		
				"9383" : "경동시장_1",   
		    "9384" : "경동시장_2",   
		    "9385" : "경희대학교",   
		    "9386" : "신설동역_1",   
		    "9393" : "신설동역_2",   
		    "9387" : "장안동사거리", 
		    "9394" : "장한평역_1",   
		    "9395" : "장한평역_2",   
		    "9388" : "청량리역"     
		      
		}
	
	var sel2_13 = {//동작구
				"1000":"서울 지역선택",		
				"9342": "노량진1동"     ,                  
			   "9343": "노량진역"      ,                  
			   "9344": "보라매공원"    ,                  
			   "9335": "사당역_2"      ,                  
			   "9345": "신대방삼거리역",                  
			   "9346": "총신대 앞"     ,                  
			   "9347": "총신대입구역_1"    
			
	}
	var sel2_14 = {//마포구
				"1000":"서울 지역선택",			
				"9138": "공덕역_1"       ,                                                                               
			  "9139": "공덕역_2"       ,    
			  "9140": "디지털미디어시티",   
			  "9141": "마포역_1"       ,                                                                        
			  "9142": "마포역_2"       ,                                                                        
			  "9144": "홍대입구역_1"   ,                                                                        
			  "9145": "홍대입구역_2"   ,                                                                        
			  "9146": "홍대입구역_3"   ,                                                                        
			  "9147": "홍익대학교"                                                                              
			
	}
	
	var sel2_15 = {//서대문구
				"1000":"서울 지역선택",		
				"9149": "서대문역_2",
			"9143": "신촌역_1",
			"9150": "신촌역_2",
			"9151": "이대역"
	}
	var sel2_16 = {//서초구
				"1000":"서울 지역선택",		
				"9348": "강남역_1"       , 
			   "9349": "강남역_2"       , 
			   "9373": "강남역_6"       , 
			   "9350": "고속터미널역"   , 
			   "9351": "교대역_1"       , 
			   "9352": "교대역_2"       , 
			   "9353": "교대역_3"       , 
			   "9354": "교대역_4"       , 
			   "9355": "남부터미널역_1" , 
			   "9356": "남부터미널역_2" , 
			   "9357": "남부터미널역_3" , 
			   "9281": "논현역_3"       , 
			   "9282": "논현역_4"       , 
			   "9358": "매봉역"         , 
			   "9359": "방배동카페골목" , 
			   "9360": "방배역"         , 
			   "9361": "뱅뱅사거리_3"   , 
			   "9362": "사당역"         , 
			   "9369": "서래마을"       , 
			   "9363": "서초역"         , 
			   "9299": "신사역_1"       , 
			   "9364": "양재 화물트럭터",  
			   "9366": "양재역_1"       , 
			   "9367": "양재역_3"       , 
			   "9325": "포이사거리_2"               
			
	}
	var sel2_17 = {//성동구
				"1000":"서울 지역선택",			
				"9261": "왕십리역_1",
			"9262": "왕십리역_2",
			"9263": "장안평 중고차시장골목",
			"9264": "한양시장"
	}
	var sel2_18 = {//성북구
				"1000":"서울 지역선택",		   
				"9389": "미아사거리"       ,    
		    "9390": "미아사거리역_2"   ,    
		    "9391": "성신여대입구역"   ,    
		    "9392": "안암역"                 
		    
			
	}
	var sel2_19 = {//송파구
				"1000":"서울 지역선택",			 
				"9267": "가락시장"         ,                                                                 
			   "9268": "가락시장역"       ,                                                                 
			   "9269": "문정역"           ,                                                                 
			   "9270": "방이동 먹자골목"  ,                                                                 
			   "9265": "석촌역"           ,                                                                 
			   "9271": "신천역"           ,                                                                 
			   "9272": "잠실역"           ,                                                                 
			   "9273": "잠실역 롯데월드"  ,                                                                 
			   "9274": "장지역"                                                                                 
			    
			
	}
	var sel2_20 = {//양천구
				"1000":"서울 지역선택",		
				"9221": "구로중앙유통단지"   , 
		    "9230": "등촌역"             , 
		    "9231": "목동 현대백화점"    , 
		    "9232": "목동사거리"         , 
		    "9233": "신정네거리역"       , 
		    "9234": "오목교역"     
			
	}
	var sel2_21 = {//영등포구
				"서울 지역선택":"서울 지역선택",			 
				"9235": "국회의사당역_1",                                                                                   
				  "9236": "국회의사당역2",                                                                                   
				  "9237": "당산역_1"    ,                                                                                   
				  "9238": "당산역_2"    ,                                                                                   
				  "9239": "문래동 주민센",                                                                                   
				  "9240": "여의도역_1"  ,                                                                                   
				  "9241": "여의도역_2"  ,                                                                                   
				  "9242": "영등포구청역",                                                                                   
				  "9243": "영등포시장역",                                                                                   
				  "9244": "영등포역_1"  ,                                                                                   
				  "9245": "영등포역_2"  ,                                                                                   
				  "9246": "영등포역_3"  ,                                                                                   
				  "9247": "영등포유통상가"   
			
	}
	var sel2_22 = {//용산구
				
				"9152": "숙대입구역"        ,
			   "9153": "신용산역"          ,
			   "9154": "용산 전자상가_1"   ,
			   "9155": "용산 전자상가_2"   ,
			   "9156": "용산 전자상가_3"   ,
			   "9157": "용산 전자상가_4"   ,
			   "9158": "용산 전자상가_5"   ,
			   "9159": "용산구청"          ,
			   "9160": "이태원역"          ,
			   "9161": "한남오거리"  ,
			   "1000":"서울 지역선택"	
			
	}
	var sel2_23 = {//은평구
			
				"9162": "불광역_1"   ,                     
		    "9163": "연신내역_1"  ,                     
		    "9164": "연신내역_2"  ,                      
		    "9165": "연신내역_3"  ,
		    	"1000":"서울 지역선택"
	}
	var sel2_24 = {//종로구
				
				"9166": "경복궁역_1"     ,                                                            
			  "9167": "경복궁역_2"     ,                                                            
			  "9168": "광화문역_1"     ,                                                            
			  "9169": "광화문역_2"     ,                                                            
			  "9170": "동대문시장_1"   ,                                                            
			  "9171": "동대문역_1"     ,                                                            
			  "9172": "동대문역_2"     ,                                                            
			  "9148": "서대문역_1"     ,                                                            
			  "9173": "안국역"         ,                                                            
			  "9174": "인사동"         ,                                                
			  "9175": "종각역"         ,                                                
			  "9176": "종각역 젊음의거",                                                
			  "9177": "종로3가역_1"    ,                                                
			  "9178": "종로3가역_2"    ,                                                
			  "9179": "종로3가역_3"    ,                                                            
			  "9180": "종로5가역_1"    ,                                                            
			  "9181": "종로5가역_2"    ,                                                            
			  "9182": "종로5가역_3"    ,                                                            
			  "9183": "종로5가역_4"    ,                                                            
			  "9184": "종로구청"       ,                                                            
			  "9186": "종묘앞_2"       ,                                                            
			  "9188": "혜화역 대학로_1"  ,                                                            
			  "9189": "혜화역 대학로_2"  ,                                                            
			  "9190": "혜화역 대학로_3"     ,                                                       
				  "1000":"서울 지역선택"
			
	}
	var sel2_25 = {//중구
					
				"9191": "남대문시장"        ,          
			   "9192": "동대문시장_2"      ,     
			   "9193": "동대문역사문화공원역" ,  
			   "9194": "롯데백화점 본점"   ,     
			   "9195": "명동"              ,          
			   "9196": "명동역"            ,          
			   "9197": "북창동"            ,          
			   "9198": "서울시청"          ,          
			   "9199": "시청역_1"          ,          
			   "9200": "시청역_2"          ,          
			   "9201": "신당역_1"          ,          
			   "9202": "신당역_2"          ,          
			   "9203": "약수역"            ,          
			   "9204": "을지로3가역_1"     ,          
			   "9205": "을지로3가역_2"     ,          
			   "9206": "을지로4가역"       ,          
			   "9207": "장충동 족발거리"   ,          
			   "9185": "종묘앞_1"          ,          
			   "9187": "종묘앞_3"          ,          
			   "9208": "충무로역_1"        ,          
			   "9209": "충무로역_2",
			   "1000":"서울 지역선택"		

			
	}
	var sel2_26= {//중랑구
				
				"9266": "사가정역",
					"서울 지역선택":"서울 지역선택"
			
	}
	
	
	   function retOption(mapArr, select){
    	var html = '';
    	var keys = Object.keys(mapArr);
    	for (var i in keys) {
    	    html += "<option value=" + "'" + keys[i] + "'>" + mapArr[keys[i]] + "</option>";
    	}
        
        $("select[id='" + select +"']").html(html);
   }
	
	 $("select[id='sel1']").on("change", function(){
	    	var option = $("#sel1 option:selected").val();
	        var subSelName = '';
	        if(option == "1168") {
	        	subSelName = "sel2_2";
	        } 
	        else if(option == "1168") {
	        	subSelName = "sel2_2";
	        } else if(option =="1174" ){
	        	subSelName = "sel2_3";
	        } else if(option =="1130" ){
	        	subSelName = "sel2_4";
	        } else if(option =="1150" ){
	        	subSelName = "sel2_5";
	        } else if(option =="1162" ){
	        	subSelName = "sel2_6";
	        } else if(option =="1121" ){
	        	subSelName = "sel2_7";
	        } else if(option =="1153" ){
	        	subSelName = "sel2_8";
	        } else if(option =="1154" ){
	        	subSelName = "sel2_9";
	        } else if(option =="1135" ){
	        	subSelName = "sel2_10";
	        } else if(option =="1132" ){
	        	subSelName = "sel2_11";
	        } else if(option =="1123" ){
	        	subSelName = "sel2_12";
	        } else if(option =="1159" ){
	        	subSelName = "sel2_13";
	        } else if(option =="1144" ){
	        	subSelName = "sel2_14";
	        } else if(option =="1141" ){
	        	subSelName = "sel2_15";
	        } else if(option =="1165" ){
	        	subSelName = "sel2_16";
	        } else if(option =="1120" ){
	        	subSelName = "sel2_17";
	        } else if(option =="1129" ){
	        	subSelName = "sel2_18";
	        } else if(option =="1171" ){
	        	subSelName = "sel2_19";
	        } else if(option =="1147" ){
	        	subSelName = "sel2_20";
	        } else if(option =="1156" ){
	        	subSelName = "sel2_21";
	        } else if(option =="1117" ){
	        	subSelName = "sel2_22";
	        } else if(option =="1138" ){
	        	subSelName = "sel2_23";
	        } else if(option =="1111" ){
	        	subSelName = "sel2_24";
	        } else if(option =="1114" ){
	        	subSelName = "sel2_25";
	        } else if(option =="1126" ){
	        	subSelName = "sel2_26";
	        } else{
	        	$("#sel2").hide();
	        	return;
	        }
	        $("#sel2").show();
	        retOption(eval(subSelName), "sel2");
	    })
	    retOption(sel1, "sel1");
});



	function selected() {
		//콤보박스에서 선택한 값 꺼내기
		var select =$("select[id=selectStatus]").val();
		$('#detailselectStatus').show();
		$('#detailselectStatus').children('option').remove();
			$.ajax({
				type : 'get',
				url : '/caa/rest/businessstatus/'+select,
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr){
					
						console.log("아작쓰 성공 : " + result);
						
						for(var i = 0; i<result.length; i++){
							console.log(result[i]);
							$('#detailselectStatus').append('<option value='+result[i].cs_code+'>'+result[i].cs_code_name+'</option>');
						}
						
						$("#detailselectStatus").show();
				},
				error : function(xhr,status, er){
					console.log("아작쓰 실패")
					if(error){
						error(re);
					}
				}
			})
			
			
			
		
	}
</script>
<!-- CSS Files -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/atlantis.css">

</head>
<body>
	<div class="wrapper fullheight-side sidebar_minimize">

		<div class="main-panel full-height">
			<div class="container">
				<div class="panel-header">
					<div class="page-inner border-bottom pb-0 mb-3">
						<div class="d-flex align-items-left flex-column">

							<div class="page-header">
								<h4 class="page-title">업소 현황</h4>
								<ul class="breadcrumbs">
									<li class="nav-home"><a href="#"> <i
											class="flaticon-home"></i>
									</a></li>
									<li class="separator"><i class="flaticon-right-arrow"></i></li>
									<li class="nav-item"><a href="#">Pages</a></li>
									<li class="separator"><i class="flaticon-right-arrow"></i></li>
									<li class="nav-item"><a href="#">Starter Page</a></li>
								</ul>
							</div>
						</div>
						<!-- 설명 부분 -->
						<div>
							<div class="col-md-12">
								<div class="card">
									<div class="card-body"
										style="background: rgba(195, 195, 195, 0.3)">
										<div class="form-group">
											업소현황이란? 행정동별로 기본적인 업종 업소수 정보를 통해 상권분석 전 예비정보로 활용할 수 있습니다.<br>
											업소현황 : 행정동별 업종별 업소수와 변화추이를 분석할 수 있습니다. 업소현황 데이터는 공단이 보유한 상가업소
											데이터*를 기반으로 구성하였사오니, 현황자료가 아닌 단순 참고자료로만 활용하시기 바랍니다 * 보도, 교육,
											연구 등의 목적으로 사용하는 경우, 통계청의 자료를 이용하시기 바랍니다. * (출처)
											행안부인허가정보+현장조사정보+국세청 일부 폐업정보 등 * (규모기준) 해당 자료는 소상공인의 창폐업을 의미하지
											않음(대규모 점포, 중소기업, 소기업, 소상공인 등 다양한 사업체 정보가 포함) * (산출기준) 행안부 인허가
											정보를 제외한 현장조사정보는 개폐업일이 아닌, 현장조사 시점으로 작성(하반기 8~10월 중)되었으며, 국세청
											폐업정보는 일부만 확인가능하여, 시계열분석이 불가함
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 설명 부분 -->


					</div>
				</div>
				<div class="page-inner">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<div class="form-group">
									<div class="selectgroup w-100">
										<label class="selectgroup-item"> <input type="radio"
											name="transportation" value="asdasd"
											class="selectgroup-input"> <span
											class="selectgroup-button selectgroup-button-icon"><i
												class="icon-screen-smartphone">행정구역</i></span>
										</label> <label id="selectStatus" class="selectgroup-item"> <input
											type="radio" name="transportation" value="1"
											class="selectgroup-input"> <span
											class="selectgroup-button selectgroup-button-icon"> <i
												class="icon-screen-tablet"> 주요상권</i></span>
										</label> <select id="sel1" name="sel1"
											class="form-control form-control-sm">

										</select> <select name="sel2" id="sel2" style="display: none"
											class="form-control form-control-sm" id="selectStatus">

										</select> <label id="selectStatus" class="selectgroup-item"
											style="padding-left: 10px"> <input type="radio"
											name="value" value="50" class="selectgroup-input"
											checked="checked"> <span class="selectgroup-button">상권업종</span>
										</label> 
										<select class="form-control form-control-sm" onchange="selected()" id="selectStatus">
											<c:forEach items="${firstDiv }" var="first">
												<option value="${first.cs_code }" >${first.cs_code_name } </option>
											</c:forEach>
										</select>
										<select class="form-control form-control-sm"  id="detailselectStatus" style="display: none" >
											
										</select>

										<button class="btn btn-primary btn-s" id="selectStatus">현황보기
										</button>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div id="basic-datatables_wrapper"
										class="dataTables_wrapper container-fluid dt-bootstrap4">
										<div class="row">
											<div class="col-sm-12">
												<table id="basic-datatables"
													class="display table table-striped table-hover dataTable"
													role="grid" aria-describedby="basic-datatables_info">
													<thead>
														<tr role="row">
															<th class="sorting_asc" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-sort="ascending"
																aria-label="Name: activate to sort column descending"
																style="width: 76px;">행정구역</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Position: activate to sort column ascending"
																style="width: 96px;">2019년 상반기</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Office: activate to sort column ascending"
																style="width: 70px;">2019년 하반기</th>
															<th class="sorting" tabindex="0"
																aria-controls="basic-datatables" rowspan="1" colspan="1"
																aria-label="Age: activate to sort column ascending"
																style="width: 27px;">증감률</th>

														</tr>
													</thead>

													<tbody>
														<tr role="row" class="odd">
															<td class="sorting_1">Airi Satou</td>
															<td>Accountant</td>
															<td>Tokyo</td>
															<td>33</td>

														</tr>
														<tr role="row" class="odd">
															<td class="sorting_1">Airi Satou</td>
															<td>Accountant</td>
															<td>Tokyo</td>
															<td>33</td>

														</tr>
														<tr role="row" class="odd">
															<td class="sorting_1">Airi Satou</td>
															<td>Accountant</td>
															<td>Tokyo</td>
															<td>33</td>

														</tr>

													</tbody>
												</table>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12 col-md-5"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>

	</div>

	<!--   Core JS Files   -->
	<script src="/resources/assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="/resources/assets/js/core/popper.min.js"></script>
	<script src="/resources/assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script
		src="/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<!-- Bootstrap Toggle -->
	<script
		src="/resources/assets/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
	<!-- jQuery Scrollbar -->
	<script
		src="/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="/resources/assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Atlantis JS -->
	<script src="/resources/assets/js/atlantis.min.js"></script>

	<script>
		$(document)
				.ready(
						function() {
							$('#basic-datatables').DataTable({});

							$('#multi-filter-select')
									.DataTable(
											{
												"pageLength" : 5,
												initComplete : function() {
													this
															.api()
															.columns()
															.every(
																	function() {
																		var column = this;
																		var select = $(
																				'<select class="form-control"><option value=""></option></select>')
																				.appendTo(
																						$(
																								column
																										.footer())
																								.empty())
																				.on(
																						'change',
																						function() {
																							var val = $.fn.dataTable.util
																									.escapeRegex($(
																											this)
																											.val());

																							column
																									.search(
																											val ? '^'
																													+ val
																													+ '$'
																													: '',
																											true,
																											false)
																									.draw();
																						});

																		column
																				.data()
																				.unique()
																				.sort()
																				.each(
																						function(
																								d,
																								j) {
																							select
																									.append('<option value="'+d+'">'
																											+ d
																											+ '</option>')
																						});
																	});
												}
											});

						});
	</script>
</body>
</html>