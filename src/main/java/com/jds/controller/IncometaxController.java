package com.jds.controller;

import com.jds.service.IncometaxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class IncometaxController {
    @Autowired
    private IncometaxService is;
    @RequestMapping("selectI")
    @ResponseBody
    public List<Map> selectI(@RequestParam Map map){
        List<Map> list=is.selectI(map);
        return list;

    }
    @RequestMapping("insertI")
    @ResponseBody
    public int insertI(@RequestParam Map map){
        int a=is.insertI(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("selectIByid")
    @ResponseBody
    public Map selectIByid(@RequestParam Integer id){
        Map map=is.selectIByid(id);
        System.out.print("根据id查询");
        return map;
    }
    @RequestMapping("updateI")
    @ResponseBody
    public int updateI(@RequestParam Map map){
        int  a=is.updateI(map);
        System.out.print("修改");
        return a;
    }
    @RequestMapping("deleteI")
    @ResponseBody
    public int deleteI(@RequestParam Integer id){
        int  a=is.deleteI(id);
        System.out.print("删除");
        return a;
    }
}
