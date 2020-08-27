package kr.or.ddit.caa.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;

public interface CAAMapper {
	
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
	
	/* 영현 ↓ */
	public List<Map<String, String>> getSubwayPop(); // 나중에 파라미터로 지역 넣어야함
	/* 영현 ↑ */

	public List<StoreVO> getStoreList(SectorParamVO vo);
}
