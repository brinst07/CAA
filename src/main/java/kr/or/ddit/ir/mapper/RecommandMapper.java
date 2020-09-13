package kr.or.ddit.ir.mapper;

import kr.or.ddit.ir.domain.SectorsLargeLevelVO;
import kr.or.ddit.ir.domain.SectorsMiddleLevelVO;

import java.util.List;

public interface RecommandMapper {

    public List<SectorsLargeLevelVO> getSectorsLargeLevel(String areaName);
    public List<SectorsMiddleLevelVO> getSectorsMiddleLevel(String areaName);
}
 