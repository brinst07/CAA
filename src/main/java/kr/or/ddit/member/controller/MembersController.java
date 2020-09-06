package kr.or.ddit.member.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.or.ddit.member.domain.KaKaoProfile;
import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.domain.OAuthToken;
import kr.or.ddit.member.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.UUID;

@Controller
@Log4j
@AllArgsConstructor
public class MembersController {

    @Setter
    @Autowired
    private MemberService service;

    @GetMapping("/login")
    public String login() {

        log.info("login화면 전환을 위한 메소드");

        return "login.do";
    }

    @GetMapping("/auth/kakao/callback")
    public String kakaoCallback(String code, HttpSession session){
        //Post 방식으로 key=value를 데이터를 요청(카카오 쪽으로)
        RestTemplate rt = new RestTemplate();

        //HTTPHeader 오브젝트 생성
        HttpHeaders header = new HttpHeaders();
        header.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");

        //HTTPBody 오브젝트 생성
        MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id","4c12c1d51d4e0fe19ee7a9427689835a");
        params.add("redirect_uri", "http://localhost:8080/auth/kakao/callback");
        params.add("code", code);

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<MultiValueMap<String,String>>(params,header);

        //Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답받음.
        ResponseEntity<String> response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        //json 데이터를 자바 object로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oAuthToken = null;

        try {
            oAuthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
        } catch (IOException e) {
            e.printStackTrace();
        }

        log.warn("카카오 액세스 토큰 : " + oAuthToken.getAccess_token());

        //POST 방식으로 key=value를 데이터를 요청(카카오쪽으로)
        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders header2 = new HttpHeaders();
        header2.add("Authorization", "Bearer "+ oAuthToken.getAccess_token());
        header2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest = new HttpEntity<>(header2);

        //Http요청하기 - Post 방식으로 - 그리고 response 변수의 응답받음.
        ResponseEntity<String> response2 = rt2.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.POST,
            kakaoProfileRequest,
            String.class
        );
        log.warn(response2.getBody());

        ObjectMapper objectMapper2 = new ObjectMapper();
        KaKaoProfile kakaoProfile = null;

        try {
            kakaoProfile = objectMapper2.readValue(response2.getBody(), KaKaoProfile.class);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //User 오브젝트 username, password, email
        UUID uuid = UUID.randomUUID();

        MemberVO memVo = new MemberVO();
        memVo.setMember_id(Integer.toString(kakaoProfile.getId()));
        memVo.setMember_email(kakaoProfile.getKakao_account().getEmail());
        memVo.setMember_password(uuid.toString());
        memVo.setMember_username(kakaoProfile.getProperties().nickname);
        memVo.setMember_thumnail(kakaoProfile.kakao_account.getProfile().thumbnail_image_url);

        log.warn(memVo);
        service.insertSocialMember(memVo);
        session.setAttribute("member",memVo);
        return "caa/mainPage/main";
    }
}
