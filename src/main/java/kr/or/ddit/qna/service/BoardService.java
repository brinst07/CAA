package kr.or.ddit.qna.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardAttachVO;
import kr.or.ddit.qna.domain.BoardVO;

import java.util.List;

public interface BoardService {

	public void register(BoardVO board_id);

	public BoardVO get(String board_id);

	public boolean modify(BoardVO board_id);

	public int remove(String board_id);

	public List<BoardVO> getList();

	public int getTotal(Criteria cri);

	public List<BoardAttachVO> getAttachList(String board_id);
	
	public void boardHitUpdate(String board_id);

	
}
	
	
	
	

	
	
	
