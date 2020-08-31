package kr.or.ddit.notice.service;

import java.util.List;

import kr.or.ddit.domain.BoardVO;

public interface NoticeService {

   public void register(BoardVO board_id);
	
	public BoardVO get(String board_id);
	
	public boolean modify(BoardVO board_id);
	
	public int remove(String board_id);
	
	public List<BoardVO> getList();
	
}
