package kr.or.ddit.notice.mapper;

import java.util.List;

import kr.or.ddit.domain.BoardVO;

public interface NoticeMapper {

	public List<BoardVO> getList();
}