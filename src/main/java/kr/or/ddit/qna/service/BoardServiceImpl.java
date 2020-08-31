package kr.or.ddit.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.qna.domain.BoardAttachVO;
import kr.or.ddit.qna.domain.BoardVO;
import kr.or.ddit.qna.mapper.BoardAttachMapper;
import kr.or.ddit.qna.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
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
		  
		  mapper.insertSelectKey(board);
		  
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
		return mapper.remove(board_id);
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

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return null;
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

	////////////////////////////////////////////////////

//	@Setter(onMethod_ = @Autowired)
//	private BoardMapper mapper;
//	
//	@Setter(onMethod_ = @Autowired)
//	private BoardAttachMapper attachMapper;
//
//	@Transactional
//	@Override
//	public void register(BoardVO board) {
//		log.info("get..." + board);
//
//		mapper.insertSelectKey(board);
//		
//		/*
//		 * if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
//		 * return; }
//		 */
//		
//		/*
//		 * board.getAttachList().forEach(attach->{ attach.setBno(board.getBno());
//		 * attachMapper.insert(attach); });
//		 */
//	}
//
//	@Override
//	public BoardVO get(String board_id) {
//		log.info("get...." + board_id);
//
//		return mapper.read(board_id);
//	}
//
//	@Override
//	public boolean modify(BoardVO board) {
//
//		log.info("modify ...." + board);
//
//		return mapper.update(board) == 1;
//	}
//
//	/*
//	 * @Override public boolean remove(String board_id) {
//	 * 
//	 * log.info("remove...." + board_id);
//	 * 
//	 * return mapper.delete(board_id) == 1; }
//	 */
//	
//	@Override
//	   public int remove(String board_id) {
//	      log.info("remove" + board_id);
//	      return mapper.remove(board_id);
//	   }
//
////	@Override
////	public List<BoardVO> getList() {
////
////		log.info("getList...");
////
////		return mapper.getList();
////	}
//
//	@Override
//	public List<BoardVO> getList(Criteria cri) {
//		
//		log.info("get List with criteria : " + cri);
//		List<BoardVO> list = mapper.getList();
//		list.forEach(e -> log.info(e));
//		return list;
//	}
//
//	@Override
//	public int getTotal(Criteria cri) {
//		
//		log.info("get total count");
//		
//		return mapper.getTotalCount(cri);
//		
//	}
//
//	@Override
//	public List<BoardAttachVO> getAttachList(Long bno) {
//		
//		log.info("get Attach list by bno" + bno);
//		
//		return attachMapper.findByBno(bno);
//	}
//	

	////////////////////////////////////////////
}
