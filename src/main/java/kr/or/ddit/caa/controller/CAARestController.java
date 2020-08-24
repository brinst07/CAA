package kr.or.ddit.caa.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.bs.service.BSService;
import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.service.CAAService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/caa/rest/*")
@Log4j
@AllArgsConstructor
public class CAARestController {
	@Autowired
	private CAAService serivce;
	@Autowired
	private BSService bsservice;
	@Autowired
	private JavaMailSenderImpl mailSender;

	@GetMapping(value = "/div/{keyword}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CscodeVO>> otherCscodeList(@PathVariable("keyword") String keyword) {
		log.info("ajax를 통한 분류 선택");

		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		return new ResponseEntity<List<CscodeVO>>(serivce.otherCscodeList(keyword), HttpStatus.OK);
	}

	@GetMapping(value = "/businessstatus/{select}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CscodeVO>> detailCscodeList(@PathVariable("select") String select) {

		log.info("ajaxController");

		return new ResponseEntity<List<CscodeVO>>(bsservice.select(select), HttpStatus.OK);

	}

	// 메일
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
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(from);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(to);     // 받는사람 이메일
		      messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
		      messageHelper.setText(contents);  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		   

		return new ResponseEntity<>(HttpStatus.OK);

	}

}
