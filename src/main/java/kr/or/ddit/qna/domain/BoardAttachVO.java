package kr.or.ddit.qna.domain;

import java.util.List;

import lombok.Data;

@Data
public class BoardAttachVO {
	private Long bno;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;

}
