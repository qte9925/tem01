package com.jds.controller;

import com.jds.service.IncometaxService;
import com.jds.service.InsuranceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class InsuranceController {
    @Autowired
    private InsuranceService ins;
    @RequestMapping("selectIn")
    @ResponseBody
    public List<Map> selectIn(@RequestParam Map map){
        List<Map> list=ins.selectIn(map);
        return list;

    }
    @RequestMapping("insertIn")
    @ResponseBody
    public int insertI(@RequestParam Map map){
        int a=ins.insertIn(map);
        System.out.print("查询");
        return a;
    }
    @RequestMapping("selectInByid")
    @ResponseBody
    public Map selectIByid(@RequestParam Integer id){
        Map map=ins.selectInByid(id);
        System.out.print("根据id查询");
        return map;
    }
    @RequestMapping("updateIn")
    @ResponseBody
    public int updateI(@RequestParam Map map){
        int  a=ins.updateIn(map);
        System.out.print("修改");
        return a;
    }
    @RequestMapping("deleteIn")
    @ResponseBody
    public int deleteI(@RequestParam Integer id){
        int  a=ins.deleteIn(id);
        System.out.print("删除");
        return a;
    }
}
