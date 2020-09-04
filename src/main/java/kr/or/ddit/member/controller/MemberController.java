package kr.or.ddit.member.controller;


import kr.or.ddit.member.service.MemberService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/member")
@Log4j
@Controller
@AllArgsConstructor
public class MemberController {
	@Setter
	private MemberService service;
	


	
	@RequestMapping("/joinMember")
	public String joinMember() {
		
		return "caa/member/JoinMember";
		
	} 
	
	@RequestMapping("/insertMember")
	public String insertMember(MemberVO vo) {
		
		
         service.insertMember(vo);
         
		return "caa/mainPage/test";
	}
	
	@RequestMapping("/modifyMember")
	public String modifyMember(MemberVO vo) {
		
		service.modifyMember(vo);
		return "caa/mainPage/test";
	}
	
	
	
//	//게시판 수정 참고
//
//		@GetMapping("/modify")
//		public String modify(@RequestParam("board") String board, Model model) {
//			log.info("/modify");
//			model.addAttribute("board", service.get(board));
//
//			return "caa/notice/modify";
//		}
//
//		@PostMapping("/modify")
//		public String modify(BoardVO board, RedirectAttributes rttr) {
//
//			log.info("modify:" + board);
//			System.out.println("공지사항 수정 컨트롤러 ");
//
//			System.out.println(board.getBoard_id());
//			System.out.println(board.getBoard_title());
//			System.out.println(board.getBoard_content());
//
//			if (service.modify(board)) {
//				rttr.addFlashAttribute("result", "success");
//			}
//			return "redirect:/notice/noticeList";
//		}
	
}
