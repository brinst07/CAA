package kr.or.ddit.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.domain.AttachFileDTO;
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

	// 목록 출력
	@GetMapping("/noticeList")
	public String list(Model model) {
		log.info("list");

		model.addAttribute("list", service.getList());
		return "caa/notice/noticeList";
	}

	// 조회
	@GetMapping("/get")
	public String get(@RequestParam("board_id") String board_id, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(board_id));
		return "caa/notice/noticeView";
	}

	// 수정

	@GetMapping("/modify")
	public String modify(@RequestParam("board") String board, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(board));

		return "caa/notice/modify";
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {

		log.info("modify:" + board);
		System.out.println("공지사항 수정 컨트롤러 ");

		System.out.println(board.getBoard_id());
		System.out.println(board.getBoard_title());
		System.out.println(board.getBoard_content());

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/noticeList";
	}

	// 삭제

	@PostMapping("/remove")
	public String remove(@RequestParam("board_id") String board_id, RedirectAttributes rttr) {
		log.info("remove.." + board_id);
		service.remove(board_id);
		return "redirect:/notice/noticeList";
	}

	// 등록
	@GetMapping("/register")
       public String register() {

          return "caa/notice/register";
       }

	@PostMapping("/register")
       public String register(MultipartFile[] uploadFile,BoardVO board, RedirectAttributes rttr) {
          log.info("register: " + board);
          System.out.println(board.getBoard_title());
          System.out.println(board.getBoard_content());
          service.register(board);
          
          rttr.addFlashAttribute("result", board.getBoard_id());
          
          return "redirect:/notice/noticeList";
       }
	
	// 파일 업로드

		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			Date date = new Date();

			String str = sdf.format(date);

			return str.replace("-", File.separator);
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

		@GetMapping("/uploadAjax")
		public void uploadAjax() {
			log.info("upload ajax");
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

//		  					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
	//
//		  					thumbnail.close();
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
	
}
