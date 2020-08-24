package kr.or.ddit.example.component;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ApiExamCaptchaNkey {
	
	String clientId; //애플리케이션 클라이언트 아이디값";
    String clientSecret; //애플리케이션 클라이언트 시크릿값";

    String code; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
    String apiURL;

//    Map<String, String> requestHeaders = new HashMap<>();
//    requestHeaders.put("X-Naver-Client-Id", clientId);
//    requestHeaders.put("X-Naver-Client-Secret", clientSecret);
//    String responseBody = get(apiURL, requestHeaders);
//
//    System.out.println(responseBody);
    
}
