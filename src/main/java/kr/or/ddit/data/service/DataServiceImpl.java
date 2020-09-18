package kr.or.ddit.data.service;

import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.data.mapper.DataMapper;
import kr.or.ddit.domain.BoardVO;
import lombok.Setter;

public class DataServiceImpl implements DataService{
	
	 @Setter
	 private DataMapper mapper;

	@Transactional
	@Override
	public BoardVO get(BoardVO boardVO) {
		return mapper.read(boardVO);
	}

}
