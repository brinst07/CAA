package kr.or.ddit.caa.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;
@Data
public class SectorJsonVo {
	private String radius;
	private String cx;
	private String cy;
	private List<Map<String,String>> sectors;

	
}
