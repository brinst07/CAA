package kr.or.ddit.history.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.member.domain.MemberVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/history/*")
@AllArgsConstructor
public class HistoryController{
	
	@GetMapping("/selectHistory")
	public String selectHistory(Model model,HttpSession session) {

		String returnPage = "";
		MemberVO vo = (MemberVO) session.getAttribute("member");
		if(vo == null){
			returnPage = "redirect:/login";
		}else{
			returnPage = "caa/history/selectHistory";
		}

		return returnPage;
	}
	
}
