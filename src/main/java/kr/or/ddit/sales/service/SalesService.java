package kr.or.ddit.sales.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SalesAnalysisVO;
import kr.or.ddit.sales.domain.SidoVO;
import kr.or.ddit.sales.domain.SigunguVO;

public interface SalesService {
	
	/**
	 * 시군구 중 구를 가져오는 메소드
	 * @return List<SidoVO>
	 */
	public List<SidoVO> getSidoList();
	
	/**
	 * 시군구 중 로,역을 가져오는 메소드
	 * @param sido_code
	 * @return List<SigunguVO>
	 */
	public List<SigunguVO> getSigunguList(String sido_code);

	/**
	 *  시군구 코드를 이용하여 시군구 이름을 가져온다.
	 * @param str 시군구 코드
	 * @return SigunguVO
	 */
	public SigunguVO getSigungu(String str);
	
	/**
	 * 대분류 코드
	 * @param depth
	 * @return List<CscodeVO>
	 */
	public List<CscodeVO> getCscodeList(String depth);

	/**
	 * 중분류 코드
	 * @param cs_code
	 * @return List<CscodeVO>
	 */
	public List<CscodeVO> getCscodeList2(String cs_code);

	/**
	 * 테이블 값을 가져온다.
	 * @param map 1. 상권이름, 2. 분류코드 large, 3. 분류코드 middle
	 * @return List<SalesAnalysisVO>
	 */
	public List<SalesAnalysisVO> getSales(Map<String, String> map);
	
}
