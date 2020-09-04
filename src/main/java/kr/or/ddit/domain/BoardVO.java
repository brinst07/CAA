package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

import java.util.Date;

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
	@Override
	public String toString() {
		return "BoardVO [" + (board_id != null ? "board_id=" + board_id + ", " : "")
				+ (member_id != null ? "member_id=" + member_id + ", " : "")
				+ (board_title != null ? "board_title=" + board_title + ", " : "")
				+ (board_content != null ? "board_content=" + board_content + ", " : "")
				+ (board_datetime != null ? "board_datetime=" + board_datetime + ", " : "") + "board_reply_count="
				+ board_reply_count + ", " + (board_status != null ? "board_status=" + board_status + ", " : "")
				+ (board_category_id != null ? "board_category_id=" + board_category_id + ", " : "")
				+ (board_temp_save != null ? "board_temp_save=" + board_temp_save + ", " : "")
				+ (board_hit != null ? "board_hit=" + board_hit + ", " : "")
				+ (attachList != null ? "attachList=" + attachList : "") + "]";
	}
	
	
	
	
	

}
