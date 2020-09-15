package kr.or.ddit.cctv.controller;

import kr.or.ddit.member.domain.MemberVO;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@RequestMapping("/cctv/*")
@Controller
@Log4j
public class CCTVController {

	
	//cctv
	@GetMapping("/CCTVAnalysis")
	public String cctv(HttpSession session) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String returnPage = "";
		if(vo == null){
			returnPage = "redirect:/login";
		}else{
			returnPage = "caa/cctv/CCTVAnalysis";
		}
		return returnPage;
	}
	
	
}
