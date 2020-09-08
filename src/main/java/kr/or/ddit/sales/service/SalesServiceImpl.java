package kr.or.ddit.sales.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SalesAnalysisVO;
import kr.or.ddit.sales.domain.SidoVO;
import kr.or.ddit.sales.domain.SigunguVO;
import kr.or.ddit.sales.mapper.SalesMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SalesMapper mapper;

	@Override
	public List<CscodeVO> getCscodeList(String depth) {
		return mapper.getCscodeList(depth);
	}

	@Override
	public List<CscodeVO> getCscodeList2(String cs_code) {
		return mapper.getCscodeList2(cs_code);
		
	}


	@Override
	public List<SidoVO> getSidoList() {
		return mapper.getSidoList();
	}

	@Override
	public List<SigunguVO> getSigunguList(String sido_code) {
		return mapper.getSigunguList(sido_code);
	}

	@Override
	public List<SalesAnalysisVO> getSales(Map<String, String> map) {
		return mapper.getSales(map);
	}


}
