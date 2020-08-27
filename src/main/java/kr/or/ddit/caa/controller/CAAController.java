package kr.or.ddit.caa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.service.CAAService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/caa/*")
@Log4j
public class CAAController {
	
	@Setter(onMethod_ = @Autowired)
	private CAAService service;
	private BSService bsservice;
	
	@GetMapping("/caaSelect")
	public String caaSelect(Model model) {
		
		List<CscodeVO> list = service.getCscodeList("1");
		
		model.addAttribute("firstDiv", list);
		
		return "caa/caa/selectPage";
	}
	
	@GetMapping("/businessstatus")
	public String businessstatus(Model model) {
		
		List<CscodeVO> list = service.getCscodeList("1");
		
		model.addAttribute("firstDiv", list);
		
		return "caa/businessStatus/BusinessStatus";
	}
	

	@GetMapping(value = "/middle", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	public String getMiddel() {
		
		log.info("a");
		
		return "";
	}
	


//	
//	//업종분석
//	@GetMapping("/industryanalysis")
//	public String industryanalysis() {
//		return "caa/caa/IndustryAnalysis";
//	}
	
	//매출분석
	@GetMapping("/saleanalysis")
	public String caaSale(Map map, Model model) {
		List<SalesByIndustryVO> list = service.SalesByIndustryList(map);
		model.addAttribute("list",list);
		return "caa/caa/SalesAnalysis";
	}

	
	//cctv
	@GetMapping("/CCTVAnalysis")
	public String cctv() {
		return "caa/cctv/CCTVAnalysis";
	}
	
	/* 영현  */

	/* ↓ 상권 추천 영현 */
	@GetMapping("iRecommendationMap")
	public String iRecommendationMap() {
		return "caa/ir/iRecommendationMap";
	}
	
	@GetMapping("/iRecommendation")
	public String IRtest() {
		return "caa/ir/iRecommendation";
	}

	@GetMapping("/iRecommendation2")
	public String IRtest2() {
		return "caa/ir/iRecommendation2";
	}

	@GetMapping("/iRecommendation3")
	public String IRtest3() {
		return "caa/ir/iRecommendation3";
	}
	
	/* ↑ 상권 추천 */


	
	
	
	/* ↓ 상권 분석 */
	

	
	@PostMapping(value = "/caaAnalysis")
	public String CAAAnalysis(String sector,String jsonDATA, Model model,HttpSession session) {
		log.info("상권분석 화면 전환을 위한 메소드 Pot");

		Gson gson = new Gson();
		
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			List<Map<String, Object>> jsonMapList = objectMapper.readValue(jsonDATA, new TypeReference<List<Map<String, Object>>>() {});
			String json = gson.toJson(jsonMapList);
//			model.addAttribute("jsonMapList", jsonMapList);
			session.setAttribute("jsonMapList", json);
			log.info(json);
			log.info(sector);
			List<Map<String, String>> sectorList = objectMapper.readValue(sector, new TypeReference<List<Map<String,String>>>() {});
			String sectorJson = gson.toJson(sectorList); 
			log.info(sectorJson);
			session.setAttribute("sector", sectorJson);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "caa/caa/CommercialAnalysis";
	}
	
	@GetMapping(value = "/caaAnalysis")
	public void CAAAnalysis() {
		
		log.info("get test");
		
	}
	
	
	/* ↑ 상권 분석 */
	
	//상권분석
	@GetMapping("/commercialanalysis")
	public String commercialAnalysis() {
		return "caa/caa/CommercialAnalysis";
	}
	
	//업종분석
	@GetMapping("/industryanalysis")
	public String industryanalysis() {
		return "caa/caa/IndustryAnalysis";
	}
	
	//매출분석
	@GetMapping("/SaleAnalysis")
	public String caaSale() {
		return "caa/caa/SalesAnalysis";
	}
	
	/* 전영현 ↓ */
	//인구분석
	@GetMapping("PopAnalysis")
	public String PopAnalysis(Model model, HttpSession session) {
		List<Map<String, String>> popListMap = service.getSubwayPop();
		model.addAttribute("popListMap", popListMap);
		
		log.info("session의 jsonMapList값보기");
		log.info(session.getAttribute("jsonMapList"));
		
		String stringJava = (String) session.getAttribute("jsonMapList");
		String sectorJson = (String) session.getAttribute("sector");
		
		JsonParser jsonParser = new JsonParser();
		
		
		JsonArray jsonArray = (JsonArray) jsonParser.parse(stringJava);
		JsonArray jsonArray2 = (JsonArray) jsonParser.parse(sectorJson);
		
		System.out.println(jsonArray);
		System.out.println(jsonArray2);
		
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject jsonObject = (JsonObject) jsonArray.get(i);
			System.out.println(jsonObject.get("name"));
		}
		
		for (int i = 0; i < jsonArray2.size(); i++) {
			JsonObject jsonObject = (JsonObject) jsonArray2.get(i);
			System.out.println(jsonObject.get("large"));
			
		}

	
		
//		ObjectMapper objectMapper = new ObjectMapper();
//		objectMapper.readValue(src, objectMapper.readValue(session.getAttribute("jsonMapList"), new TypeReference<List<Map<String, Object>>>() {});)
		
		
//		List<Map<String, Object>> jsonMapList = (List<Map<String, Object>>) session.getAttribute("jsonMapList");
		
		
//		log.info("List에서 꺼내기");
//		Map<String, String> jsonMap = jsonMapList.get(0);
//		log.info(jsonMap.get("name"));
		
		return "caa/caa/popAnalysis";
	}
	/* 전영현 ↑ */
	



//	창수
	
	@GetMapping("/JoinMember")
	public String JoinMember() {
		return "caa/member/JoinMember";
	}
	
	@GetMapping("/modifyMember")
	public String modifyMember() {
		return "caa/member/modifyMember";
	}
	

	@GetMapping("/noticeList")
	public String noticeList() {
		return "caa/notice/noticeList";
	}
	
	@GetMapping("/noticeView")
	public String noticeView() {
		return "caa/notice/noticeView";
	}
	
	@GetMapping("/modifyNotice")
	public String modifyNotice() {
		return "caa/notice/modifyNotice";
	}
	
	@GetMapping("/notificationService")
	public String notificationService() {
		return "caa/notificationInformation/notificationService";
	}

	
	/* ↓ sns */
	@GetMapping("snsAnalysis")
	public String snsAnalysis() {
		return "caa/sns/snsAnalysisFirst";
	}
	/* ↑ sns */
	
	

	//차완호
	@GetMapping("/searchMember")
	public String searchMember() {
		
		return "caa/member/SearchIDMember";
	}
	
	@GetMapping("/searchID")
	public String searchID() {
		
		
		
		return "caa/member/SearchIDMember";
	}
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
