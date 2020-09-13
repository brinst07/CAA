package kr.or.ddit.ir.service;

import kr.or.ddit.ir.domain.SectorsLargeLevelVO;
import kr.or.ddit.ir.domain.SectorsMiddleLevelVO;
import kr.or.ddit.ir.mapper.RecommandMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
@AllArgsConstructor
public class RecommandServiceImpl implements RecommandService{

    @Setter
    private RecommandMapper mapper;


    @Override
    public List<SectorsLargeLevelVO> getSectorsLargeLevel(String areaName) {
        return mapper.getSectorsLargeLevel(areaName);
    }

    @Override
    public List<SectorsMiddleLevelVO> getSectorsMiddleLevel(String areaName) {
        return mapper.getSectorsMiddleLevel(areaName);
    }
 

}
