package kr.or.ddit.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.notice.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	
	//목록 출력
	@GetMapping("/noticeList")
	   public String list(Model model) {
	      log.info("list");
	      
	      model.addAttribute("list", service.getList());
	      return "caa/notice/noticeList";
	   }
	
	//조회
	@GetMapping("/get")
	public String get(@RequestParam("board_id") String board_id, Model model) {
		log.info("/get");
		model.addAttribute("board",service.get(board_id));
		return "caa/notice/noticeView";
	}
	
	//수정
	   @GetMapping("/modify")
	   public String modify(@RequestParam("board_id") String board_id, Model model) {
	      log.info("/modify: " + board_id);
	      model.addAttribute("board", service.get(board_id));
	      return "caa/notice/modifyNotice";
	   }
	
}
