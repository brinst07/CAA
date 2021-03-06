package kr.or.ddit.member.mapper;

import kr.or.ddit.member.domain.FindIDVO;
import kr.or.ddit.member.domain.FindPWVO;
import kr.or.ddit.member.domain.MemberVO;

public interface MemberMapper {

	//회원가입
	public void insertMember(MemberVO vo);
	
	//회원정보 수정
	public void modifyMember(MemberVO vo);
	
	//아이디 중복 검사
	public int idCheck(String member_id);
	
	//이메일 중복 검사
	public int checkmail(String member_email);


    public MemberVO loginCheck(MemberVO vo);

    public void insertSocialMember(MemberVO memVo);


	public String findID(FindIDVO vo);
	
	public void modifyPW(MemberVO vo);

	public String findPW(FindPWVO vo);
	
    //회원정보 수정 조회
    public MemberVO selectMember(String id);
}
