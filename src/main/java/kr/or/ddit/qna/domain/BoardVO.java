package kr.or.ddit.qna.domain;


import lombok.Data;

import java.util.Date;
import java.util.List;


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
	private int board_hit;
	
	private List<BoardAttachVO> attachList;

}
