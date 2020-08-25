package kr.or.ddit.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;
import kr.or.ddit.notice.mapper.NoticeMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ = @Autowired )
	private NoticeMapper mapper;

	@Override
	public void register(BoardVO board) {
		
	}

	@Override
	public BoardVO get(String board_id) {
		log.info("get....." + board_id);
		return mapper.read(board_id);	
	}

	@Override
	public boolean modify(BoardVO board_id) {
		
		 log.info("modify ...." + board_id);

	      return mapper.update(board_id) == 1;
	}

	@Override
	public boolean remove(BoardVO bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<BoardVO> getList() {
		List<BoardVO> list = mapper.getList();
		list.forEach(e -> log.info(e));
		return list;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
