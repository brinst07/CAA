package kr.or.ddit.caa.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;

public interface CAAService {
	
	public List<CscodeVO> getCscodeList(String depth);
	

	public List<CscodeVO> otherCscodeList(String keyword);
	
	/* 영현 ↓ */
	public List<Map<String, String>> getSubwayPop(); // 나중에 파라미터로 지역 넣어야함
	/* 영현 ↑ */
}
