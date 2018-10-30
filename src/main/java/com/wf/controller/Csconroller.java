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

    @RequestMapping("/zjht")
    @ResponseBody
    public int zjht(@RequestParam Map map) {
        System.out.println(map);
        return se.zjht(map);
    }

    @RequestMapping("/htnrcx001")
    @ResponseBody
    public List htnrcx(@RequestParam Map map) {
        return se.htnrcx(map);
    }

    @RequestMapping("/ygbid")
    @ResponseBody
    public List ygbid(@RequestParam Map map) {
        return se.ygbid(null);
    }

    @RequestMapping("/htlxcx")
    @ResponseBody
    public List htlxcx(@RequestParam Map map) {
        return se.htlxcx(null);
    }
    @RequestMapping("/gscx")
    @ResponseBody
    public List gscx(@RequestParam Map map) {
        return se.gscx(null);
    }
    @RequestMapping("/cxjsqx01")
    @ResponseBody
    public List cxjsqx01(@RequestParam Map map) {
        System.out.println(map);
        return se.cxjsqx01(map);
    }
    @RequestMapping("/cxjsb02")
    @ResponseBody
    public List cxjsb02() {
        return se.cxjsb02(null);
    }
    @RequestMapping("/cxqxb")
    @ResponseBody
    public List cxqxb(@RequestParam Map map) {
//        System.out.println(map);
        return se.cxqxb(null);
    }
    @RequestMapping("/rlsq")
    @ResponseBody
    public List rlsq() {
        return se.rlsq();
    }

    @RequestMapping("/rybdleixingchaxun")
    @ResponseBody
    public List rybdleixingchaxun() {
        return se.rybdleixingchaxun();
    }

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
    @RequestMapping("/yhinsert02")
    @ResponseBody
    public int yhinsert02(@RequestParam Map map) {
        return se.yhinsert02(map);
    }
    @RequestMapping("/selectyh01")
    @ResponseBody
    public List selectyh01() {
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
    @RequestMapping("/wfcs")
    public String cs() {
        System.out.println("cs代码");
        return "index";
    }
}
