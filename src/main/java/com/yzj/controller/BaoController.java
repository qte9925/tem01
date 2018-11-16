package com.yzj.controller;

import com.yzj.service.BaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class BaoController {
    @Autowired
    private BaoService BaoS;
    @RequestMapping("SelectBaoMingStatu")
    @ResponseBody
    public List baomingzhuangtai(@RequestParam Map map){
       List list = BaoS.selectBaomingstatu(map);
       System.out.print(list);
        return list;
    }
}
