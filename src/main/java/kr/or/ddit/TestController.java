package kr.or.ddit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	@GetMapping("/test")
	public String test() {
		return "caa/mainPage/test";
	}
	
	@GetMapping("/test2")
	public String test2() {
		return "caa/mainPage/test2";
	}
	
	@GetMapping("/JoinMember")
	public String JoinMember() {
		return "caa/JoinMember";
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

}
