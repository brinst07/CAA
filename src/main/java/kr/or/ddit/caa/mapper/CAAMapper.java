package kr.or.ddit.caa.mapper;

import kr.or.ddit.caa.domain.*;
import kr.or.ddit.sales.domain.SidoVO;
import kr.or.ddit.sales.domain.SigunguVO;

import java.util.List;
import java.util.Map;

public interface CAAMapper {
	
	public List<SigunguVO> getSigunguList(String keyword);
	
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
	
	public List<SalesByIndustryVO> SalesByIndustryList(SalesParamVO vo);
	/* 영현 ↓ */

	// 원에 포함된 지하철을 달별로 가져온다.
	List<SubwayPopVO> getCircleSubway(Map<String, String> point);

	// 사각형에 포함된 지하철을 달별로 가져온다.
	public List<SubwayPopVO> getRectangleSubway(Map<String, String> point);
	/* 영현 ↑ */

	public List<StoreVO> getStoreList(SectorParamVO vo);

	public String getSectorCode(String sectorName);
	

    public List<IndiVO> getIndiList(String var);

    public List<StoreCountInfoVO> getStoreCount(StoreCountVO storeCountVO);
}


