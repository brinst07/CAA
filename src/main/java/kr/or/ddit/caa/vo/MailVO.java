package kr.or.ddit.caa.vo;

import lombok.Data;

@Data
public class MailVO {
	private String from;
	private String to;
	private String subject;
	private String contents;
}
