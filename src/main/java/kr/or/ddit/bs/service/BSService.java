package kr.or.ddit.bs.service;

import kr.or.ddit.bs.domain.BusinessStatusParamVO;
import kr.or.ddit.bs.domain.BusinessStatusResultVO;
import kr.or.ddit.bs.domain.BusinessStatusVO;
import kr.or.ddit.caa.domain.CscodeVO;

import java.util.List;

public interface BSService {
	
	public List<String> select();
	public List<BusinessStatusResultVO> getList(BusinessStatusParamVO vo);
}
