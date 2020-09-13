package kr.or.ddit.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.example.service.APiExamCaptchaImageCompareService;
import kr.or.ddit.example.service.ApiExamCaptchaImageService;
import kr.or.ddit.example.service.ApiExamCaptchaNkeyService;
import kr.or.ddit.member.domain.FindIDVO;
import kr.or.ddit.member.domain.FindPWVO;
import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.util.GenerateCertCharacter;
import kr.or.ddit.member.util.Sha256;
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
	@Autowired
	private Sha256 sha256;
    
    @Setter
    ApiExamCaptchaNkeyService captChaApiNkey;
    @Setter
    ApiExamCaptchaImageService captChaApiImage;
    @Setter
    APiExamCaptchaImageCompareService captChaCompare;
    
 // 아이디 찾기 메일
 	@GetMapping(value = "/emailSend/{clientemail}/{name}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
 			MediaType.APPLICATION_XML_VALUE })
 	public ResponseEntity<String> sendMail(@PathVariable("clientemail") String clientemail,@PathVariable("name") String name) {
 		log.info("ajaxController");
 		log.info("고객 이메일 정보 : " + clientemail);
 		log.info("고객 이름 정보 : " + name);
 		FindIDVO vo = new FindIDVO();
 		vo.setMember_email(clientemail);
 		vo.setMember_username(name);
 		String userID = service.findID(vo);
 		if(userID != null) {
	 		String from = "chawanho9@gmail.com";
	        String subject = "ThinkPeople에서 보낸 고객님 정보입니다.";
	 		String to = clientemail;
	 		String contents = name+"님이 요청하신 아이디는["+ userID +"]입니다.";
	 		
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
 		}else  return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
 	}
 	// 비밀번호 찾기 메일
 	@PostMapping(value = "emailSendPW", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
 			MediaType.APPLICATION_XML_VALUE })
 	public ResponseEntity<String> emailSendPW(@RequestBody Map<String,String>map) {
 		log.info("ajaxController");
 		log.info("고객 아이디 정보 : " + map.get("userID"));
 		log.info("고객 이름 정보 : " + map.get("userName"));
 		log.info("고객 이메일 정보 : " + map.get("userEmail"));
 		FindPWVO vo = new FindPWVO();
 		vo.setUserEmail(map.get("userEmail"));
 		vo.setUserName(map.get("userName"));
 		vo.setUserID(map.get("userID"));
 		
 		String userPW =  service.findPW(vo);
 		
 		if(userPW != null) {
 			//1.해당 비밀번호가 존재하면  랜덤 비밀번호를 만들기 
 			String newPW = password.excuteGenerate();
 			String contents =  map.get("userName")+"님의  비밀번호는["+ newPW +"]입니다.";
 			
 			//2. 랜덤 비밀번호를 Sha256.java를 이용해 암호화 하기 
 			String keynewPW =  sha256.encrypt(newPW);
 			
 			//이메일 보내기
 			String from = "chawanho9@gmail.com";
 			String subject = "ThinkPeople에서 보낸 고객님 정보입니다.";
 			String to =  map.get("userEmail");
 			
			//3. 사용자 비밀번호 update하기  		
 			MemberVO newVO = new MemberVO();
 			newVO.setMember_id(map.get("userID"));
 			newVO.setMember_password(keynewPW);
 			
 			service.modifyPW(newVO);
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
 		}else  return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
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
    @RequestMapping(value = "/idCheck", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Map<String, Object>> idCheck(@RequestParam("member_id") String member_id) {
        log.info("ajaxController");

        // service, mapper에서 member_id를 변수로한 중복확인 메서드를 만들고 값이 있을경우 chk = 1, 없을 경우 0를
        // 대입해준다.
        int chk;

        chk = service.idCheck(member_id);
        Map<String, Object> map = new HashedMap();
        map.put("over", chk);
        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
    }

    // 이메일 중복 체크 컨트롤러
    @RequestMapping(value = "/checkmail", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Map<String, Object>> emailCheck(@RequestParam("member_email") String member_email) {
        log.info("ajaxController");

        // service, mapper에서 member_id를 변수로한 중복확인 메서드를 만들고 값이 있을경우 chk = 1, 없을 경우 0를
        // 대입해준다.
        int echk;

        echk = service.checkmail(member_email);
        Map<String, Object> map = new HashedMap();
        map.put("eover", echk);
        return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
    }


    /* 캡차 영현 ↓ */
//		@GetMapping("/captchaImage")
//		public ResponseEntity<Map<String, String>> capCha() {
//			String temp = captChaApiNkey.captchaNkey();
//
//			String[] keyDivArray = temp.split("\"");
//
//			for (int i = 0; i < keyDivArray.length; i++) {
//				System.out.println("keyDivArray : " + i + " : " + keyDivArray[i]);
//			}
//
//			// 이미지 발급
//			Map<String, String> capCha = captChaApiImage.reception(keyDivArray[3]);
//
//			return new ResponseEntity<Map<String, String>>(capCha, HttpStatus.OK);
//		}


    @GetMapping( value = "/captchaCompare/{key}/{inputValue}" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Map<String, String>> captchaCompare(@PathVariable("key") String Nkey, @PathVariable("inputValue") String inputValue) {
        Map<String, String> compare = new HashMap<>();
        compare.put("Nkey", Nkey);
        compare.put("inputValue", inputValue);
        String checkString = captChaCompare.compare(compare);
        boolean check = Boolean.parseBoolean(checkString);
        
        // retrun 시켜줄 맵
        Map<String, String> compareValue = new HashMap<>();

        // 틀리면 재발급
        if (check) {
            System.out.print(check);
            compareValue.put("check", checkString);
        } else {
            System.out.print(check);
            // 값
            compareValue.put("check", checkString);

            // 키 발급
            String temp = captChaApiNkey.captchaNkey();
            String[] keyDivArray = temp.split("\"");

            for (int i = 0; i < keyDivArray.length; i++) {
                System.out.println("keyDivArray : " + i + " : " + keyDivArray[i]);
            }

            // 이미지 발급
            Map<String, String> capCha = captChaApiImage.reception(keyDivArray[3]);

            compareValue.put("apiURL", capCha.get("apiURL")); // 이미지 정보
            compareValue.put("Nkey", capCha.get("Nkey"));
        }


        return new ResponseEntity<Map<String, String>>(compareValue, HttpStatus.OK);
    }

    /* 캡차 영현 ↑ */


}
