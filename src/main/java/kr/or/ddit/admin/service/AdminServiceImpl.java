package kr.or.ddit.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.domain.MemberVO;
import kr.or.ddit.admin.mapper.AdminMapper;
import kr.or.ddit.caa.mapper.CAAMapper;
import kr.or.ddit.caa.service.CAAServiceImpl;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {
	@Setter
	private AdminMapper mapper;
	
	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}

	@Override
	public void delelte(String id) {
		mapper.delete(id);
	}

	@Override
	public MemberVO select(String userid) {
		return mapper.select(userid);
	}

	@Override
	public void update(MemberVO vo) {
		 mapper.update(vo);
		
	}

}
