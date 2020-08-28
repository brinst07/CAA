package kr.or.ddit.caa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;
import kr.or.ddit.caa.mapper.CAAMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class CAAServiceImpl implements CAAService {
	
	@Setter(onMethod_ = @Autowired)
	private CAAMapper mapper;
	
	@Override
	public List<CscodeVO> getCscodeList(String depth) {
		
		log.info("업종 선택 쿼리문");
		
		return mapper.getCscodeList(depth);
	}


	@Override
	public List<CscodeVO> otherCscodeList(String keyword) {
		return mapper.otherCscodeList(keyword);
	}


	@Override
	public List<SalesByIndustryVO> SalesByIndustryList(Map map) {
		
		return mapper.SalesByIndustryList(map);
	}

	public List<Map<String, String>> getSubwayPop() {
		return mapper.getSubwayPop();
	}

	public List<StoreVO> getStoreList(SectorParamVO vo) {
		return mapper.getStoreList(vo);
	}


	@Override
	public List<Map<String, String>> getSectorCode(List<Map<String, String>> sectorFind) {
		List<Map<String,String>> getSectorFind = new ArrayList();
		
		for(int i = 0; i<sectorFind.size(); i++) {
			Map<String,String> sectorMap = new HashedMap();
			sectorMap.put("large", mapper.getSectorCode(sectorFind.get(i).get("large")));
			sectorMap.put("middle", mapper.getSectorCode(sectorFind.get(i).get("middle")));
			sectorMap.put("small", mapper.getSectorCode(sectorFind.get(i).get("small")));
//			sectorMap.put("mainTrarNm", mainTrarNm);
			getSectorFind.add(sectorMap);
		}
		
		return getSectorFind;
	}




}
