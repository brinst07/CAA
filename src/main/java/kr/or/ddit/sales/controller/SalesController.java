package kr.or.ddit.sales.controller;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.service.SalesService;
import lombok.Setter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/sales/*")
public class SalesController {
	
	@Setter
	private SalesService service;
	
	/* 영현  */

	/* ↓ 매출 통계  영현 */
	@GetMapping("/sales")
	public String sS(Model model) {
		
		List<CscodeVO> thirdComboBoxList = service.getCscodeList("2");
		
		model.addAttribute("thirdComboBoxList", thirdComboBoxList);
		
		return "sales/";
	}
	/* ↑ 매출 통계 */
	
	
	
}
