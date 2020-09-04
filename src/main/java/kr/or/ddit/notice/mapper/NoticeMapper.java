package kr.or.ddit.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.domain.BoardVO;

import java.util.List;

public interface NoticeMapper {

	public List<BoardVO> getList();
	
	public BoardVO read(String board_id);
	
	public int modify(BoardVO board_id);
	
	public int remove(String board_id);
	
	public void insert(BoardVO board_id);
	
	public String selectKey();
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long board_id);
	
	public int delete(Long bno);	
	
	public int update(BoardVO board);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
