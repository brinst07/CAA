package kr.or.ddit.history.controller;

import javax.servlet.http.HttpServlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/history/*")
@AllArgsConstructor
public class HistoryController{
	
	@GetMapping("/selectHistory")
	public String selectHistory() {
		
		log.info("selectHistory");
	
		return "caa/history/selectHistory";
	}
	
	
	
//	@GetMapping("/callArea")
//	public void caaArea(String areaName){
//		log.warn(areaName);
//	}
	
	
}
