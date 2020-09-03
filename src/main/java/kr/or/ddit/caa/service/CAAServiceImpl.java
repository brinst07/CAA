package kr.or.ddit.caa.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.caa.domain.SalesByIndustryVO;
import kr.or.ddit.caa.domain.SectorParamVO;
import kr.or.ddit.caa.domain.StoreVO;
import kr.or.ddit.caa.domain.SubwayPopVO;
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
	public List<SalesByIndustryVO> SalesByIndustryList(Map map) {

		return mapper.SalesByIndustryList(map);
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
	public List<SubwayPopVO> getFigureSubway(String jsonMapList) {

		JsonParser jsonParser = new JsonParser();
		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonMapList);
		
		System.out.println(jsonArray);
		
		Map<String, String> jsonMap = new HashMap<String, String>();
		
		List<SubwayPopVO> subwayPopList = new ArrayList<SubwayPopVO>(); 
		List<SubwayPopVO> subwayPopTempList = new ArrayList<SubwayPopVO>(); 
		
		
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject jsonObject = (JsonObject) jsonArray.get(i);
			jsonMap.put("LatitudeCenter", jsonObject.get("cy").toString());
			jsonMap.put("LongitudeCenter", jsonObject.get("cx").toString());
			jsonMap.put("LatitudeEndBoundary", jsonObject.get("ey").toString());
			jsonMap.put("LongitudeEndBoundary", jsonObject.get("ex").toString());
			jsonMap.put("LatitudeStartBoundary", jsonObject.get("sy").toString());
			jsonMap.put("LongitudeStartBoundary", jsonObject.get("sx").toString());
			jsonMap.put("selectName", jsonObject.get("name").toString());
			System.out.println(jsonMap);
			subwayPopTempList = mapper.getCircleSubway(jsonMap);
			
			for (SubwayPopVO subwayPopVO : subwayPopTempList) {
				subwayPopList.add(subwayPopVO);
			}
		}
		
		System.out.println(subwayPopList);
		
		
		
return subwayPopList;		
		
		/*
		JsonParser jsonParser = new JsonParser();

		JsonArray jsonArray = (JsonArray) jsonParser.parse(jsonMapList);
		System.out.println(jsonArray);

		// 지하철 선택영역 이름 별로 담기
		Map<String, List<Map<String, String>>> eachSelectionListMapList = new HashMap<String, List<Map<String, String>>>();

		// 지하철 선택영역 1개 담기
		List<Map<String, String>> subwayListMap = new ArrayList<Map<String, String>>();

		// 달별 인구 합계
		List<Map<String, String>> sumMonthSubway = new ArrayList<Map<String, String>>();
		
		System.out.println("========================================FFFFFFFFFFFF=======================================================================");
		System.out.println(jsonArray.size());

		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject jsonObject = (JsonObject) jsonArray.get(i);
			System.out.println(jsonObject.get("type").toString().split("\""));
			String[] typeSplit = jsonObject.get("type").toString().split("\"");
			System.out.println(typeSplit[1]);
			System.out.println("circle".equals(jsonObject.get("type").toString()));
			System.out.println("이름 : " + jsonObject.get("name"));
			String nameTemp = jsonObject.get("name").toString().replace("\"", "");
			System.out.println(nameTemp);



			if ("circle".equals(typeSplit[1])) {

				// 1. 기준 거리를 구한다.
				// 2. 기준 거리를 가지고 원 안에 있는 좌표들을 구한다. list

				// 1. 기준 좌표 구함(센터 좌표, 거리, 선택 영역 이름)
				Map<String, String> standardDistanceMap = standardCircleDistance(jsonObject);

				// 2. 원 안에 있는 지하철을 구함(지하철이 2개 이상일 수 있음) List<Map<String, String>>
				subwayListMap = getCircleSubwayListMap(standardDistanceMap);
				System.out.println(subwayListMap);
				System.out.println(subwayListMap.get(0).get("year"));
				System.out.println(subwayListMap.get(0).get("month"));
				System.out.println("여기");
				System.out.println(subwayListMap.get(0).get("MONTH"));
				BigDecimal bigDecimal=new BigDecimal(subwayListMap.get(1).get("MONTH"));
				
				System.out.println(bigDecimal.toString());

				// 3. 같은 원 안에 지하철 역이 여러개 라면 같은 월끼리 더한다.

				
				
				for (int j = 0; j < subwayListMap.size(); j++) {
					Map<String, String> tempMap = new HashMap<String, String>();
					for (int j2 = 0; j2 < subwayListMap.size(); j2++) {
						if (subwayListMap.get(j).get("YEAR").equals(subwayListMap.get(j2).get("YEAR"))
								&& subwayListMap.get(j).get("MONTH").equals(subwayListMap.get(j2).get("MONTH"))) {
							int tempIntSum;
							String tempj = subwayListMap.get(j).get("YEAR");
							String tempj2 = subwayListMap.get(j2).get("YEAR");
							tempMap.put("YEAR", tempj);
							tempj = subwayListMap.get(j).get("MONTH");
							tempj2 = subwayListMap.get(j2).get("MONTH");
							tempMap.put("MONTH", tempj);
							tempj = subwayListMap.get(j).get("RIDE");
							tempj2 = subwayListMap.get(j2).get("RIDE");
							tempIntSum = Integer.parseInt(tempj)+Integer.parseInt(tempj2);
							tempMap.put("RIDE", Integer.toString(tempIntSum));
							tempj = subwayListMap.get(j).get("QUIT");
							tempj2 = subwayListMap.get(j2).get("QUIT");
							tempIntSum = Integer.parseInt(tempj)+Integer.parseInt(tempj2);
							tempMap.put("QUIT", Integer.toString(tempIntSum));

						}
					}
							sumMonthSubway.add(tempMap);
				}

//				eachSelectionListMapList.put(nameTemp, value) // value에 완성된 List 값을 넣어야 한다

			} else if ("rectangle".equals(typeSplit[1])) {

			} else if ("polygon".equals(typeSplit[1])) {

			} // else 상권은 아직 구현 ㄴㄴ

		}

		return sumMonthSubway;
		 */
		
	}

	/**
	 * 원의 시작 좌표와 중심 좌표를 이용해서 각각의 원에 대한 두 점 사이이의 거리를 구한다.
	 * 
	 * @param jsonArray
	 * @return List<Map<String, String>>
	 */
