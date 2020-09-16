package kr.or.ddit.qna.mapper;

import kr.or.ddit.domain.BoardVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QNAMapper {

	public List<BoardVO> getList(BoardVO vo);

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

	public void updateHit(String board_id);

	public void insertBoardReply(BoardVO board);

	public void updateBoardReSeq(BoardVO board);
}
