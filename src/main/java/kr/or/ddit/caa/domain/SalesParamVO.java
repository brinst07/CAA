package kr.or.ddit.caa.domain;

import java.util.List;
import java.util.Map;

import lombok.Data;
@Data
public class SalesParamVO {
	
	private List<String> store_cs_code_name;
	private List<Map<String,String>> storeList;
	private String bungi;
}
