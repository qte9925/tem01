package com.jds.controller;

import com.jds.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class StaffaController {
    @Autowired
    private StaffService ss;
    @RequestMapping("selectM")
    @ResponseBody
    public List selectM(@RequestParam Map map){
        List list=ss.selectM(map);
        return list;


    }
}
