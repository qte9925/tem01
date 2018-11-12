package com.yzj.controller;

import com.yzj.service.BaomingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class BaomingController {
    @Autowired
    private BaomingService bs;
    @RequestMapping("AddBaomingYzj")
    @ResponseBody
    public int AddBaoming(@RequestParam Map map){
        int i = bs.AddBaomingyzj(map);
        return i;
    }
}
