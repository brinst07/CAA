package kr.or.ddit.caa.domain;

import lombok.Data;

@Data
public class CscodeVO {
	private String cs_code; // 업종 분류 코드	
	private String cs_code_name; // 업종 분류 이름
	private String cs_code2; // 업종 다음 분류 코드
	private String cs_code_depth; // 업종의 깊이
}
