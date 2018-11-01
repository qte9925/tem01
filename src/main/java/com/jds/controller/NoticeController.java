package com.jds.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.jds.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService ns;
    @RequestMapping("insertN")
    @ResponseBody
    public int insertN(@RequestParam Map map){
        int a=ns.insertN(map);
        System.out.print("增加");
        return a;
    }
    @RequestMapping("selectN")
    @ResponseBody
    public PageInfo<Map> selectN(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ns.selectN(map,page);
        return pageInfo;

    }
    @RequestMapping("selectNa")
    @ResponseBody
    public Map selectNa(@RequestParam Integer id){
        Map map=ns.selectNa(id);
        System.out.print("增加");
        return map;
    }
}
