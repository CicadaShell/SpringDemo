package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/6/14.
 */

@Controller
public class HomepageController {

    @RequestMapping("/homepage")
    public String returnHomepage(HttpServletRequest request) {
        return "homepage";
    }
}
