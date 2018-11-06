package com.jds.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.Message;
import com.jds.entity.PageEntity;
import com.jds.service.WagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
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
    @RequestMapping("selectXf1")
    @ResponseBody
    public PageInfo<Map> selectXf1(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ws.selectXf1(map,page);
        return pageInfo;

    }
    @RequestMapping("updateXf")
    @ResponseBody
    public int updateXf(@RequestParam Map map){
        int a=ws.updateXf(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("uplode")
    @ResponseBody
    public Message file1(@RequestParam("fileinfo") MultipartFile file, HttpServletRequest request){
        Message message=null;
        String fileName=file.getOriginalFilename();
        System.out.println(fileName);
        fileName=(new Date()).getTime()+(Math.random()*1000)+fileName;
        File NewFile= new File("C:\\Users\\Administrator\\Workspaces\\MyEclipse 10\\tem01\\src\\main\\webapp\\jds\\imgs\\"+fileName);
        try {
            file.transferTo(NewFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        message = new Message(true, fileName);
        System.out.print(fileName+message);
        return message;

        }
    @RequestMapping("insertS")
    @ResponseBody
    public int insertS(@RequestParam Map map){
        int a=ws.insertS(map);
        System.out.print("查询");
        return a;
    }

    @RequestMapping("selectS")
    @ResponseBody
    public PageInfo<Map> selectS(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ws.selectS(map,page);
        return pageInfo;

    }
    @RequestMapping("selectSid")
    @ResponseBody
    public Map selectSid(@RequestParam Integer id){
        Map map=ws.selectSid(id);
        System.out.print("查询");
        return map;
    }
    @RequestMapping("updateS")
    @ResponseBody
    public int updateS(@RequestParam Map map){
        int a=ws.updateS(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("deleteS")
    @ResponseBody
    public int deleteS(@RequestParam Integer id){
        int a=ws.deleteS(id);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("updateSa")
    @ResponseBody
    public int updateSa(@RequestParam Map map){
        int a=ws.updateSa(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("selectSa")
    @ResponseBody
    public PageInfo<Map> selectSa(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=ws.selectSa(map,page);
        return pageInfo;

    }
    @RequestMapping("updateS1")
    @ResponseBody
    public int updateS1(@RequestParam Map map){
        int a=ws.updateS1(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("updateS2")
    @ResponseBody
    public int updateS2(@RequestParam Map map){
        int a=ws.updateS2(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("selectSy")
    @ResponseBody
    public Map selectSy(@RequestParam Integer id){
        Map map=ws.selectSy(id);
        System.out.print("查询");
        return map;
    }
    @RequestMapping("updateSs")
    @ResponseBody
    public int updateSs(@RequestParam Map map){
        int a=ws.updateSs(map);
        System.out.print("查询");
        return a;
    }
}
