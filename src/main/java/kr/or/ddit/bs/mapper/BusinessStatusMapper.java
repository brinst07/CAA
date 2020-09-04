package kr.or.ddit.bs.mapper;

import kr.or.ddit.caa.domain.CscodeVO;

import java.util.List;

public interface BusinessStatusMapper {
	

	public List<CscodeVO> getDetailList(String code);
	
}
