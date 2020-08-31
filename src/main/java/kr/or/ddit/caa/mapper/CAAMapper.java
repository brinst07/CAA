package kr.or.ddit.caa.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;

public interface CAAMapper {
	
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
	
	public List<SalesByIndustryVO> SalesByIndustryList(Map map);
	/* 영현 ↓ */
	
	// 원에 포함된 지하철을 전부 가져온다.
	List<Map<String, String>> getCircleSubway();
	/* 영현 ↑ */

	public List<StoreVO> getStoreList(SectorParamVO vo);

	public String getSectorCode(String sectorName);
}
