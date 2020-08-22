package kr.or.ddit.ss.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.caa.domain.CscodeVO;
import kr.or.ddit.ss.service.SSService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/ss/rest")
@Log4j
@AllArgsConstructor
public class SSRestController {

	private SSService serivce;
	
	@GetMapping(value = "/div/{keyword}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<CscodeVO>> otherCscodeList(@PathVariable("keyword") String keyword){
		log.info("ajax를 통한 분류 선택");
		
		// Ajax는 view resolver나 tilesResolver로 가지 않기 때문에 Status 값을 넣어줘야한다.
		// 따라서 상태값을 같이 전달해주기 위해 ResponseEntity를 사용한다.
		return new ResponseEntity<List<CscodeVO>>(serivce.otherCscodeList(keyword),HttpStatus.OK);
	}
}
