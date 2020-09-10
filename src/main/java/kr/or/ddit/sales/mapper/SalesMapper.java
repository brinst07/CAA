package kr.or.ddit.sales.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SalesAnalysisVO;
import kr.or.ddit.sales.domain.SidoVO;
import kr.or.ddit.sales.domain.SigunguVO;

public interface SalesMapper {

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


	public List<SalesAnalysisVO> getSales(Map<String, String> map);
	
	

}
