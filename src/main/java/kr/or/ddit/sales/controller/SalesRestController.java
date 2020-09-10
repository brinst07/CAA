package kr.or.ddit.sales.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.sales.domain.SigunguVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SalesAnalysisVO;
import kr.or.ddit.sales.service.SalesService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sales/rest")
@Log4j
public class SalesRestController {

	@Autowired
	private SalesService service;
	
	@GetMapping(value = "/div/{cs_code}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<CscodeVO>> csCodeList(@PathVariable("cs_code") String cs_code){

		
		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		List<CscodeVO> list = service.getCscodeList2(cs_code);
		

		return new ResponseEntity<List<CscodeVO>>(service.getCscodeList2(cs_code), HttpStatus.OK);
	}
	
	
//	@GetMapping(value = "/div/{sales_ser_name}/{sales_bd_name}",
//			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
//	public ResponseEntity<List<SalesAnalysisVO>> getSalesList(@PathVariable("sales_ser_name") String sales_ser_name, @PathVariable("sales_bd_name") String sales_bd_name){
//
//		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
//		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
//
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("sales_ser_name", sales_ser_name);
//		map.put("sales_bd_name", sales_bd_name);
//
//
//
//		return new ResponseEntity<List<SalesAnalysisVO>>(service.getSales(map), HttpStatus.OK);
//	}


	@GetMapping(value = "/sido/{sidoCode}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<SigunguVO>> getSalesList(@PathVariable("sidoCode") String sidoCode){

		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.

		List<SigunguVO> list = service.getSigunguList(sidoCode);

		return new ResponseEntity<List<SigunguVO>>(service.getSigunguList(sidoCode), HttpStatus.OK);
	}


	@GetMapping(value = "/table/{sigungu}/{large}/{middle}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<SalesAnalysisVO>> getSalesList(@PathVariable("sigungu") String sigungu, @PathVariable("large") String large, @PathVariable("middle") String middle){

		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		SigunguVO temp = service.getSigungu(sigungu);


		Map<String, String> map = new HashMap<String, String>();

		map.put("sigungu", temp.getSigungu_name());
		map.put("large", large);
		map.put("middle", middle);
		map.put("commercial_name", temp.getSigungu_name());

//		List<SalesAnalysisVO> list = service.getSales(map);




		return new ResponseEntity<List<SalesAnalysisVO>>(service.getSales(map), HttpStatus.OK);
	}
}
