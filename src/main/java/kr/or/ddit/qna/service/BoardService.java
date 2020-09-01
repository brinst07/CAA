package kr.or.ddit.qna.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardAttachVO;
import kr.or.ddit.qna.domain.BoardVO;

public interface BoardService {

	public void register(BoardVO board_id);

	public BoardVO get(String board_id);

	public boolean modify(BoardVO board_id);

	public int remove(String board_id);

	public List<BoardVO> getList();

	public int getTotal(Criteria cri);

	public List<BoardAttachVO> getAttachList(String board_id);
	
	
	
	//public Integer insertSelectKey(Map<String, Object> map);
	

	
	
	
//	public void register(BoardVO board);
//	
//	public BoardVO get(String board_id);
//	
//	public boolean modify(BoardVO board);
//	
////	public boolean remove(String board_id);
//	
//	public int remove(String board_id);
//	
////	public List<BoardVO> getList();
//	
//	public List<BoardVO> getList(Criteria cri);
//	
//	public int getTotal(Criteria cri);
//	
//	public List<BoardAttachVO> getAttachList(Long bno);

}
