package kr.or.ddit.data.mapper;

import kr.or.ddit.domain.BoardVO;

public interface DataMapper {

	public BoardVO get(BoardVO boardVO);

	public BoardVO read(BoardVO boardVO);
}
