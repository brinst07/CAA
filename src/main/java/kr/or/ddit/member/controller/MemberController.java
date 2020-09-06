package kr.or.ddit.member.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.util.Sha256;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/member")
@Log4j
@Controller
@AllArgsConstructor
public class MemberController {

	@Autowired
	private MemberService service;

	@Autowired
	private Sha256 sha256;

	@RequestMapping("/joinMember")
	public String joinMember() {
		
		return "caa/member/JoinMember";
		
	} 
	
	@PostMapping("/insertMember")
	public String insertMember(MemberVO vo, HttpSession session) {

		log.warn("insertMember를 위한 메소드");
		
         service.insertMember(vo);
         session.setAttribute("member",vo);

		return "caa/mainPage/test";
	}
	
	@RequestMapping("/modifyMember")
	public String modifyMember(MemberVO vo) {
		
		service.modifyMember(vo);
		return "caa/mainPage/test";
	}


	@PostMapping("/login")
	public ResponseEntity<MemberVO> login(String vo){

		ObjectMapper objectMapper = new ObjectMapper();

		MemberVO member = null;

		try {
			member = objectMapper.readValue(vo,MemberVO.class);

			member.setMember_password(sha256.encrypt(member.getMember_password()));

			member = service.loginCheck(member);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<MemberVO>(member, HttpStatus.OK);
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
