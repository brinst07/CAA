package kr.or.ddit.caa.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private String board_id;
	private String member_id;
	private String board_title;
	private String board_content;
	private Date board_datetime;
	private String board_reply_count;
	private String board_status;
	private String board_category_id;
	private String board_temp_save;
	private String board_hit;

}