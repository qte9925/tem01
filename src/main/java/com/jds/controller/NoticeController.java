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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService ns;
    @RequestMapping("insertN")
    @ResponseBody
    public int insertN(@RequestParam Map map){
        Map map01 = new HashMap();
        List<Map> list01= ns.cc02(map01);
        for (int i=0;i<list01.size();i++){
            System.out.print(list01.get(i).get("ryid"));
            map.put("ryid",list01.get(i).get("ryid"));
            ns.insertN(map);
        }
        return 0;
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
    @RequestMapping("updateN")
    @ResponseBody
    public int updateN(@RequestParam Map map){
        int a=ns.updateN(map);
        System.out.print("增加");
        return a;
    }
    @RequestMapping("selectG")
    @ResponseBody
    public PageInfo<Map> selectG(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ns.selectG(map,page);
        return pageInfo;

    }
    @RequestMapping("selectG1")
    @ResponseBody
    public PageInfo<Map> selectG1(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ns.selectG1(map,page);
        return pageInfo;

    }
}
