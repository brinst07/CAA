package kr.or.ddit.notice.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;

import java.util.List;


public interface NoticeService {

   public void register(BoardVO board_id);
	
	public BoardVO get(String board_id);
	
	public boolean modify(BoardVO board_id);
	
	public int remove(String board_id);
	
	public List<BoardVO> getList();
	
	public int getTotal(Criteria cri);

	public List<BoardAttachVO> getAttachList(String board_id);
	
}
