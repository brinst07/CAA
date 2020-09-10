package kr.or.ddit.example;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.example.component.ApiExamCaptchaImageComponent;
import kr.or.ddit.example.component.ApiExamCaptchaNkeyComponent;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ApiExamCaptchaNkeyTests {

	@Autowired
	ApiExamCaptchaNkeyComponent captChaApiNkey;
	
	@Autowired
	ApiExamCaptchaImageComponent captChaApiImage;
	
	
	@Test
	public void key_Issued() {
		log.info("키 발급");
		log.info(captChaApiNkey.captchaNkey()); // 키 발급
	}
	
	@Test
	public void captchaImage() {
		String temp = captChaApiNkey.captchaNkey();
		
		log.info("temp : " + temp);
		
		String[] keyDivArray = temp.split("\"");
		
		for (int i = 0; i < keyDivArray.length; i++) {
			System.out.println("keyDivArray : " + i + " : " + keyDivArray[i]);
		}

		// 이미지 발급
		Map<String, String> param = captChaApiImage.reception(keyDivArray[3]); 
		log.warn("param : " + param);
		log.warn("apiURL : " + param.get("apiURL"));
		//param.put("apiURL", apiURL); // 이미지 정보
		//param.put("Nkey", Nkey);
		
		
		
		
	}
}
