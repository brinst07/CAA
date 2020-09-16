package kr.or.ddit.admin.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private String member_username;
	private String member_email;
	private String member_auth;
}
