package kr.or.ddit.caa.domain;

import lombok.Data;

import java.util.List;
import java.util.Map;
@Data
public class SectorJsonVo {
	private List<Map<String,String>> jsonMapList;
	private List<Map<String,String>> sectors;

	
}
