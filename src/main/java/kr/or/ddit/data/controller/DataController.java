package kr.or.ddit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/data")
@AllArgsConstructor
public class DataController {

    @GetMapping("/get")
    public String get() {
        return "caa/data/get";
    }
}
