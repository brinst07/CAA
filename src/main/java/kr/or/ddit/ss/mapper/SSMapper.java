package kr.or.ddit.ss.mapper;

import java.util.List;

import kr.or.ddit.caa.domain.CscodeVO;

public interface SSMapper {

	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
}
