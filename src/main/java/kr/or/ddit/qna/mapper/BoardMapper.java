package kr.or.ddit.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList();

	public BoardVO read(String board_id);

	public int modify(BoardVO board_id);

	public int remove(String board_id);

	public void insert(BoardVO board);
	
	public String selectKey();
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long board_id);
	
	public int delete(String board_id);	
	
	public int update(BoardVO board);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
