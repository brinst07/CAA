package kr.or.ddit.qna.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardAttachVO;
import kr.or.ddit.qna.domain.BoardVO;
import kr.or.ddit.qna.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("list");
		
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		/*
		 * model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
		 */	
		return "caa/qna/list";
	
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}

	@GetMapping({"/get","/modify"})
	// RequestParam -> bno의 값을 좀 더 명시적으로 처리하기 위해 사용
	// Model -> 화면쪽으로 해당 번호의 게시물을 전달해야 하기 때문에 Model을 파라미터로 지정
	// @ModelAttribute는 자동으로 Model에 데이터를 지정한 이름으로 담아준다.
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modity(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove.." + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList : " + bno);
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}
}
