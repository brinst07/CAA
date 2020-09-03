package kr.or.ddit.ss.mapper;

import kr.or.ddit.caa.domain.CscodeVO;

import java.util.List;

public interface SSMapper {

	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
}
