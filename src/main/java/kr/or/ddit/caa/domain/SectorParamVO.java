package kr.or.ddit.caa.domain;

import lombok.Data;

import java.util.List;
import java.util.Map;
@Data
public class SectorParamVO {
	
	private List<String> store_cs_code_name;
	private List<Map<String,String>> storeList;
}
