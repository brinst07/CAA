package kr.or.ddit.notice.mapper;

import kr.or.ddit.domain.BoardAttachVO;

import java.util.List;




public interface NoticeAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String file_id);
	
	public List<BoardAttachVO> findByBoardId(String board_id);

}
