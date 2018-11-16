package com.yzj.controller;

import com.github.pagehelper.PageInfo;
import com.yzj.entity.PageEntity;
import com.yzj.service.ShenpitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class ShenpitController {
    @Autowired
    private ShenpitService spits;
    @RequestMapping("StatuOne")
    @ResponseBody
    public PageInfo<Map> selectshenpiren(PageEntity page, @RequestParam Map map){
        if(page==null) page = new PageEntity();
        PageInfo<Map> pageinfo = spits.selectShenpit(page,map);
        return pageinfo;
    }
}
