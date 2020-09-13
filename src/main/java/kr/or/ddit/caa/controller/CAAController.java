package kr.or.ddit.caa.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonParser;

import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SubwayPopVO;
import kr.or.ddit.caa.service.CAAService;
import kr.or.ddit.sales.service.SalesService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/caa/*")
@Log4j
@AllArgsConstructor
public class CAAController {
	

	private CAAService service;
	private BSService bsservice;
	private SalesService salesservice;


	@GetMapping("/caaSelect")
	public String caaSelect(Model model) {

		List<CscodeVO> list = service.getCscodeList("1");

		model.addAttribute("firstDiv", list);

		return "caa/caa/selectPage";
	}

	@GetMapping("/businessstatus")
	public String businessstatus(Model model) {
		// 지역 선택 코드
		model.addAttribute("SidoList", salesservice.getSidoList());
//		model.addAttribute("SigunguList", salesservice.getSigunguList("1111"));
		
		// 대분류 코드
		model.addAttribute("csCodeList", salesservice.getCscodeList("1"));
//		model.addAttribute("csCodeList2", salesservice.getCscodeList2("a"));
		return "caa/businessStatus/BusinessStatus";
	}
//
//	@GetMapping("/getbusinessStatus")
//	public String getbusinessStatus(Model model, @RequestParam("detailselectStatus") String detailselectStatus,
//			@RequestParam("area") String area, @RequestParam("area2") String area2) {
//
//		List<String> list = bsservice.select();
//		model.addAttribute("firstDiv", list);
//
//		
//		return "caa/businessStatus/BusinessStatus";
//	}

	@GetMapping(value = "/middle", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public String getMiddel() {

		return "";
	}

//	
//	//업종분석
//	@GetMapping("/industryanalysis")
//	public String industryanalysis() {
//		return "caa/caa/IndustryAnalysis";
//	}

	// cctv
	@GetMapping("/CCTVAnalysis")
	public String cctv() {
		return "caa/cctv/CCTVAnalysis";
	}

	/* 영현 */




	
	
	
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
	// 매출분석
	@GetMapping("/saleanalysis")
	public String caaSale(Map map, Model model, HttpSession session, JsonParser jsonParser, String year) {
//			
//			if(year == null) {
//				year = "4";
//			}
//			log.info("session의 jsonMapList값보기");
//			log.info(session.getAttribute("jsonMapList"));
//			
//			String stringList= (String) session.getAttribute("jsonMapList");
//			String stringSector = (String) session.getAttribute("sector");
//			
//			SalesParamVO vo = new SalesParamVO();
//			vo.setYear(year);
//			
//			List<SalesByIndustryVO> list = service.SalesByIndustryList(vo);
//			model.addAttribute("result", list);

		return "caa/caa/SalesAnalysis";
	}

	// 상권분석
	@GetMapping("/commercialanalysis")
	public String commercialAnalysis() {
		return "caa/caa/CommercialAnalysis";
	}

	// 업종분석
	@GetMapping("/industryanalysis")
	public String industryanalysis() {
		return "caa/caa/IndustryAnalysis";
	}

	// 매출분석
	@GetMapping("/SaleAnalysis")
	public String caaSale() {
		return "caa/caa/SalesAnalysis";
	}

	/* 전영현 ↓ */
	// 인구분석
	@GetMapping("popAnalysis")
	public String PopAnalysis(Model model, HttpSession session) {
//		List<Map<String, String>> popListMap = service.getSubwayPop();
//		model.addAttribute("popListMap", popListMap);

		String jsonMapList = (String) session.getAttribute("jsonMapList");

		// 원 안에 포함된 기차 역의 위치를 여러개 가져온다.
		// 1. 지하철역 이름
		// 2. 경도, 위도 좌표
		// 3. 월 별 유동 인구 수
		List<SubwayPopVO> FigureMapList = service.getFigureSubway(jsonMapList);

		Gson gson = new Gson();
		String jsonFigure = gson.toJson(FigureMapList);
		System.out.println(jsonFigure);

		model.addAttribute("jsonFigure", jsonFigure);

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

	// 차완호
	@GetMapping("/searchMember")
	public String searchMember() {

		return "caa/member/SearchIDMember";
	}


	@GetMapping("/main")
	public String mainPage() {
		return "caa/mainPage/main";
	}


}
