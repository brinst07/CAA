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

}
