package kr.or.ddit.notice.service;

import kr.or.ddit.caa.domain.Criteria;
import kr.or.ddit.domain.BoardAttachVO;
import kr.or.ddit.domain.BoardVO;

import java.util.List;


public interface NoticeService {

    public void register(BoardVO board_id);




    /**
     * 상세 조회를 하기 위해서 2개의 값을 넘겨줌
     * @param boardVO
     * @return BoardVO
     */
    public BoardVO get(BoardVO boardVO);

    /**
     * 조회수 증가 메서드
     * @param boardVO
     * @return int형을 반환 실패시 : 0, 성공시 : 1
     */
    public int getHit(BoardVO boardVO);


    public boolean modify(BoardVO board_id);

    public int remove(String board_id);

    public List<BoardVO> getList(BoardVO boardVO);

    public int getTotal(Criteria cri);

    public List<BoardAttachVO> getAttachList(String board_id);

}