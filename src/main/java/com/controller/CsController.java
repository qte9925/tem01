package com.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CsController {
    @RequestMapping("/cs")
    public String cs() {
        return "cscx";
    }
}
