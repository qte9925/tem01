package com.lx.contorller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.lx.service.lzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class lzContorller {
    @Autowired
    private lzService ls;
    @RequestMapping("lzinsetes")
    @ResponseBody
    public int lzinsetes(@RequestParam Map map){
        return ls.lzinsetes(map);
    }
    @RequestMapping("lzselect")
    @ResponseBody
    public List lzselect(@RequestParam Map map){
        return ls.lzselect(map);
    }
    @RequestMapping("lzdjselect")
    @ResponseBody
    public PageInfo<Map> lzdjselect(PageEntity page, Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ls.lzdjselect(map,page);
        return pageInfo;
    }
    @RequestMapping("lzdjupdate")
    @ResponseBody
    public int lzdjupdate(@RequestParam Map map){
        return ls.lzdjupdate(map);
    }
    @RequestMapping("lzzxselect")
    @ResponseBody
    public List lzzxselect(@RequestParam Map map){
        return ls.lzzxselect(map);
    }
    @RequestMapping("lzzxdelete")
    @ResponseBody
    public int lzzxdelete(@RequestParam  Map map){
        return ls.lzzxdelete(map);
    }
}
