package kr.or.ddit.caa.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.*;
import kr.or.ddit.caa.service.CAAService;
import kr.or.ddit.sales.domain.SigunguVO;
import kr.or.ddit.sales.service.SalesService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.ibatis.annotations.Param;
import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.IndiVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SalesJsonVO;
import kr.or.ddit.caa.domain.SalesParamVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;
import kr.or.ddit.caa.service.CAAService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/caa/rest/*")
@Log4j
@AllArgsConstructor
public class CAARestController {
	@Autowired
	private CAAService service;
	@Autowired
	private BSService bsservice;
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private SalesService salesservice;
	
//	@GetMapping(value = "/div/{cs_code}",
//			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
//	public ResponseEntity<List<CscodeVO>> csCodeList(@PathVariable("cs_code") String cs_code){
//
//		
//		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
//		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
//		List<CscodeVO> list = salesservice.getCscodeList2(cs_code);
//		
//
//		return new ResponseEntity<List<CscodeVO>>(list, HttpStatus.OK);
//	}
	
	@GetMapping(value = "/div/{keyword}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CscodeVO>> otherCscodeList(@PathVariable("keyword") String keyword) {
		log.info("ajax를 통한 분류 선택");
		log.info(service.otherCscodeList(keyword));
		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		return new ResponseEntity<List<CscodeVO>>(service.otherCscodeList(keyword), HttpStatus.OK);
	}
	
	@GetMapping(value = "/sido/{keyword}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<SigunguVO>> sidoCscodeList(@PathVariable("keyword") String keyword) {
		log.info("ajax를 통한 분류 선택");
		
		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		return new ResponseEntity<List<SigunguVO>>(service.getSigungucodeList(keyword), HttpStatus.OK);
	}

	@GetMapping(value = "/businessstatus/{upjong}/{detailupjong}/{sigungu}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<String>> detailCscodeList(@PathVariable("upjong") String upjong,@PathVariable("detailupjong") String detailupjong,@PathVariable("sigungu") String sigungu) {
		
		log.info("ajaxController");

		return new ResponseEntity<List<String>>(bsservice.select(), HttpStatus.OK);

	}

	// 메일
	@GetMapping(value = "/sendMail/{clientemail}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<String> sendMail(@PathVariable("clientemail") String clientemail) {
		log.info("ajaxController");
		log.info("고객 이메일 정보 : " + clientemail);

		String from = "chawanho9@gmail.com";
		String to = "jyh6842@naver.com";
		String subject = clientemail;
		String contents = "고객님이 요청하신 아이디는+ + 입니다.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(from); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(to); // 받는사람 이메일
			messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
			messageHelper.setText(contents); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return new ResponseEntity<>(HttpStatus.OK);

	}

    // 업종분석
    // JSON을 보낼때는 @ReqeustBody로 받아야함
    // JSON은 HTML의 Body의 문자열로 저장되어 전송되는데 그걸 받겠다는 게 ReqeustBody
    @PostMapping(value = "/sector", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Map<String, Object>> sector(@RequestBody SalesJsonVO salesJsonVO) {
        //도형의 정보가 있는 리스트
        List<Map<String, String>> jsonMapList = salesJsonVO.getJsonMapList();
        //업종의 정보가 들어있는 리스트
        List<Map<String, String>> sectorList = salesJsonVO.getSectors();

        //JSP단으로 보낼 MAP을 생성한다.
        Map<String, Object> totalList = new HashMap<>();

        //ServiceKey
        String ServiceKey = "21SOlCjmfqUliASu82VGE2%2FXQ1uFeVzXzPQ7egYRvgT7cKF1cBdfAONRgbHRnpHFgtd3NlHgCOj2kblMeWg6iQ%3D%3D";


        // 선택한 영역의 개수만큼 for문이 돌아간다.
        for (int i = 0; i < jsonMapList.size(); i++) {

            String url = "";

            if (jsonMapList.get(i).get("type").equals("circle")) {
                url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRadius?radius="
                        + jsonMapList.get(i).get("radius") + "&cx=" + jsonMapList.get(i).get("cx") + "&cy="
                        + jsonMapList.get(i).get("cy") + "&ServiceKey=" + ServiceKey + "&type=json";
            } else if (jsonMapList.get(i).get("type").equals("rectangle")) {
                url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRectangle?" +
                        "minx=" + jsonMapList.get(i).get("minx") + "&miny=" + jsonMapList.get(i).get("miny") + "&maxx="
                        + jsonMapList.get(i).get("maxx") + "&maxy=" + jsonMapList.get(i).get("maxy") + "&ServiceKey=" + ServiceKey + "&type=json";
            }

            HttpClient httpClient = new DefaultHttpClient();
            ResponseHandler<String> responseHandler = new BasicResponseHandler();
            HttpGet httpGet = new HttpGet();

            // DB에 파라미터로 넣을 VO 생성
            SectorParamVO vo = null;

            try {
                vo = new SectorParamVO();

                // Mybatis foreach를 돌리기 위해 list 통채로 삽입한다.
                vo.setStoreList(salesJsonVO.getSectors());

//                // 업종코드를 전달하기 위해 DB에서 코드를 추출한다.
//                List<Map<String, String>> sectorFind = salesJsonVO.getSectors();
//                List<Map<String, String>> sectorList = service.getSectorCode(sectorFind);

                httpGet.setURI(new URI(url));
                String responseBody = httpClient.execute(httpGet, responseHandler);

                ObjectMapper objectMapper = new ObjectMapper();

                // Jsp에서 가져온 도형의 정보를 RestAPI로 보내서 정보를 java형식으로 mapping하여 받는 부분
                Map<String, Map<String, List<Map<String, Object>>>> list = objectMapper.readValue(responseBody,
                        new TypeReference<Map<String, Map<String, Object>>>() {
                        });

                // 선택한 영역의 데이터 전처리 후 필요한 데이터만을 저장하는 list
                List<Map<String, Object>> finalList = list.get("body").get("items");

                List<List<StoreVO>> store = new ArrayList<List<StoreVO>>();

                // 하단에서 분류별 숫자를 체크하기 위해 변수를 선언해준다.
                int count = 0;

                // 선택한 업종별 리스트를 저장하기 위한 리스트
                List<Object> storeCountList = new ArrayList<>();

                // 영역안에있는 상권의  업소개수를 모두 끌어오기 위해서 업소로 for문을 돌아야함
                //업소의 선택 개수만큼 for문이 돈다.
                for (int k = 0; k < sectorList.size(); k++) {
                    StoreCountVO storeCountVO = new StoreCountVO();
                    //sectorList에서 상권이름을 꺼내 vo에 저장한다.
                    storeCountVO.setSector(sectorList.get(k).get("middle"));

                    List<String> scName = new ArrayList<>();

                    for (int j = 0; j < finalList.size(); j++) {
                        // 상권의 이름을 추출한다.
                        String trarNm = (String) finalList.get(j).get("mainTrarNm");
                        //리스트에 상권들을 저장한다.
                        scName.add(trarNm);
                    }

                    // 상권데이터가 존재하지 않을 경우 판별해주는 식
                    if(scName != null) {
                        //상권리스트를 vo에 넣는다.
                        storeCountVO.setTrarNm(scName);
                        //DB에서 정보를 가져온다.
                        storeCountList.add(service.getStoreCount(storeCountVO));
                    }

                }
                //영역의 이름과 LIST를 MAP에 넣는다.
                totalList.put(jsonMapList.get(i).get("name"), storeCountList);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }


        return new ResponseEntity<Map<String, Object>>(totalList, HttpStatus.OK);
    }

    // 매출분석
    // JSON을 보낼때는 @ReqeustBody로 받아야함
    // JSON은 HTML의 Body의 문자열로 저장되어 전송되는데 그걸 받겠다는 게 ReqeustBody
    @PostMapping(value = "/sales", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Map<String, Object>> sales(@RequestBody SalesJsonVO salesJsonVO) {

        List<Map<String, String>> jsonMapList = salesJsonVO.getJsonMapList();
        // 영역의 업종 추이를 관리하는 리스트 생성
        List<List<SalesByIndustryVO>> totalStore = new ArrayList<>();

        // 분류별 데이터를 넣을 List를 생성한다.
        List<Map<String, String>> ubsoList = new ArrayList<Map<String, String>>();
        List<List<String>> totalscName = new ArrayList<List<String>>();

        // 모든 정보를 넣을 리스트를 생성한다.
        Map<String, Object> totalMap = new HashMap<String, Object>();

        // 선택한 영역의 개수만큼 for문이 돌아간다.
        for (int i = 0; i < jsonMapList.size(); i++) {
            String ServiceKey = "21SOlCjmfqUliASu82VGE2%2FXQ1uFeVzXzPQ7egYRvgT7cKF1cBdfAONRgbHRnpHFgtd3NlHgCOj2kblMeWg6iQ%3D%3D";
            String url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRadius?radius="
                    + jsonMapList.get(i).get("radius") + "&cx=" + jsonMapList.get(i).get("cx") + "&cy="
                    + jsonMapList.get(i).get("cy") + "&ServiceKey=" + ServiceKey + "&type=json";

            HttpClient httpClient = new DefaultHttpClient();
            ResponseHandler<String> responseHandler = new BasicResponseHandler();
            HttpGet httpGet = new HttpGet();

            // DB에 파라미터로 넣을 VO 생성
            SalesParamVO vo = null;

            try {
                vo = new SalesParamVO();
                vo.setBungi(salesJsonVO.getBungi());
                // Mybatis foreach를 돌리기 위해 list 통채로 삽입한다.
                vo.setStoreList(salesJsonVO.getSectors());

                // 업종코드를 전달하기 위해 DB에서 코드를 추출한다.
                List<Map<String, String>> sectorFind = salesJsonVO.getSectors();
                List<Map<String, String>> sectorList = service.getSectorCode(sectorFind);

                httpGet.setURI(new URI(url));
                String responseBody = httpClient.execute(httpGet, responseHandler);

                ObjectMapper objectMapper = new ObjectMapper();

                // Jsp에서 가져온 도형의 정보를 RestAPI로 보내서 정보를 java형식으로 mapping하여 받는 부분
                Map<String, Map<String, List<Map<String, Object>>>> list = objectMapper.readValue(responseBody,
                        new TypeReference<Map<String, Map<String, Object>>>() {
                        });

                // 선택한 영역의 데이터 전처리 후 필요한 데이터만을 저장하는 list
                List<Map<String, Object>> finalList = list.get("body").get("items");

                List<List<StoreVO>> store = new ArrayList<List<StoreVO>>();

                // 상권이름을 저장하기 위한 배열을 선언한다.
                List<String> scName = new ArrayList();
                // 하단에서 분류별 숫자를 체크하기 위해 변수를 선언해준다.
                int large = 0, middle = 0, small = 0;

                // 선택한 영역 안의 상권의 개수만큼 for문이 돌아감
                for (int j = 0; j < finalList.size(); j++) {

                    // 선택한 영역에는 여러가지 상권이 존재하기 때문에 먼저 배열에 상권이름을 저장한다.
                    scName.add((String) finalList.get(j).get("mainTrarNm"));

                    // for문으로 분류 선택 개수에 다르게 조회하게 로직 구성
                    // 상권번호를 통해서 상권내 상가업소 조회
//					for (int k = 0; k < sectorList.size(); k++) {
//						// 분류별 2차 배열
//
//						for (Map.Entry<String, String> entry : sectorList.get(k).entrySet()) {
//							String div = "";
//							String temp = "";
//							if (entry.getKey().equals("large")) {
//								div = "&indsLclsCd=" + entry.getValue();
//							} else if (entry.getKey().equals("middle")) {
//								div = "&indsMclsCd=" + entry.getValue();
//							} else {
//								div = "&indsSclsCd=" + entry.getValue();
//							}
//							temp = entry.getKey();
//							url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInArea?key="
//									+ finalList.get(i).get("trarNo") + "&ServiceKey=" + ServiceKey + "&type=json" + div;
//							httpGet.setURI(new URI(url));
//							responseBody = httpClient.execute(httpGet, responseHandler);
//							Map<String, Map<String, List<Map<String, Object>>>> ubso = objectMapper
//									.readValue(responseBody, new TypeReference<Map<String, Map<String, Object>>>() {
//									});
//
//							int ubsoCount = ubso.get("body").get("items").size();
//
//							if (temp.equals("large")) {
//								large += ubsoCount;
//							} else if (temp.equals("middle")) {
//								middle += ubsoCount;
//							} else if (temp.equals("small")) {
//								small += ubsoCount;
//							}
//
//							/*
//							 * ubsoMap.put(temp, ubso.get("body").get("items").size())); // 선택한 현재 상권의 대, 중,
//							 * 소 분류별로 조회해서 저장. ubsoList.add(ubsoMap);
//							 */
//						}
//
//					}
					totalscName.add(scName);
				}
