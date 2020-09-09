package kr.or.ddit.bs.mapper;

import java.util.List;

import kr.or.ddit.bs.domain.BusinessStatusParamVO;
import kr.or.ddit.bs.domain.BusinessStatusVO;
import kr.or.ddit.caa.domain.CscodeVO;

public interface BusinessStatusMapper {
	

	public List<String> getDetailList( );

	public List<BusinessStatusVO> getList(BusinessStatusParamVO vo);
	
}
