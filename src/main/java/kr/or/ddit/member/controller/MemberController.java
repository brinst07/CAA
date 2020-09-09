package kr.or.ddit.member.controller;


import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.util.Sha256;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@RequestMapping("/member")
@Log4j
@Controller
@AllArgsConstructor
public class MemberController {

    @Autowired
    private MemberService service;

    @Autowired
    private Sha256 sha256;

    @RequestMapping("/joinMember")
    public String joinMember() {

        return "caa/member/JoinMember";

    }

    @PostMapping("/insertMember")
    public String insertMember(MemberVO vo, HttpSession session) {

        log.warn("insertMember를 위한 메소드");
        //암호화처리
        vo.setMember_password(sha256.encrypt(vo.getMember_password()));


        service.insertMember(vo);
        session.setAttribute("member", vo);

        return "caa/main";
    }

    @RequestMapping("/modifyMember")
    public String modifyMember(MemberVO vo) {

        service.modifyMember(vo);
        return "caa/mainPage/test";
    }


    @PostMapping(value = "/login", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<MemberVO> login(@RequestBody MemberVO vo,HttpSession session) {
        vo.setMember_password(sha256.encrypt(vo.getMember_password()));
        MemberVO resultVO = service.loginCheck(vo);

        if(resultVO != null){
            session.setAttribute("member",resultVO);
        }

        return new ResponseEntity<MemberVO>(resultVO, HttpStatus.OK);
    }

    @RequestMapping("/logout")
    public ResponseEntity<String> logout(HttpSession session) {
        MemberVO vo = (MemberVO) session.getAttribute("member");
        String id = vo.getMember_username();
        session.removeAttribute("member");

        return new ResponseEntity<String>(id, HttpStatus.OK);
    }

    ;


}
