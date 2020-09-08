package kr.or.ddit.sales.controller;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.sales.domain.SectorsVO;
import kr.or.ddit.sales.service.SalesService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sales/rest")
@Log4j
@AllArgsConstructor
public class SalesRestController {

	private SalesService serivce;
	
	@GetMapping(value = "/div",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<SectorsVO>> sectorsList(){

		
		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		List<SectorsVO> list = serivce.sectorsList();

		return new ResponseEntity<List<SectorsVO>>(serivce.sectorsList(), HttpStatus.OK);
	}
}
