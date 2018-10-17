package com.wf.controller;

import com.wf.service.Se;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class Csconroller {
    @Autowired
    private Se se;
    @RequestMapping("/login")
    @ResponseBody
    public int login(@RequestParam Map map){
        List list = se.login(map);
        if (list!=null){
            if (list.size()>0){
                return  0;
            }else{
                return  1;
            }
        }
        return 1;
    }
    @RequestMapping("/cs")
    public String cs() {
        return "";
    }
}
