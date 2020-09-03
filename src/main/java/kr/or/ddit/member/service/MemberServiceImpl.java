package kr.or.ddit.member.service;

import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public void insertMember(MemberVO member) {
		mapper.insertMember(member);
	}

	@Override
	public int idCheck(String member_id) {
		log.info("여기"+member_id);
		return mapper.idCheck(member_id);
	}
	
	
}
