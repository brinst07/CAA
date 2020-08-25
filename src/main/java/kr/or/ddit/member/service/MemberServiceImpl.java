package kr.or.ddit.member.service;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.domain.MemberVO;
import kr.or.ddit.member.mapper.MemberMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	@Setter
	private MemberMapper mapper;
	
	@Override
	public void insertMember(MemberVO member) {
		mapper.insertMember(member);
	}
	
}
