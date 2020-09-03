package kr.or.ddit.domain;


import lombok.Data;

@Data
public class BoardAttachVO {
	private String board_id;
	private String file_id;
	private String uuid;

	private String uploadPath;
	private String fileName;
	private boolean fileType;
	

}
