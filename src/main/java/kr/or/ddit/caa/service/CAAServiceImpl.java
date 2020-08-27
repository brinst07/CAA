package kr.or.ddit.caa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;
import kr.or.ddit.caa.mapper.CAAMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class CAAServiceImpl implements CAAService {
	
	@Setter(onMethod_ = @Autowired)
	private CAAMapper mapper;
	
	@Override
	public List<CscodeVO> getCscodeList(String depth) {
		
		log.info("업종 선택 쿼리문");
		
		return mapper.getCscodeList(depth);
	}


	@Override
	public List<CscodeVO> otherCscodeList(String keyword) {
		return mapper.otherCscodeList(keyword);
	}


	@Override
	public List<StoreVO> getStoreList(SectorParamVO vo) {
		return mapper.getStoreList(vo);
	}




}
