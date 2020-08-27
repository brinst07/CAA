package kr.or.ddit.caa.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
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
	private CAAService serivce;
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
		return new ResponseEntity<List<CscodeVO>>(serivce.otherCscodeList(keyword), HttpStatus.OK);
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
	public void sector(@RequestBody SectorJsonVo sectorJsonVo) {
		String ServiceKey = "21SOlCjmfqUliASu82VGE2%2FXQ1uFeVzXzPQ7egYRvgT7cKF1cBdfAONRgbHRnpHFgtd3NlHgCOj2kblMeWg6iQ%3D%3D";
		System.out.println("secotrJsonVo : " + sectorJsonVo);
		String url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeZoneInRadius?radius=" + sectorJsonVo.getRadius() + "&cx=" + sectorJsonVo.getCx()
				+ "&cy=" + sectorJsonVo.getCy() + "&ServiceKey=" + ServiceKey + "&type=json";
		HttpClient httpClient = new DefaultHttpClient();
		ResponseHandler<String> responseHandler = new BasicResponseHandler();

		HttpGet httpGet = new HttpGet();
		SectorParamVO vo = null;
		try {
			vo = new SectorParamVO();
			vo.setStoreList(sectorJsonVo.getSectors());
			httpGet.setURI(new URI(url));
			String responseBody = httpClient.execute(httpGet, responseHandler);

			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Map<String, List<Map<String, Object>>>> list = objectMapper.readValue(responseBody,
					new TypeReference<Map<String, Map<String, Object>>>() {
					});
			List<Map<String, Object>> finalList = list.get("body").get("items");
			List<List<StoreVO>> store = new ArrayList<List<StoreVO>>();
			// 중분류 대분류별 추이
			
			for (int i = 0; i < finalList.size(); i++) {
				vo.setStore_cs_code_name((String) finalList.get(i).get("mainTrarNm"));
				List<StoreVO> storeMiddle = serivce.getStoreList(vo);
				store.add(storeMiddle);
				
				//상권번호
				log.info(finalList.get(i).get("trarNo"));
				
				url = "http://apis.data.go.kr/B553077/api/open/sdsc/storeListInArea?key="+finalList.get(i).get("trarNo")+"&ServiceKey="+ServiceKey+"&type=json";
				httpGet.setURI(new URI(url));
				responseBody = httpClient.execute(httpGet, responseHandler);
				Map<String, Map<String, List<Map<String, Object>>>> ubso = objectMapper.readValue(responseBody,
						new TypeReference<Map<String, Map<String, Object>>>() {
						});
				
				log.info(ubso);
			}
			
			
			
			
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
