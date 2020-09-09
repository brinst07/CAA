package kr.or.ddit.bs.service;

import kr.or.ddit.bs.domain.BusinessStatusParamVO;
import kr.or.ddit.bs.domain.BusinessStatusVO;
import kr.or.ddit.bs.mapper.BusinessStatusMapper;
import kr.or.ddit.caa.domain.CscodeVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Log4j
@AllArgsConstructor
public class BSServiceImpl implements BSService{
	@Autowired
	private BusinessStatusMapper mapper;

	@Override
	public List<String> select( ) {
		// TODO Auto-generated method stub
		return mapper.getDetailList();
	}

	@Override
	public List<BusinessStatusVO> getList(BusinessStatusParamVO vo) {
		// TODO Auto-generated method stub
		return mapper.getList(vo);
	}
	
	
}
