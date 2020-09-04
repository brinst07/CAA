package kr.or.ddit.qna.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardAttachVO;
import kr.or.ddit.qna.domain.BoardVO;
import kr.or.ddit.qna.mapper.BoardAttachMapper;
import kr.or.ddit.qna.mapper.BoardMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
// @NoArgsConstructor -> 아무것도 없는 생성자
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {
		
//		log.info(board);
//		
//		mapper.insert(board);
		
		
		  log.info("register....." + board);
		  board.setMember_id("admin");
		  board.setBoard_category_id("qna");
		  board.setBoard_temp_save("y");
		  
		  String board_id = mapper.selectKey();
		  board.setBoard_id(board_id);
		  mapper.insertSelectKey(board);
		  
		  
		 // mapper.insert(board);
		  
		  if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
		  return; 
		  
		  }
		  
		  board.getAttachList().forEach(attach -> { 
			  
		  attach.setBoard_id(board.getBoard_id());
		  attachMapper.insert(attach); 
		  
		  });
		 
		  
			/*
			 * if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
			 * return; }
			 * 
			 * board.getAttachList().forEach(attach -> { attach.setBno(board.getBno());
			 * attachMapper.insert(attach); });
			 */
		  
		 
		
	}
	
	

	
	

	@Override
	public BoardVO get(String board_id) {
		log.info("get....." + board_id);
		return mapper.read(board_id);
	}

	/*
	 * @Override public boolean modify(BoardVO board_id) {
	 * 
	 * log.info("modify ...." + board_id);
	 * 
	 * 
	 * return mapper.update(board_id) == 1; }
	 */

	/*
	 * @Override public boolean modify(BoardVO board_id) {
	 * 
	 * log.info("modify ...." + board_id);
	 * 
	 * 
	 * return mapper.update(board_id) == 1; }
	 */
	
	@Override
	public int remove(String board_id) {
		log.info("remove" + board_id);
		
//		attachMapper.deleteAll(board_id);
		
		return mapper.remove(board_id);
//		return mapper.delete(board_id);
	}

	@Override
	public List<BoardVO> getList() {
		List<BoardVO> list = mapper.getList();
		list.forEach(e -> log.info(e));
		return list;
	}

	@Override
	public int getTotal(Criteria cri) {
		return 0;
	}

	

//	@Override
//	public boolean modify(String board_id) {
//		log.info("modify ...." + board_id);
//		
//		
//		return mapper.update(board_id) == 1;
//	}

	@Override
	public boolean modify(BoardVO board_id) {
			log.info("modify ...." + board_id);
		
		
		return mapper.modify(board_id) == 1;
	}






	@Override
	public List<BoardAttachVO> getAttachList(String board_id) {

		log.info("get Attach list by board_id" + board_id);
		
		return attachMapper.findByBoardId(board_id);
	}
	
}





	
	
	




