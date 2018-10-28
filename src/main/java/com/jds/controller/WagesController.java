package com.jds.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.jds.service.WagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class WagesController {
  @Autowired
  private WagesService ws;
    @RequestMapping("selectWByid")
    @ResponseBody
    public Map selectWByid(@RequestParam Integer id){
        Map map=ws.selectWByid(id);
        System.out.print("根据id查询");
        return map;
    }
    @RequestMapping("selectSl")
    @ResponseBody
    public List selectSl(){
        List list=ws.selectSl();
        System.out.print("查询税率");
        return list;
    }
    @RequestMapping("selectBx")
    @ResponseBody
    public List selectBx(){
       /* List list=ws.selectBx();*/
        System.out.print("查询保险基数");
        return ws.selectBx();
    }
    @RequestMapping("selectGz")
    @ResponseBody
    public int selectGz(@RequestParam Map map){
        /* List list=ws.selectBx();*/
        int a= ws.selectGz(map);
        System.out.print("增加工资单");
        return a;
    }
    @RequestMapping("selectX")
    @ResponseBody
    public PageInfo<Map> selectX(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ws.selectX(map,page);
        return pageInfo;

    }
    @RequestMapping("insertX")
    @ResponseBody
    public int insertM(@RequestParam Map map){
        int a=ws.insertX(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("updateX")
    @ResponseBody
    public int updateX(@RequestParam Integer id){
        int a=ws.updateX(id);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("selectX1")
    @ResponseBody
    public PageInfo<Map> selectX1(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ws.selectX1(map,page);
        return pageInfo;

    }
    @RequestMapping("updateXs")
    @ResponseBody
    public int updateXs(@RequestParam Map map){
        int a=ws.updateXs(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("updateXb")
    @ResponseBody
    public int updateXb(@RequestParam Map map){
        int a=ws.updateXb(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("selectXb")
    @ResponseBody
    public List selectXb(@RequestParam Map map){
        List list=ws.selectXb(map);
        System.out.print("查询");
        return list;
    }
    @RequestMapping("selectXf")
    @ResponseBody
    public PageInfo<Map> selectXf(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ws.selectXf(map,page);
        return pageInfo;

    }
    @RequestMapping("updateXf")
    @ResponseBody
    public int updateXf(@RequestParam Map map){
        int a=ws.updateXf(map);
        System.out.print("查询");
        return a;
    }
}
