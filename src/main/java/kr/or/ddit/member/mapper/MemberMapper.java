package kr.or.ddit.member.mapper;

import kr.or.ddit.member.domain.MemberVO;

public interface MemberMapper {

	public void insertMember(MemberVO member);
	
	//아이디 중복 검사
	public int idCheck(String member_id);
}
