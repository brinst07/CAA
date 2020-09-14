package kr.or.ddit.ir.controller;

import kr.or.ddit.ir.domain.SectorsLargeLevelVO;
import kr.or.ddit.ir.domain.SectorsMiddleLevelVO;
import kr.or.ddit.ir.service.RecommandService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@Log4j
@RequestMapping("/ir/*")
public class RecommendController {

	@Autowired
	private RecommandService service;

	@GetMapping("/irSelectPage")
	public String caaSelect(Model model) {

		return "caa/ir/recommendSelectPage";
	}

	@GetMapping("/recommendSectorsLevel")
	public String caaArea(@RequestParam("areaName") String sales_bd_name, Model model, HttpSession session) {

		session.setAttribute("sales_bd_name", sales_bd_name);

		List<SectorsLargeLevelVO> LargeLevelList = service.getSectorsLargeLevel(sales_bd_name);
		List<SectorsMiddleLevelVO> MiddleLevelList = service.getSectorsMiddleLevel(sales_bd_name);

		// List 를 JSON 형태로 바꿔 주기 위해 사용
		Gson gson = new Gson();
		String SectorsLargeLevel = gson.toJson(LargeLevelList);
		String SectorsMiddleLevel = gson.toJson(MiddleLevelList);

		model.addAttribute("SectorsLargeLevel", SectorsLargeLevel);
		model.addAttribute("SectorsMiddleLevel", SectorsMiddleLevel);

		return "caa/ir/recommendSectorsLevel";

	}
}
