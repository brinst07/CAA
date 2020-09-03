package kr.or.ddit.bs.service;

import kr.or.ddit.caa.domain.CscodeVO;

import java.util.List;

public interface BSService {
	
	public List<CscodeVO> select(String code);
}
