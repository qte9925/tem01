package com.wf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Csconroller {
    @RequestMapping("/cs")
    public String cs() {
        return "";
    }
}
