package kr.or.ddit.qna.controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.or.ddit.domain.BoardVO;
import kr.or.ddit.qna.service.QNAService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;



import kr.or.ddit.qna.service.QNAService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QNAController {

	private QNAService service;

	// 목록 출력
	@GetMapping("/list")
	public String list(Model model,BoardVO vo) {
		log.info("list");

		vo.setBoard_category_id("qna");
		model.addAttribute("list", service.getList(vo));
		return "caa/qna/list";
	}

	// 조회
	@GetMapping("/getDetail")
	public String get(@RequestParam("board_id") String board_id, Model model) {
		log.info("/getDetail");

		service.updateHit(board_id);
		log.warn("qna조회");
		model.addAttribute("board", service.get(board_id));
		
		return "caa/qna/get";
	}

	// 수정

	@GetMapping("/modify")
	public String modify(@RequestParam("board") String board, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(board));

		return "caa/qna/modify";
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		/*
		 * log.info("/modify: " + board_id); model.addAttribute("board",
		 * service.modify(board_id)); return "caa/notice/modifyNotice";
		 */

		log.info("modify:" + board);
		System.out.println("qna 수정 컨트롤러");

		System.out.println(board.getBoard_id());
		System.out.println(board.getBoard_title());

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/qna/list";
	}

	// 삭제

	@PostMapping("/remove")
	public String remove(@RequestParam("board_id") String board_id, RedirectAttributes rttr) {
		log.info("remove.." + board_id);
		service.remove(board_id);
		return "redirect:/qna/list";
	}

	// 등록
	@GetMapping("/register")
//	public String register(String board_id,String board_title,Model model) {
//
//		model.addAttribute("board_id",board_id);
//		model.addAttribute("board_title",board_title);
	public String register() {
		
		return "caa/qna/register";
	}
	
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("register: " + board);

		service.register(board);

		rttr.addFlashAttribute("result", board.getBoard_id());

		return "redirect:/qna/list";
	}



	// 등록
	@GetMapping("/reply")
//	public String register(String board_id,String board_title,Model model) {
//
//		model.addAttribute("board_id",board_id);
//		model.addAttribute("board_title",board_title);
	public String reply() {
		
		return "caa/qna/reply";
	}
	
	
	@PostMapping("/reply")
	public String reply(BoardVO board, RedirectAttributes rttr) {

		log.info("reply: " + board);

		service.reply(board);

		rttr.addFlashAttribute("result", board.getBoard_id());
		
		rttr.addAttribute("board_re_ref", board.getBoard_re_ref());
		rttr.addAttribute("board_re_lev", board.getBoard_re_lev());
		rttr.addAttribute("board_re_seq", board.getBoard_re_seq());

		return "redirect:/qna/list";
	}


	
}

	
	
	
	