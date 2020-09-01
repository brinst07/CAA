package kr.or.ddit.qna.controller;

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

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.qna.domain.AttachFileDTO;
import kr.or.ddit.qna.domain.BoardAttachVO;
import kr.or.ddit.qna.domain.BoardVO;
import kr.or.ddit.qna.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	// 목록 출력
	@GetMapping("/list")
	public String list(Model model) {
		log.info("list");

		model.addAttribute("list", service.getList());
		return "caa/qna/list";
	}

	// 조회
	@GetMapping("/get")
	public String get(@RequestParam("board_id") String board_id, Model model) {
		log.info("/get");
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
	public String register() {

		return "caa/qna/register";
	}
	
	

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
//		System.out.println(board.getBoard_title());
//		System.out.println(board.getBoard_content());
		
		log.info("===============================");
		
		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("===============================");

		
		 service.register(board);

		 rttr.addFlashAttribute("result", board.getBoard_id());

		return "redirect:/qna/list";
	}

	// file upload

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}

	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
	
	// produces -> 보낼때 타입 consumes -> 받을때 타입
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	// @ResponseBody -> body를 mapping
	// @ResponseBody 붙은 메서드에서 타입을 반환하면 자동으로 타입 정보가 JSON 객체로 변환되어 전송됩니다.
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path 
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);

				// check image type file
				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

	  					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);

	  					thumbnail.close();
				}

				// add to List
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// 썸네일, 확장자 제한, 이미지파일을 처리

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName : " + fileName);

		File file = new File("c:\\upload\\" + fileName);

		log.info("file : " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile : " + fileName);

		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName : " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {

		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);

		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		String resourceName = resource.getFilename();

		// remove UUID
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

		HttpHeaders headers = new HttpHeaders();
		try {

			boolean checkIE = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			String downloadName = null;

			if (checkIE) {
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF8").replaceAll("\\+", " ");
			} else {
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			}

			headers.add("Content-Disposition", "attachment; filename=" + downloadName);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
	
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> getAttachList(String board_id) {
		
		log.info("getAttachList " + board_id);
		
		return new ResponseEntity<>(service.getAttachList(board_id), HttpStatus.OK);
		
	}

	
	
	
	
	/*
	 * //등록
	 * 
	 * @PostMapping("/register") public String register(BoardVO board,
	 * RedirectAttributes rttr) { log.info("register : " + board_id);
	 * 
	 * if(board.getAttachList() != null) { board.getAttachList().forEach(attach ->
	 * log.info(attach)); }
	 * 
	 * service.register(board_id); rttr.addFlashAttribute("result", board.getBno());
	 * 
	 * return "redirect:/board/list"; }
	 * 
	 * @GetMapping("/register") public void register() {
	 * 
	 * }
	 */

//	@GetMapping("/list")
//	public String list(Criteria cri, Model model) {
//		log.info("list");
//
//		model.addAttribute("list", service.getList(cri));
////		model.addAttribute("pageMaker", new PageDTO(cri, 123));
//		/*
//		 * model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
//		 */
//		return "caa/qna/list";
//
//	}
//
//	@PostMapping("/register")
//	public String register(BoardVO board, RedirectAttributes rttr) {
//		log.info("register : " + board);
//
//		/*
//		 * if (board.getAttachList() != null) { board.getAttachList().forEach(attach ->
//		 * log.info(attach)); }
//		 */
//
//		/*
//		 * service.register(board); rttr.addFlashAttribute("result", board.getBno());
//		 */
//
//		return "redirect:/board/list";
//	}
//
//	@GetMapping("/register")
//	public void register() {
//
//	}
//
//	/*
//	 * @GetMapping({"/get","/modify"}) // RequestParam -> bno의 값을 좀 더 명시적으로 처리하기 위해
//	 * 사용 // Model -> 화면쪽으로 해당 번호의 게시물을 전달해야 하기 때문에 Model을 파라미터로 지정
//	 * // @ModelAttribute는 자동으로 Model에 데이터를 지정한 이름으로 담아준다. public void
//	 * get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model
//	 * model) { log.info("/get or /modify"); model.addAttribute("board",
//	 * service.get(bno)); }
//	 */
//
//	
//	  @GetMapping("/get") 
//	  // RequestParam -> bno의 값을 좀 더 명시적으로 처리하기 위해 사용 
//	  // Model-> 화면쪽으로 해당 번호의 게시물을 전달해야 하기 때문에 Model을 파라미터로 지정 
//	  // @ModelAttribute는 자동으로 Model에 데이터를 지정한 이름으로 담아준다. 
//	  public String get(@RequestParam("board_id") String board_id, Model model) { 
//		  log.info("/get"); model.addAttribute("board", service.get(board_id));
//	  
//	  return "caa/qna/get"; }
//	 
//
//	/*
//	 * @GetMapping({"/get", "/modify"}) // RequestParam -> bno의 값을 좀 더 명시적으로 처리하기 위해
//	 * 사용 // Model -> 화면쪽으로 해당 번호의 게시물을 전달해야 하기 때문에 Model을 파라미터로 지정
//	 * // @ModelAttribute는 자동으로 Model에 데이터를 지정한 이름으로 담아준다. public String
//	 * get(@RequestParam("board_id") Long board_id, @ModelAttribute("cri") Criteria
//	 * cri, Model model) { log.info("/get or /modify"); model.addAttribute("board",
//	 * service.get(board_id));
//	 * 
//	 * return "caa/qna/get"; }
//	 */
//	
//	
//	  @GetMapping("/modify") 
//	  public String modify(@RequestParam("board_id") String board_id, Model model) { 
//		  log.info("/modify"); 
//		  model.addAttribute("board", service.get(board_id));
//		  
//	  
//	  return "caa/qna/modify"; }
//	 
//	 
//	/*
//	 * @GetMapping({"/get", "/modify"}) public void get(@RequestParam("board_id")
//	 * Long board_id, @ModelAttribute("cri") Criteria cri, Model model) {
//	 * log.info("/get or /modify"); model.addAttribute("board",
//	 * service.get(board_id));
//	 * 
//	 * 
//	 * }
//	 */
//	  
//	  
//	  
//	  
//	  @PostMapping("/modify")
//	  public String modify(BoardVO board, RedirectAttributes rttr) {
//		  log.info("modify:" + board);
//		  
//		  if (service.modify(board)) {
//			  rttr.addFlashAttribute("result", "success");
//		  }
//		  return "redirect:caa/qna/list";
//	  }
//
//	
//	
//	
//		/*
//		 * @PostMapping("/modify") //@RequestMapping(value="/modify", method =
//		 * {RequestMethod.GET, RequestMethod.POST}) public String modity(BoardVO
//		 * board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		 * log.info("modify : " + board); if (service.modify(board)) {
//		 * rttr.addFlashAttribute("result", "success");
//		 * 
//		 * }
//		 * 
//		 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
//		 * cri.getAmount()); rttr.addAttribute("type", cri.getType());
//		 * rttr.addAttribute("keyword", cri.getKeyword()); return
//		 * "redirect:caa/qna/list"; }
//		 */
//
//	  
//	  
//		/*
//		 * @PostMapping("/remove") public String remove(@RequestParam("board_id") String
//		 * board_id, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		 * log.info("remove.." + board_id); if (service.remove(board_id)) {
//		 * rttr.addFlashAttribute("result", "success"); }
//		 * 
//		 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
//		 * cri.getAmount()); rttr.addAttribute("type", cri.getType());
//		 * rttr.addAttribute("keyword", cri.getKeyword());
//		 * 
//		 * return "redirect:caa/qna/list"; }
//		 */
//
//	
//	@PostMapping("/remove")
//    public String remove(@RequestParam("board_id") String board_id, RedirectAttributes rttr) {
//       log.info("remove.." + board_id);
//       service.remove(board_id);
//       return "redirect:/qna/list";
//    }
//	
//	
//	
//	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
//		log.info("getAttachList : " + bno);
//		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
//	}
}
