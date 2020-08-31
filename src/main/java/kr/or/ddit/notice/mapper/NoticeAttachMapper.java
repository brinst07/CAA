package kr.or.ddit.notice.mapper;

import java.util.List;

import kr.or.ddit.domain.BoardAttachVO;




public interface NoticeAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String file_id);
	
	public List<BoardAttachVO> findByBoardId(String board_id);

}
