package kr.or.ddit.ss.service;

import java.util.List;

import kr.or.ddit.caa.domain.CscodeVO;

public interface SSService {
	public List<CscodeVO> getCscodeList(String depth);
}
