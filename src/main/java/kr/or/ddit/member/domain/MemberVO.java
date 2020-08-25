package kr.or.ddit.member.domain;

import lombok.Data;

@Data
public class MemberVO {
	
	private String member_id          ;
	private String member_password    ;
	private String member_email       ;
	private String member_enabled     ;
	private String member_username    ;
	
	
}
