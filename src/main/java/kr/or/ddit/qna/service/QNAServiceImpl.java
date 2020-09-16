package kr.or.ddit.qna.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardVO;
import kr.or.ddit.qna.mapper.QNAMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
@AllArgsConstructor
// @NoArgsConstructor -> 아무것도 없는 생성자
public class QNAServiceImpl implements QNAService {
    @Setter
    private QNAMapper mapper;

    @Transactional
    @Override
    public void register(BoardVO board) {
        board.setBoard_category_id("qna");
        mapper.insert(board);
        
//        int id = Integer.parseInt(board.getBoard_id());
//        
//        board.setBoard_re_ref(id);

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
    public List<BoardVO> getList(BoardVO vo) {
        List<BoardVO> list = mapper.getList(vo);
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
    public void updateHit(String board_id) {
        mapper.updateHit(board_id);
    }


	@Override
	public void reply(BoardVO board) {
		log.info("reply.....");
		
		board.setBoard_category_id("qna");
        mapper.insertBoardReply(board);

		/* board.setBoard_re_seq(0); */
        log.info(board.getBoard_id());
//        int id = Integer.parseInt(board.getBoard_id());
        try {
        	board.setBoard_re_ref(Integer.parseInt(board.getBoard_id()));       	
        } catch (NumberFormatException e) {
			// TODO: handle exception
		} catch (Exception e) {
			// TODO: handle exception
		}
	}


	@Override
	public void updateBoardReSeq(BoardVO board) {
        mapper.updateBoardReSeq(board);
		
	}

}





	
	
	




