package kr.or.ddit.ss.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.service.CAAService;
import kr.or.ddit.ss.service.SSService;
import lombok.Setter;

@Controller
@RequestMapping("/caa/*")
public class SSController {
	
	@Setter(onMethod_ = @Autowired)
	private SSService service;
	
	/* 영현  */

	/* ↓ 매출 통계  영현 */
	@GetMapping("/ss")
	public String sS(Model model) {
		
		List<CscodeVO> thirdComboBoxList = service.getCscodeList("2");
		
		model.addAttribute("thirdComboBoxList", thirdComboBoxList);
		
		return "caa/ss/sS";
	}
	/* ↑ 매출 통계 */
	
}
