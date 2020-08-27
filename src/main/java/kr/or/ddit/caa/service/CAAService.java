package kr.or.ddit.caa.service;

import java.util.List;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;

public interface CAAService {
	
	public List<CscodeVO> getCscodeList(String depth);
	

	public List<CscodeVO> otherCscodeList(String keyword);
	
	public List<StoreVO> getStoreList(SectorParamVO vo);
	
	
}
