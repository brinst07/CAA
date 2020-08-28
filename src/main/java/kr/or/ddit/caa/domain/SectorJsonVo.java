package kr.or.ddit.caa.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;
@Data
public class SectorJsonVo {
	private List<Map<String,String>> jsonMapList;
	private List<Map<String,String>> sectors;

	
}
