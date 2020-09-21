package kr.or.ddit.sales.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.sales.service.SalesService;

@Controller
@RequestMapping("/sales/*")
public class SalesController {

	@Autowired
	private SalesService service;

	/* 영현 */

	/* ↓ 매출 통계 영현 */
	@GetMapping("/salesBoard")
	public String salesList(Model model, HttpSession session) {

		// 지역 선택 코드
		model.addAttribute("SidoList", service.getSidoList());
		model.addAttribute("SigunguList", service.getSigunguList("1111"));

		// 대분류 코드
		model.addAttribute("csCodeList", service.getCscodeList("1"));
		model.addAttribute("csCodeList2", service.getCscodeList2("a"));
		
		String returnPage = "";
		MemberVO vo = (MemberVO) session.getAttribute("member");
		if(vo == null){
			returnPage = "redirect:/login";
		}else{
			returnPage = "caa/sales/salesBoard";
		}

		return returnPage;
	}
	/* ↑ 매출 통계 */

}
