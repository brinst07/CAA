package kr.or.ddit.caa.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import kr.or.ddit.caa.domain.*;
import kr.or.ddit.caa.mapper.CAAMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j
@AllArgsConstructor
public class CAAServiceImpl implements CAAService {
	
	@Setter
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
	public List<SalesByIndustryVO> SalesByIndustryList(SalesParamVO vo) {

		return mapper.SalesByIndustryList(vo);
	}

	public List<StoreVO> getStoreList(SectorParamVO vo) {
		return mapper.getStoreList(vo);
	}

	@Override
	public List<Map<String, String>> getSectorCode(List<Map<String, String>> sectorFind) {
		List<Map<String, String>> getSectorFind = new ArrayList();

		for (int i = 0; i < sectorFind.size(); i++) {
			Map<String, String> sectorMap = new HashedMap();
			sectorMap.put("large", mapper.getSectorCode(sectorFind.get(i).get("large")));
			sectorMap.put("middle", mapper.getSectorCode(sectorFind.get(i).get("middle")));
			sectorMap.put("small", mapper.getSectorCode(sectorFind.get(i).get("small")));
//			sectorMap.put("mainTrarNm", mainTrarNm);
			getSectorFind.add(sectorMap);
		}

		return getSectorFind;
	}

	@Override
	public List<IndiVO> getIndiList(String var) {
		return mapper.getIndiList(var);
	}

	@Override
	public List<StoreCountInfoVO> getStoreCount(StoreCountVO storeCountVO) {
		return mapper.getStoreCount(storeCountVO);
	}

	@Override
	public List<SubwayPopVO> getFigureSubway(String jsonMapList) {

		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonMapList);

		System.out.println(jsonArray);

		Map<String, String> jsonMap = new HashMap<String, String>();

		List<SubwayPopVO> subwayPopList = new ArrayList<SubwayPopVO>();
		List<SubwayPopVO> subwayPopTempList = new ArrayList<SubwayPopVO>();

		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject jsonObject = (JsonObject) jsonArray.get(i);

			if ("circle".equals(jsonObject.get("type").toString().replace("\"", ""))) {
				jsonMap.put("LatitudeCenter", jsonObject.get("cy").toString());
				jsonMap.put("LongitudeCenter", jsonObject.get("cx").toString());
				jsonMap.put("LatitudeEndBoundary", jsonObject.get("ey").toString());
				jsonMap.put("LongitudeEndBoundary", jsonObject.get("ex").toString());
				jsonMap.put("LatitudeStartBoundary", jsonObject.get("sy").toString());
				jsonMap.put("LongitudeStartBoundary", jsonObject.get("sx").toString());
				jsonMap.put("selectName", jsonObject.get("name").toString());
				
				subwayPopTempList = mapper.getCircleSubway(jsonMap);

				for (SubwayPopVO subwayPopVO : subwayPopTempList) {
					subwayPopList.add(subwayPopVO);
				}
			}
			else if ("rectangle".equals(jsonObject.get("type").toString().replace("\"", ""))) {
				jsonMap.put("LatitudeMinY", jsonObject.get("miny").toString());
				jsonMap.put("LongitudeMinX", jsonObject.get("minx").toString());
				jsonMap.put("LatitudeMaxY", jsonObject.get("maxy").toString());
				jsonMap.put("LongitudeMaxY", jsonObject.get("maxx").toString());
				jsonMap.put("selectName", jsonObject.get("name").toString());
				
				subwayPopTempList = mapper.getRectangleSubway(jsonMap);
				
				for (SubwayPopVO subwayPopVO : subwayPopTempList) {
					subwayPopList.add(subwayPopVO);
				}
			}
		}

		System.out.println(subwayPopList);

		return subwayPopList;

	}

}
