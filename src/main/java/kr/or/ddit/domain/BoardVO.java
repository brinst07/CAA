package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import kr.or.ddit.qna.domain.BoardAttachVO;
import lombok.Data;

@Data
public class BoardVO {
	
	private String board_id;
	private String member_id;
	private String board_title;
	private String board_content;
	private Date board_datetime;
	private int board_reply_count;
	private String board_status;
	private String board_category_id;
	private String board_temp_save;
	private String board_hit;
	private List<BoardAttachVO> attachList;
	
	
	
	
	
	
	

}
