package kr.or.ddit.caa.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.IndiVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SalesParamVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;
import kr.or.ddit.caa.domain.SubwayPopVO;

public interface CAAMapper {
	
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
	
	public List<SalesByIndustryVO> SalesByIndustryList(SalesParamVO vo);
	/* 영현 ↓ */
	
	// 원에 포함된 지하철을 달별로 가져온다.
	List<SubwayPopVO> getCircleSubway(Map<String, String> point);
	/* 영현 ↑ */

	public List<StoreVO> getStoreList(SectorParamVO vo);

	public String getSectorCode(String sectorName);
	

    public List<IndiVO> getIndiList(String var);
}


