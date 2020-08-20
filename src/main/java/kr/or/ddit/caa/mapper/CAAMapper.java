package kr.or.ddit.caa.mapper;

import java.util.List;

import kr.or.ddit.caa.domain.CscodeVO;

public interface CAAMapper {
	
	public List<CscodeVO> getCscodeList(String depth);
}
