package kr.or.ddit.bs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.bs.mapper.BusinessStatusMapper;
import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.mapper.CAAMapper;
import kr.or.ddit.caa.service.CAAServiceImpl;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class BSServiceImpl implements BSService{
	
	@Setter(onMethod_ = @Autowired)
	private BusinessStatusMapper mapper;
	
	
	@Override
	public List<CscodeVO> getSectorsList(String string) {
		log.info("세부 업종 선택 쿼리문");
		return mapper.getSectorsList(string);
	}
}
