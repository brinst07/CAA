package kr.or.ddit.ir.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@Log4j
@RequestMapping("/industryRecommendation/*")
public class RecommendationController {
	
	@GetMapping("/iRecommendationSelectPage")
	public String caaSelect(Model model) {
		
		return "caa/industryRecommendation/recommendSelectPage";
	}
	
}
