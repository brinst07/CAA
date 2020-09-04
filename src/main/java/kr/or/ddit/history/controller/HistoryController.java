package kr.or.ddit.history.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.qna.controller.BoardController;
import kr.or.ddit.qna.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/history/*")
@AllArgsConstructor
public class HistoryController {

	
	@GetMapping("/selectHistory")
	public String selectHistory() {
		
		log.info("selectHistory");
	
		return "caa/history/selectHistory";
	}
}
