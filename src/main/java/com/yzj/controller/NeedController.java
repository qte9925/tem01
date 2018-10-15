package com.yzj.controller;

import com.yzj.service.NeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class NeedController {
    @Autowired
    private NeedService ss;
    @RequestMapping("select")
    @ResponseBody
    public List selectNeedPeople(@RequestParam Map map){
    List list = ss.selectNeed(map);
    return list;
    }
}
