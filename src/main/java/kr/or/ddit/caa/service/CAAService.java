package kr.or.ddit.caa.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;
import kr.or.ddit.caa.domain.SubwayPopVO;

public interface CAAService {
	
	public List<CscodeVO> getCscodeList(String depth);
	

	public List<CscodeVO> otherCscodeList(String keyword);
	
	public List<SalesByIndustryVO> SalesByIndustryList(Map map);

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
	
	
}
