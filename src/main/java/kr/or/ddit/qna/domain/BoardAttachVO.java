package kr.or.ddit.qna.domain;

import java.util.List;
import lombok.Data;

@Data
public class BoardAttachVO {
	private String board_id;
	private String file_id;

	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	
	
//	private Long bno;
//	private String uuid;
//	private String uploadPath;
//	private String fileName;
//	private boolean fileType;

}
