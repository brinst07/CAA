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
	@GetMapping("/test3")
	public String test3() {
		return "caa/member/SearchIDMember";
	}
	
	@GetMapping("/test4")
	public String test4() {
		return "caa/member/SearchPWMember";
	}
	

	@GetMapping("/test5")
	public String test5() {
		return "caa/businessStatus/BusinessStatus";
	}
	@GetMapping("/testtest")
	public String testtest() {
		return "caa/member/testtest";
	}
	
	@GetMapping("/qnaList")
	public String qnaList() {
		return "caa/qna/qnaList";
	}
	
	@GetMapping("/selectHistory")
	public String selectHistory() {
		return "caa/history/selectHistory";
	}
	
	@GetMapping("/surveyList")
	public String surveyList() {
		return "caa/survey/surveyList";
	}
	
	@GetMapping("/surveyView")
	public String surveyView() {
		return "caa/survey/surveyView";
	}

	
	@GetMapping("/qnaView")
	public String qnaView() {
		return "caa/qna/qnaView";
	}

	
	@GetMapping("/qnaViewTest")
	public String qnaViewTest() {
		return "caa/qna/qnaViewTest";
	}
}
