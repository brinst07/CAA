package kr.or.ddit.domain;

import lombok.Data;

@Data
public class BoardAttachVO {
	private Long bno;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;

}