//	private Map<String, String> standardCircleDistance(JsonObject jsonObject) {
//		Map<String, String> jsonMap = new HashMap<String, String>();
//
//		// 원의 이름
//		String name = jsonObject.get("name").toString();
//		/* 원의 중심, 시작 좌표, 점의 거리(두점 사이의 거리) ↓ */
//		// 중심 좌표
//		String cxString = jsonObject.get("cx").toString();
//		String cyString = jsonObject.get("cy").toString();
//		double cxDouble = Double.parseDouble(cxString);
//		double cyDouble = Double.parseDouble(cyString);
//
//		// 시작 좌표
//		String sxString = jsonObject.get("sx").toString();
//		String syString = jsonObject.get("sy").toString();
//		double sxDouble = Double.parseDouble(sxString);
//		double syDouble = Double.parseDouble(syString);
//
//		// 두점의 x, y의 차 구하기
//		double xPointSumDouble = Math.pow((cxDouble - sxDouble), 2);
//		double yPointSumDouble = Math.pow((cyDouble - syDouble), 2);
//
//		// 두점의 거리 구하기
//		double xyDistance = xPointSumDouble + yPointSumDouble;
//		String circleDistance = Double.toString(xyDistance);
//
//		/* 원의 중심, 시작 좌표, 점의 거리(두점 사이의 거리) ↑ */
//
//		/* 원하는 값 넣어서 return */
//		jsonMap.put("name", name);
//		jsonMap.put("xyDistance", circleDistance);
//		jsonMap.put("cxString", cxString);
//		jsonMap.put("cyString", cyString);
//
//		return jsonMap;
//	}

	/**
	 * 1. 원을 기준으로 하여 원 안의 좌표에 속한 지하철역 구하기 2. 원의 중심 좌표와 시작 좌표를 이용하여 두점 사이의 거리 구하기 3.
	 * DB에서 지하철의 좌표를 가지고 와서 기준 거리 standardDistance 를 이용하여 원 안의 좌표만 구하기
	 * 
	 * @param centerX
	 * @param centerY
	 * @return List<Map<String, String>> 1. 지하철 역의 이름, 2. 지하철 역의 위도, 경도
	 */
	/*
	private List<Map<String, String>> getCircleSubwayListMap(Map<String, String> standardDistanceMap) {
		List<Map<String, String>> getCircleSubwayListMap = new ArrayList<Map<String, String>>();

		List<Map<String, String>> getcircleSubwaytemp = mapper.getCircleSubway();
		System.out.println(standardDistanceMap);
		String circleDistance = standardDistanceMap.get("xyDistance");
		String cx = standardDistanceMap.get("cxString");
		String cy = standardDistanceMap.get("cyString");

		for (int i = 0; i < getcircleSubwaytemp.size(); i++) {
			Map<String, String> map = getcircleSubwaytemp.get(i);
			System.out.println(map);
			String Latitude = map.get("LATITUDE"); // 위도
			String Longitude = map.get("LONGITUDE"); // 경도

			double x = Math.pow(Double.parseDouble(cx) - Double.parseDouble(Latitude), 2);
			double y = Math.pow(Double.parseDouble(cy) - Double.parseDouble(Longitude), 2);
			double xy = x + y;
			System.out.println(xy);

			if (Double.parseDouble(circleDistance) >= xy) {
				getCircleSubwayListMap.add(map);
			}

		}
		System.out.println(getCircleSubwayListMap);

		return getCircleSubwayListMap;
	}
	*/

}
