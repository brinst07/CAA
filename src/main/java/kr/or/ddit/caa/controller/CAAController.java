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
	
	@GetMapping("/SaleAnalysis")
	public String caaSale() {
		return "caa/caa/SalesAnalysis";
	}
}
