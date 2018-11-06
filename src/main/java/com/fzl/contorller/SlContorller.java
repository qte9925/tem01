package com.fzl.contorller;

import com.fzl.service.SlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
@Controller
public class SlContorller {
    @Autowired
    private SlService ss;
    @RequestMapping("select")
    @ResponseBody
    public List select(@RequestParam Map map){
        List list = ss.select(map);
        return list;
    }
    @RequestMapping("/insert")
    @ResponseBody
    public int insert(@RequestParam Map map){
       int i = ss.insert(map);
       return i;
    }
    @RequestMapping("/deleteA")
    @ResponseBody
    public int delete(@RequestParam Integer type_id){
       int i =  ss.delete(type_id);
       return i;
    }
    @RequestMapping("/updateA")
    @ResponseBody
    public int update(@RequestParam Map map){
       int i =  ss.update(map);
       return i;
    }
    @RequestMapping("/selectA")
    @ResponseBody
    public Map select01(@RequestParam int id){
       Map map = ss.select01(id);
       return map;
    }
}

