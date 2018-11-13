package com.yzj.controller;

import com.yzj.service.BecomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class BecomeController {
    @Autowired
    private BecomeService bs;
    @RequestMapping("selectBecome")
    @ResponseBody
    public List<Map> selectasc(@RequestParam Map map){
        return bs.selectZ(map);
    }
    @RequestMapping("updateBecome")
    @ResponseBody
    public int updateasc(@RequestParam Map map){
        int i = bs.updateZ(map);
        return i;
    }
}
