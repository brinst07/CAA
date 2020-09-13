package kr.or.ddit.ir.controller;

import kr.or.ddit.ir.domain.SectorsLargeLevelVO;
import kr.or.ddit.ir.service.RecommandService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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
    public String caaArea(@RequestParam("areaName") String sales_bd_name, Model model) {

        List<SectorsLargeLevelVO> list = service.getSectorsLargeLevel(sales_bd_name);
        model.addAttribute("SectorsLargeLevel",service.getSectorsLargeLevel(sales_bd_name));
        model.addAttribute("SectorsMiddleLevel",service.getSectorsMiddleLevel(sales_bd_name));

        return "caa/ir/recommendSectorsLevel";

    }
}
