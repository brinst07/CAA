package kr.or.ddit.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.domain.BoardVO;
import kr.or.ddit.notice.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice")
@AllArgsConstructor
public class NoticeController<Criteria> {

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
	 	public String modify(@RequestParam("board_id") String board, Model model) { 
	 		log.info("/modify"); 
	 		model.addAttribute("board", service.get(board));
	 		
	 		return "caa/notice/modify"; }
	
	
	   @PostMapping("/modify")
	   public String modify(@RequestParam("board") BoardVO board, RedirectAttributes rttr) {
			/*
			 * log.info("/modify: " + board_id); 
			 * model.addAttribute("board", service.modify(board_id)); return "caa/notice/modifyNotice";
			 */
		   
		   log.info("modify:" + board);
		   service.modify(board);
	        
	        if (service.modify(board)) {
	           rttr.addFlashAttribute("result", "success");
	        }
	        return "redirect:caa/notice/modify";
	   }			
	   
	   //삭제
	   
		
	   
	   @PostMapping("/remove")
		public String remove(@RequestParam("board_id") String board_id, RedirectAttributes rttr) {
			log.info("remove.." + board_id);
			service.remove(board_id);
			return "redirect:/notice/noticeList";
		}
	   
	   //등록
	   @GetMapping("/register")
       public String register() {

          return "caa/notice/register";
       }
       
       @PostMapping("/register")
       public String register(BoardVO board, RedirectAttributes rttr) {
          log.info("register: " + board);
          System.out.println(board.getBoard_title());
          System.out.println(board.getBoard_content());
          service.register(board);
          
          rttr.addFlashAttribute("result", board.getBoard_id());
          
          return "redirect:/notice/noticeList";
       }
	
}
