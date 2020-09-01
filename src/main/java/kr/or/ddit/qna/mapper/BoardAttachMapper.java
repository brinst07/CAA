package kr.or.ddit.qna.mapper;

import java.util.List;

import kr.or.ddit.qna.domain.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBoardId(String board_id);
	
	

}
