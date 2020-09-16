package kr.or.ddit.admin.mapper;

import java.util.List;

import kr.or.ddit.admin.domain.MemberVO;

public interface AdminMapper {

	public List<MemberVO> memberList();

	public void delete(String id);
	public MemberVO select(String userid);
	public void update(MemberVO vo);
}
