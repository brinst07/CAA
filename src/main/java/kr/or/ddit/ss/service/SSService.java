package kr.or.ddit.ss.service;

import kr.or.ddit.caa.domain.CscodeVO;

import java.util.List;

public interface SSService {
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);
}
