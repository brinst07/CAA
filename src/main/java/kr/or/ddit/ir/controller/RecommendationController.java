package kr.or.ddit.ir.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.caa.domain.CscodeVO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ir/*")
public class RecommendationController {
	
	@GetMapping("/irSelectPage")
	public String caaSelect(Model model) {
		
//		List<CscodeVO> list = service.getCscodeList("1");
		
//		model.addAttribute("firstDiv", list);
		
		return "caa/caa/selectPage";
	}
	
	@PostMapping(value = "/caaAnalysis")
	public String CAAAnalysis(String json,String jsonDATA, Model model) {
		log.info("업종추천 화면 전환을 위한 메소드 Post");
		Map<String, String> jsonMap = new HashMap<>();
		jsonMap.put("json", json);
		jsonMap.put("jsonDATA", jsonDATA);
		log.info(jsonMap.get("json"));
		log.info(jsonMap.get("jsonDATA"));
//		
//		model.addAllAttributes(jsonMap);
		model.addAttribute("json", json);
		model.addAttribute("jsonDATA", jsonDATA);
		return "caa/caa/CommercialAnalysis";
//		return "home";
	}
}
