package kr.or.ddit.notice.mapper;

import kr.or.ddit.domain.BoardVO;

import java.util.List;

public interface NoticeMapper {

	public List<BoardVO> getList();
	
	public BoardVO read(String board_id);
	
	public int modify(BoardVO board_id);
	
	public int remove(String board_id);
	
	public void insert(BoardVO board_id);
	
}
