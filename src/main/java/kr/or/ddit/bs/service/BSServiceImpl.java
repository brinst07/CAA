package kr.or.ddit.bs.service;

import kr.or.ddit.bs.mapper.BusinessStatusMapper;
import kr.or.ddit.caa.domain.CscodeVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@Log4j
@AllArgsConstructor
public class BSServiceImpl implements BSService{

	private BusinessStatusMapper mapper;

	@Override
	public List<CscodeVO> select(String code) {
		// TODO Auto-generated method stub
		return mapper.getDetailList(code);
	}
}
