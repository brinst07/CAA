package kr.or.ddit.member.service;

import kr.or.ddit.member.domain.MemberVO;

public interface MemberService {
	
	//회원가입
	public void insertMember(MemberVO vo);
	
	//회원정보 수정
	public void modifyMember(MemberVO vo);

	//아이디 중복 검사
	public int idCheck(String member_id);
	
	//이메일 중복 검사
	public int checkmail(String member_email);
	
}
