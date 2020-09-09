package kr.or.ddit.member.controller;

import kr.or.ddit.example.service.APiExamCaptchaImageCompareService;
import kr.or.ddit.example.service.ApiExamCaptchaImageService;
import kr.or.ddit.example.service.ApiExamCaptchaNkeyService;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.util.GenerateCertCharacter;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import java.util.Map;

@RestController
@Log4j
@RequestMapping("/member/rest/*")
@AllArgsConstructor
public class MemberRestController {
	@Setter
	MemberService service;
	@Setter
	JavaMailSender mailSender;
	@Setter
	GenerateCertCharacter password;
	
	@Setter
	ApiExamCaptchaNkeyService captChaApiNkey;
	@Setter
	ApiExamCaptchaImageService captChaApiImage;
	@Setter
	APiExamCaptchaImageCompareService captChaCompare;

	// 메일 아직 완전안됨
	@GetMapping(value = "/sendMail/{clientemail}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<String> sendMail(@PathVariable("clientemail") String clientemail) {
		log.info("ajaxController");
		log.info("고객 이메일 정보 : " + clientemail);

		String from = "chawanho9@gmail.com";
		String to = "jyh6842@naver.com";
		String subject = clientemail;
		String contents = "고객님이 요청하신 아이디는+ + 입니다.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(from); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(to); // 받는사람 이메일
			messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
			messageHelper.setText(contents); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return new ResponseEntity<>(HttpStatus.OK);

	}

	@ResponseBody
	@PostMapping("/checkmail")
	public ResponseEntity<String> checkMail(String client_email) {
		log.info("ajaxController");
		log.info("고객 이메일 정보 : " + client_email);

		String from = "chawanho9@gmail.com";
		String to = client_email;
		String subject = "ThinkPeople에서 보낸 인증번호 입니다.";
		String passwordKey = password.excuteGenerate();
		String contents = "인증번호는 [" + passwordKey + "] 입니다.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(from); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(to); // 받는사람 이메일
			messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
			messageHelper.setText(contents); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		return new ResponseEntity<String>(passwordKey, HttpStatus.OK);

	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String,Object>> idCheck(@RequestParam("member_id") String member_id) {
		log.info("ajaxController");

		// service, mapper에서 member_id를 변수로한 중복확인 메서드를 만들고 값이 있을경우 chk = 1, 없을 경우 0를
		// 대입해준다.
		int chk;

		chk = service.idCheck(member_id);
		Map<String,Object> map = new HashedMap();
		map.put("over", chk);
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	// 이메일 중복 체크 컨트롤러
		@RequestMapping(value = "/checkmail", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<Map<String,Object>> emailCheck(@RequestParam("member_email") String member_email) {
			log.info("ajaxController");

			// service, mapper에서 member_id를 변수로한 중복확인 메서드를 만들고 값이 있을경우 chk = 1, 없을 경우 0를
			// 대입해준다.
			int echk;

			echk = service.checkmail(member_email);
			Map<String,Object> map = new HashedMap();
			map.put("eover", echk);
			return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}
		
	
		/* 캡차 영현 ↓ */
		@GetMapping("/captchaImage")
		public ResponseEntity<Map<String, String>> capCha() {
			String temp = captChaApiNkey.captchaNkey();

			String[] keyDivArray = temp.split("\"");

			for (int i = 0; i < keyDivArray.length; i++) {
				System.out.println("keyDivArray : " + i + " : " + keyDivArray[i]);
			}

			// 이미지 발급
			Map<String, String> capCha = captChaApiImage.reception(keyDivArray[3]);
			
			return new ResponseEntity<Map<String, String>>(capCha, HttpStatus.OK);
		}
		
		
//		@GetMapping("/captchaCompare")
//		public ResponseEntity<Map<String, String>> captchaCompare() {
//			
//			
//			return new ResponseEntity<Map<String, String>>(param, HttpStatus.OK);
//		}
		
		/* 캡차 영현 ↑ */
		
		
}
