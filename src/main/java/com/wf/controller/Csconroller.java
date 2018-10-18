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

    @RequestMapping("/jsbselect01")
    @ResponseBody
    public List jsbselect01() {
        return se.jsbselect01();
    }

    @RequestMapping("/yhinsert01")
    @ResponseBody
    public int yhinsert01(@RequestParam Map map) {
        int c = se.yhinsert01(map);
        return 1;
    }
    @RequestMapping("/selectyh01")
    @ResponseBody
    public List selectyh01() {
        System.out.println("111");
        return se.selectyh01();
    }
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
