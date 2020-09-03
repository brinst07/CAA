package kr.or.ddit.notice.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;
import kr.or.ddit.notice.mapper.NoticeMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ = @Autowired )
	private NoticeMapper mapper;

	@Override
	   public void register(BoardVO board) {
	      
	      log.info(board);
	      
	      mapper.insert(board);
	}

	@Override
	public BoardVO get(String board_id) {
		log.info("get....." + board_id);
		return mapper.read(board_id);	
	}

	@Override
	public boolean modify(BoardVO board_id) {
		
		 log.info("modify ...." + board_id);

	      return mapper.modify(board_id) == 1;
	}

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



	

	

	
}
