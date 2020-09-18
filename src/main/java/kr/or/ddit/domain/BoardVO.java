package kr.or.ddit.domain;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class BoardVO {
	private String boardnum;
	private String board_id;
	private String member_id;
	private String member_username;
	private String board_title;
	private String board_content;
	private Date board_datetime;
	private int board_reply_count;
	private String board_status;
	private String board_category_id;
	private String board_temp_save;
	private String board_hit;
	private List<BoardAttachVO> attachList;
	
	
	// 계층형 게시판을 위해 추가
	private int board_re_ref; // 답변글 그룹
	private int board_re_lev; // 답변글 레벨
	private int board_re_seq; //답변글 순서

	
}
