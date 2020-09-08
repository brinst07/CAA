package kr.or.ddit.caa.service;

import kr.or.ddit.caa.domain.*;

import java.util.List;
import java.util.Map;

public interface CAAService {
	
	public List<CscodeVO> getCscodeList(String depth);
	

	public List<CscodeVO> otherCscodeList(String keyword);
	
	public List<SalesByIndustryVO> SalesByIndustryList(SalesParamVO vo);

	/* 영현 ↓ */
	
	
	
	/**
	 * 원에 대한 내용이 들어 있다.원의 이름, 원의 중심 좌표, 시작 좌표, 끝 좌표
	 * @param jsonMapList
	 * @return
	 */
	public List<SubwayPopVO> getFigureSubway(String jsonMapList);
	
	/* 영현 ↑ */
	public List<StoreVO> getStoreList(SectorParamVO vo);

	public List<Map<String, String>> getSectorCode(List<Map<String, String>> sectorFind);


    public List<IndiVO> getIndiList(String var);

    public List<StoreCountInfoVO> getStoreCount(StoreCountVO storeCountVO);
}
