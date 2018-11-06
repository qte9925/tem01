package com.jds.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jds.entity.PageEntity;
import com.jds.service.BusinessService;
import com.jds.service.NoticeService;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BusinessController {
    @Autowired
    private BusinessService bs;
    @RequestMapping("selectGzx")
    @ResponseBody
    public List<Map> selectGz( @RequestParam Map map){
        List<Map> list=bs.selectGz(map);

        return list;

    }
    @RequestMapping("insertGz")
    @ResponseBody
    public int insertN(@RequestParam Map map, HttpServletRequest request){
        Map map01 = new HashMap();
        map01.put("gzyf", request.getParameter("gzyf"));
        List<Map> list01= bs.selectGz(map01);
        System.out.print(list01+"aaa");
        for (int i=0;i<list01.size();i++){
            System.out.print(list01.get(i).get("ygid"));
            map.put("ydid",list01.get(i).get("ygid"));
            map.put("xz",list01.get(i).get("xz"));
            map.put("jxjin",list01.get(i).get("jxjin"));
            map.put("yanglaobx",list01.get(i).get("yanglaobx"));
            map.put("shiyebx",list01.get(i).get("shiyebx"));
            map.put("yiliaobx",list01.get(i).get("yiliaobx"));
            map.put("sybx",list01.get(i).get("sybx"));
            map.put("gsbx",list01.get(i).get("gsbx"));
            map.put("zfgjj",list01.get(i).get("zfgjj"));
            map.put("cd",list01.get(i).get("cd"));
            map.put("qj",list01.get(i).get("qj"));
            map.put("zt",list01.get(i).get("zt"));
            map.put("kg",list01.get(i).get("kg"));
            map.put("sjgz",list01.get(i).get("sjgz"));
            map.put("bf",list01.get(i).get("bf"));
            /* map.put("state",list01.get(i).get("state"));*/
            bs.insertGz(map);
            /*ydid,xz,jxjin,yanglaobx,shiyebx,yiliaobx,sybx,gsbx,zfgjj,cd,qj,zt,kg,sjgz,state,bz,bz1*/
        }
        return 0;
    }
    @RequestMapping("insertBf")
    @ResponseBody
    public int insertBf(@RequestParam Map map){
        int a=bs.insertBf(map);
        return a;
    }
    @RequestMapping("selectBf")
    @ResponseBody
    public PageInfo<Map> selectBf(PageEntity page, @RequestParam Map map){
        PageHelper.startPage(page.getNowPage(), page.getRowSize());
        if(page==null)page=new PageEntity();
        PageInfo<Map> pageInfo=bs.selectBf(map,page);
        return pageInfo;

    }
    @RequestMapping("selectGza")
    @ResponseBody
    public List<Map> selectGza( @RequestParam Map map){
        List<Map> list=bs.selectGza(map);

        return list;

    }
    @RequestMapping("selectGzId")
    @ResponseBody
    public Map selectGzId( @RequestParam Integer id){
        Map map=bs.selectGzId(id);
        return map;

    }
    @RequestMapping("updateGz")
    @ResponseBody
    public int updateGz(@RequestParam Map map){
        int a=bs.updateGz(map);
        return a;
    }
    @RequestMapping("updateGza")
    @ResponseBody
    public int updateGza(@RequestParam Map map,HttpServletRequest request){
        for (int i=0;i<map.size();i++){
            map.put("lcid",request.getParameter("lcid"));
            map.put("bz",request.getParameter("bz"));
            bs.updateGza(map);
            System.out.print(map);
        }
        return 0;
    }
}
