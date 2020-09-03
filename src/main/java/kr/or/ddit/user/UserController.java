package kr.or.ddit.user;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/user/*")
public class UserController {

    @GetMapping("/login")
    public String login(){
        return "/caa/user/login";
    }
}
