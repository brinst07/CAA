package kr.or.ddit.qna.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;

import java.util.List;

public interface QNAService {

	public void register(BoardVO board_id);
	
	public void reply(BoardVO board_id);

	public BoardVO get(String board_id);

	public boolean modify(BoardVO board_id);

	public int remove(String board_id);

	public List<BoardVO> getList(BoardVO vo);

	public int getTotal(Criteria cri);


	public void updateHit(String board_id);
	
	public void updateBoardReSeq(BoardVO board );
	
}
	
	
	
	

	
	
	
