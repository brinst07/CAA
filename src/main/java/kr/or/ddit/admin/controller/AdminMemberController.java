package kr.or.ddit.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.admin.domain.MemberVO;
import kr.or.ddit.admin.service.AdminService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminMemberController {
	@Autowired
	AdminService service;
	
	@GetMapping("memberList")
	String memberList(Model model) {
		List<MemberVO> list =  service.memberList();
		model.addAttribute("memberList",list);
		return "caa/admin/membermanagement";
	}
	
	@GetMapping("update")
	String update(String user_auth,String user_id, String user_name) {
		MemberVO vo = new MemberVO();
		vo.setMember_username(user_name);
		vo.setMember_auth(user_auth);
		vo.setMember_id(user_id);
		service.update(vo);
		return "redirect:/admin/memberList";
	}
	@GetMapping("deletemember")
	String deletemember( String userid) {
		service.delelte(userid);
		return "redirect:/admin/memberList";
	}
	
	@GetMapping("modifymember")
	String modifymember(String userid, Model model) {
		MemberVO vo = service.select(userid);
		log.info("수정대상 유저 정보 : "+vo);
		model.addAttribute("userInfo",vo);
		return "caa/admin/ModifyMember";
	}
}
