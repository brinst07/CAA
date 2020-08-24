package kr.or.ddit.caa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
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
	
		/* ↓ 영현 */
	@GetMapping("PopAnalysis")
	public String PopAnalysis() {
		return "caa/caa/popAnalysis";
	}
		/* ↑ 영현 */
	
	@PostMapping("/caaAnalysis")
	public String CAAAnalysis(String json,String jsonDATA, Model model) {
		log.info("상권분석 화면 전환을 위한 메소드");
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type","text/plain;charset=utf-8");
		Map<String, String> jsonMap = new HashMap<String, String>();
		jsonMap.put("json", json);
		jsonMap.put("jsonDATA", jsonDATA);
		model.addAllAttributes(jsonMap);
		return "caa/caa/CommercialAnalysis";
	}
	
	
	/* ↑ 상권 분석 */
	

	



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
