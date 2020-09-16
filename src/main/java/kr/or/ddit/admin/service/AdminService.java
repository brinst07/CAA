package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.domain.MemberVO;

public interface AdminService {

	public List<MemberVO> memberList();

	public void delelte(String id);

	public MemberVO select(String userid);

	public void update(MemberVO vo);


}
