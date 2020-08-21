package kr.or.ddit.bs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.caa.domain.CscodeVO;

public interface BSService {
	public List<CscodeVO> getSectorsList(String string);

}
