package kr.or.ddit.caa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/caa/*")
public class CAAController {

	@GetMapping("/caaSelect")
	public String caaSelect() {
		return "caa/caa/selectPage";
	}

	/* 영현  */
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

	@GetMapping("/ss")
	public String sS() {
		return "caa/ss/sS";
	}

}
