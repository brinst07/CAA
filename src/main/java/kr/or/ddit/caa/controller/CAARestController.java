package kr.or.ddit.caa.controller;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SectorJsonVo;
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

	@GetMapping(value = "/div/{keyword}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CscodeVO>> otherCscodeList(@PathVariable("keyword") String keyword) {
		log.info("ajax를 통한 분류 선택");

		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		return new ResponseEntity<List<CscodeVO>>(service.otherCscodeList(keyword), HttpStatus.OK);
	}

	@GetMapping(value = "/businessstatus/{select}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CscodeVO>> detailCscodeList(@PathVariable("select") String select) {

		log.info("ajaxController");

		return new ResponseEntity<List<CscodeVO>>(bsservice.select(select), HttpStatus.OK);

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
	@PostMapping(value = "/sector", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> sector(@RequestBody SectorJsonVo sectorJsonVo) {

		List<Map<String, String>> jsonMapList = sectorJsonVo.getJsonMapList();
		// 영역의 업종 추이를 관리하는 리스트 생성
		List<List<StoreVO>> totalStore = new ArrayList<>();

		// 분류별 데이터를 넣을 List를 생성한다.
		List<Map<String, String>> ubsoList = new ArrayList<Map<String, String>>();

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
			SectorParamVO vo = null;

			try {
				vo = new SectorParamVO();

				// Mybatis foreach를 돌리기 위해 list 통채로 삽입한다.
				vo.setStoreList(sectorJsonVo.getSectors());

				// 업종코드를 전달하기 위해 DB에서 코드를 추출한다.
				List<Map<String, String>> sectorFind = sectorJsonVo.getSectors();
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
					for (int k = 0; k < sectorList.size(); k++) {
						// 분류별 2차 배열

						for (Map.Entry<String, String> entry : sectorList.get(j).entrySet()) {
							String div = "";
							String temp = "";
							if (entry.getKey().equals("large")) {
								div = "&indsLclsCd=" + entry.getValue();
							} else if (entry.getKey().equals("middle")) {
								div = "&indsMclsCd=" + entry.getValue();
							} else {
								div = "&indsSclsCd=" + entry.getValue();
							}
							temp = entry.getKey();
							url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInArea?key="
									+ finalList.get(i).get("trarNo") + "&ServiceKey=" + ServiceKey + "&type=json" + div;
							httpGet.setURI(new URI(url));
							responseBody = httpClient.execute(httpGet, responseHandler);
							Map<String, Map<String, List<Map<String, Object>>>> ubso = objectMapper
									.readValue(responseBody, new TypeReference<Map<String, Map<String, Object>>>() {
									});

							int ubsoCount = ubso.get("body").get("items").size();

							if (temp.equals("large")) {
								large += ubsoCount;
							} else if (temp.equals("middle")) {
								middle += ubsoCount;
							} else if (temp.equals("small")) {
								small += ubsoCount;
							}

							/*
							 * ubsoMap.put(temp, ubso.get("body").get("items").size())); // 선택한 현재 상권의 대, 중,
							 * 소 분류별로 조회해서 저장. ubsoList.add(ubsoMap);
							 */
						}

					}
				}
				// 위에서 구한 현재 선택한 영역의 대, 중, 소 분류별로 조회해서 숫자를 더해 저장한 값들을 map에 넣는다.
				Map<String, String> ubso = new HashMap<>();
				ubso.put("large", Integer.toString(large));
				ubso.put("middle", Integer.toString(middle));
				ubso.put("small", Integer.toString(small));

				// 관리에 용이하도록 List에 넣는다.
				ubsoList.add(ubso);

				// DB에서 상권이름 그리고 분류로 select를 하기 위해서 VO에 저장하는 과정을 거친다.
				vo.setStore_cs_code_name(scName);

				List<StoreVO> storeList = service.getStoreList(vo);

				totalStore.add(storeList);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// JSP단으로 전달을 위해 Map에 넣어서 전달한다.
		totalMap.put("totalStore", totalStore);
		totalMap.put("ubsoList", ubsoList);
		return new ResponseEntity<Map<String, Object>>(totalMap, HttpStatus.OK);
	}

	// 매출분석
	// JSON을 보낼때는 @ReqeustBody로 받아야함
	// JSON은 HTML의 Body의 문자열로 저장되어 전송되는데 그걸 받겠다는 게 ReqeustBody
	@PostMapping(value = "/sales", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<List<List<List<SalesByIndustryVO>>>>> sales(@RequestBody SectorJsonVo sectorJsonVo) {

		List<List<String>> storeNameList = new ArrayList<List<String>>();
		List<String> storeSerNameList = new ArrayList<String>();

		// 사용자가 지정한 업소 종류를 리스트에 담는다.
		for (int i = 0; i < sectorJsonVo.getSectors().size(); i++) {
			Map<String, String> jsonSectors = sectorJsonVo.getSectors().get(i);
			System.out.println(jsonSectors);
			storeSerNameList.add(jsonSectors.get("middle"));
		}

		List<Map<String, String>> jsonMapList = sectorJsonVo.getJsonMapList();

		// 영역의 업종 추이를 관리하는 리스트 생성
		List<List<StoreVO>> totalStore = new ArrayList<>();

		// 분류별 데이터를 넣을 List를 생성한다.
		List<Map<String, String>> ubsoList = new ArrayList<Map<String, String>>();

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
			SectorParamVO vo = null;

			try {
				vo = new SectorParamVO();

				// Mybatis foreach를 돌리기 위해 list 통채로 삽입한다.
				vo.setStoreList(sectorJsonVo.getSectors());

				// 업종코드를 전달하기 위해 DB에서 코드를 추출한다.
				List<Map<String, String>> sectorFind = sectorJsonVo.getSectors();
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

				}
				storeNameList.add(scName);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		System.out.println("상권정보 : " + storeNameList);
		System.out.println("업소정보: " + storeSerNameList);

		List<List<List<List<SalesByIndustryVO>>>> totalResultList = new ArrayList<List<List<List<SalesByIndustryVO>>>>();
		// 1. 상권정보 리스트에서 하나 불러온다.
		for (int i = 0; i < storeNameList.size(); i++) {
			// 각 구역에서 업소정보와 상권정보를 가지고 List 출력
			// 1-1. 불러온 리스트가 비어있는지 확인한다.
			List<List<List<SalesByIndustryVO>>> sanggunList = new ArrayList<List<List<SalesByIndustryVO>>>();
			for (int j = 0; j < storeNameList.get(i).size(); j++) {
				List<List<SalesByIndustryVO>> upjongList = new ArrayList<List<SalesByIndustryVO>>();
				Map<String, String> param = new HashMap<String, String>();
				param.put("storeName", storeNameList.get(i).get(j));
				for(int k=0; k<storeSerNameList.size();k++) {
					param.put("serName",storeSerNameList.get(k));
					upjongList.add( service.SalesByIndustryList(param));
				}
				sanggunList.add(upjongList);
			}
			totalResultList.add(sanggunList);
		}
		//

		// JSP단으로 전달을 위해 Map에 넣어서 전달한다.
		return new ResponseEntity<List<List<List<List<SalesByIndustryVO>>>>>(totalResultList, HttpStatus.OK);
	}

}