package kr.or.ddit.member.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.member.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/member")
@Log4j
@Controller
public class MemberController {
	@Setter
	private MemberService service;
	


	
	@RequestMapping("/joinMember")
	public String joinMember() {
		
		return "caa/member/JoinMember";
		
	} 

	@RequestMapping("/insertMember")
	public String insertMember(Model model ) {
		
		return "caa/mainPage/test";
	}
	
	

}
