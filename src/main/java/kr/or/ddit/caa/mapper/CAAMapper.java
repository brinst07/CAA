package kr.or.ddit.caa.mapper;

import java.util.List;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;

public interface CAAMapper {
	
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);

	public List<StoreVO> getStoreList(SectorParamVO vo);
}
