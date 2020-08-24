package kr.or.ddit.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardVO;


public interface BoardMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);	
	
	public int update(BoardVO board);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
}
