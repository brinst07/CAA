package kr.or.ddit.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.domain.BoardVO;

public interface NoticeMapper {

   public List<BoardVO> getList(BoardVO boardVO);

   /**
    * 조회수 증가 메서드
    * @param boardVO
    * @return int형을 반환 실패시 : 0, 성공시 : 1
    */
   public int getHit(BoardVO boardVO);



   /**
    * 상세 조회를 하기 위해서 2개의 값을 넘겨줌
    * @param boardVO
    * @return BoardVO
    */
   public BoardVO get(BoardVO boardVO);
   
   public int modify(BoardVO board_id);
   
   public int remove(String board_id);
   
   public void insert(BoardVO board_id);
   
   public String selectKey();
   
   public void insertSelectKey(BoardVO board);
   

   public BoardVO read(BoardVO boardVO);
   
   public int delete(Long bno);   
   
   public int update(BoardVO board);
   
   public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
   
}