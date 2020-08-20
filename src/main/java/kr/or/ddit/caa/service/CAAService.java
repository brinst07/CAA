package kr.or.ddit.caa.service;

import java.util.List;

import kr.or.ddit.caa.domain.CscodeVO;

public interface CAAService {
	
	public List<CscodeVO> getCscodeList(String depth);
}
