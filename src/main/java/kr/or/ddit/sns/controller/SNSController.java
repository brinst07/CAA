package kr.or.ddit.sns.controller;

import kr.or.ddit.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Log4j
@RequestMapping("/sns/*")
@AllArgsConstructor
public class SNSController {
	
	private DataLab datalab;
	
	@GetMapping("/snsAnalysisFirst")
	public String snsFirstPage(HttpSession session) {

		String returnPage = "";
		MemberVO vo = (MemberVO) session.getAttribute("member");
		if(vo == null){
			returnPage = "redirect:/login";
		}else{
			returnPage = "caa/sns/snsAnalysisFirst";
		}

		return returnPage;
	}
	
	@PostMapping("/snsAnalysis")
	public String snsAnalysis(String keyword,String startDate, String endDate, Model model) {
		log.info(keyword);
		model.addAttribute("keyword",keyword);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		
		
		return "caa/sns/snsAnalysis";
	}
	
}
