package kr.or.ddit.qna.mapper;

import kr.or.ddit.qna.domain.BoardAttachVO;

import java.util.List;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBoardId(String board_id);
	
//	public void deleteAll(String board_id);

}

