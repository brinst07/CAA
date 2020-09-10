package kr.or.ddit.ir.controller;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j
@RequestMapping("/ir/*")
public class RecommendationController {
	
	@GetMapping("/irSelectPage")
	public String caaSelect(Model model) {
		
		return "caa/ir/recommendSelectPage";
	}

	@GetMapping("/callArea")
	public void caaArea(String areaName){
		log.warn(areaName);
	}
}
