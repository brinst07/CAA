package kr.or.ddit.bs.mapper;

import java.util.List;


import kr.or.ddit.caa.domain.CscodeVO;

public interface BusinessStatusMapper {
	

	public List<CscodeVO> getDetailList(String code);
	
}