//				// 위에서 구한 현재 선택한 영역의 대, 중, 소 분류별로 조회해서 숫자를 더해 저장한 값들을 map에 넣는다.
//				Map<String, String> ubso = new HashMap<>();
//				ubso.put("large", Integer.toString(large));
//				ubso.put("middle", Integer.toString(middle));
//				ubso.put("small", Integer.toString(small));
//
//				// 관리에 용이하도록 List에 넣는다.
//				ubsoList.add(ubso);
				List<SalesByIndustryVO> storeList = null;
				// DB에서 상권이름 그리고 분류로 select를 하기 위해서 VO에 저장하는 과정을 거친다.
				if(scName.size() != 0) {
					vo.setStore_cs_code_name(scName);
					storeList = service.SalesByIndustryList(vo);
				}
				totalStore.add(storeList);
				

			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// JSP단으로 전달을 위해 Map에 넣어서 전달한다.
				totalMap.put("totalStore", totalStore);
//				totalMap.put("ubsoList", ubsoList);
				return new ResponseEntity<Map<String, Object>>(totalMap, HttpStatus.OK);
	}


   @GetMapping(value = "/main/{var}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
   public ResponseEntity<List<IndiVO>> indiList(@PathVariable("var")String var){

      List<IndiVO> list = service.getIndiList(var);

      return new ResponseEntity<List<IndiVO>>(list,HttpStatus.OK);
   }
}