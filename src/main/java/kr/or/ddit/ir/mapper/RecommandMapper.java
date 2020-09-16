package kr.or.ddit.ir.mapper;

import kr.or.ddit.ir.domain.SectorsLargeLevelVO;
import kr.or.ddit.ir.domain.SectorsLargeMiddleVO;
import kr.or.ddit.ir.domain.SectorsMiddleLevelVO;
import kr.or.ddit.ir.domain.SectorsTypeVO;

import java.util.List;

public interface RecommandMapper {

	/**
	 * 상권의 대분류 등급 가져오기
	 * @param areaName (상권 지역 이름)
	 * @return List<SectorsLargeLevelVO>
	 */
    public List<SectorsLargeLevelVO> getSectorsLargeLevel(String areaName);
    
    /**
     * 상권의 중분류 등급 가져오기
     * @param areaName (상권 지역 이름)
     * @return List<SectorsMiddleLevelVO>
     */
    public List<SectorsMiddleLevelVO> getSectorsMiddleLevel(String areaName);
    
    /**
     * 상권 유형에 대한 정보 가져오기
     * @param areaName (상권 지역 이름)
     * @return List<SectorsTypeVO>
     */
    public List<SectorsTypeVO> getSectorsType(String areaName);
    
    /**
     * 상권에 대한 대분류 중분류에 대한 상점 수를 가져온다.
     * @param areaName
     * @return List<SectorsLargeMiddleVO>
     */
    public List<SectorsLargeMiddleVO> getSectorsLargeMiddle(String areaName);
}
 