package kr.or.ddit.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;
import kr.or.ddit.notice.mapper.NoticeAttachMapper;
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

   @Setter
   private NoticeMapper mapper;
   
   @Setter
   private NoticeAttachMapper attachMapper;

   @Transactional
   @Override
      public void register(BoardVO board) {
         
//         log.info(board);
//         
//         mapper.insert(board);
        
        log.info("register....." + board);
        board.setMember_id("admin");
        board.setBoard_category_id("notice");
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
   }





   @Override
   public BoardVO get(BoardVO boardVO) {
      return mapper.read(boardVO);
   }

   @Override
   public int getHit(BoardVO boardVO) {
      return mapper.getHit(boardVO);
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
   public List<BoardVO> getList(BoardVO boardVO) {
      List<BoardVO> list = mapper.getList(boardVO);
      
      
      return list;
   }
   
   
   
   @Override
   public int getTotal(Criteria cri) {
      return 0;
   }

   @Override
   public List<BoardAttachVO> getAttachList(String board_id) {
      log.info("get Attach list by board_id" + board_id);
      
      return attachMapper.findByBoardId(board_id);   
      }



   

   

   
}