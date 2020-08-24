package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;

public interface NoticeService {

public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	
	public List<BoardVO> getList();
	
	public int getTotal(Criteria cri);
	
	public List<BoardAttachVO> getAttachList(Long bno);
}
