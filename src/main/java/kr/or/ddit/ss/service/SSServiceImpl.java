package kr.or.ddit.ss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.ss.mapper.SSMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SSServiceImpl implements SSService{
	
	@Setter(onMethod_ = @Autowired)
	private SSMapper mapper;

	@Override
	public List<CscodeVO> getCscodeList(String depth) {
		
		log.info("업종 선택 쿼리문");
		return mapper.getCscodeList(depth);
	}

	@Override
	public List<CscodeVO> otherCscodeList(String keyword) {
		return mapper.otherCscodeList(keyword);
	}
	
	
	

	
	

}
