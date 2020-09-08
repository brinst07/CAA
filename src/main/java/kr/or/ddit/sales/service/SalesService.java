package kr.or.ddit.sales.service;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SectorsVO;

import java.util.List;

public interface SalesService {
	public List<CscodeVO> getCscodeList(String depth);
	
	public List<CscodeVO> otherCscodeList(String keyword);

	public List<SectorsVO> sectorsList();
}
