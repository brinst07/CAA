package kr.or.ddit.member.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.util.GenerateCertCharacter;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

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
}
