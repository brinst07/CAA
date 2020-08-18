package kr.or.ddit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test")
	public String test() {
		return "caa/test";
	}
	
	@GetMapping("/test2")
	public String test2() {
		return "caa/test2";
	}

	
	@GetMapping("/iRecommendation")
	public String IRtest() {
		return "caa/iRecommendation";
	}
	@GetMapping("/iRecommendation2")
	public String IRtest2() {
		return "caa/iRecommendation2";
	}
	@GetMapping("/test3")
	public String test3() {
		return "caa/member/SearchIDMember";
	}
	
	@GetMapping("/test4")
	public String test4() {
		return "caa/member/SearchPWMember";
	}
	
	@GetMapping("/testtest")
	public String testtest() {
		return "caa/member/testtest";
	}
	
	@GetMapping("/qnaList")
	public String qnaList() {
		return "caa/member/qnaList";
	}

}
