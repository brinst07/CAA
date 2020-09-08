package kr.or.ddit.sales.service;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SectorsVO;
import kr.or.ddit.sales.mapper.SalesMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class SalesServiceImpl implements SalesService {
	
	@Setter
	private SalesMapper mapper;

	@Override
	public List<CscodeVO> getCscodeList(String depth) {
		

		return mapper.getCscodeList(depth);
	}

	@Override
	public List<CscodeVO> otherCscodeList(String keyword) {
		return mapper.otherCscodeList(keyword);
	}

	@Override
	public List<SectorsVO> sectorsList() {
		return mapper.sectorsList();
	}


}
