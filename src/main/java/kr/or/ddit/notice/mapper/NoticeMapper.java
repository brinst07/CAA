package kr.or.ddit.notice.mapper;

import java.util.List;

import kr.or.ddit.domain.BoardVO;

public interface NoticeMapper {

	public List<BoardVO> getList();
	public BoardVO read(String board_id);
	public int update(BoardVO board_id);
}
