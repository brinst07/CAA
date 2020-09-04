package kr.or.ddit.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Transactional
	@Override
	public void insertMember(MemberVO vo) {
		mapper.insertMember(vo);
	}

	@Override
	public int idCheck(String member_id) {
		return mapper.idCheck(member_id);
	}

	@Override
	public int checkmail(String member_email) {
		return mapper.checkmail(member_email);
	}

	@Override
	public void modifyMember(MemberVO vo) {
		mapper.modifyMember(vo);
	}
	
	
}
